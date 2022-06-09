local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	print("Couldn't require 'null-ls'!")
	return
end
local ok, null_helpers = pcall(require, 'null-ls.helpers')
if not ok then
	print("Couldn't require 'null-ls.helpers'!")
	return
end

-- Test DIAGNOSTICS to make sure it works: 
-- https://github.com/jose-elias-alvarez/null-ls.nvim#parsing-buffer-content 
local no_really = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "markdown", "text" },
	generator = {
		fn = function(params)
			local diagnostics = {}
			-- sources have access to a params object
			-- containing info about the current file and editor state
			for i, line in ipairs(params.content) do
				local col, end_col = line:find("really")
				if col and end_col then
					-- null-ls fills in undefined positions
					-- and converts source diagnostics into the required format
					table.insert(diagnostics, {
						row = i,
						col = col,
						end_col = end_col,
						source = "no-really",
						message = "Don't use 'really!'",
						severity = 2,
					})
				end
			end
			return diagnostics
		end,
	},
}

null_ls.register(no_really)
-- End example

-- CFN-Lint config
-- https://np.reddit.com/r/neovim/comments/p9wjg3/cloudformation_with_nvim_lsp/
local cfn_lint = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = {'yaml'},
	generator = null_helpers.generator_factory({
		command = "cfn-lint",
		to_stdin = true,
		to_stderr = true,
		args = { "--format", "parseable", "-" },
		format = "line",
		check_exit_code = function(code)
			return code == 0 or code == 255
		end,

		on_output = function(line, params)
			local row, col, end_row, end_col, code, message = line:match(":(%d+):(%d+):(%d+):(%d+):(.*):(.*)")
			local severity = null_helpers.diagnostics.severities['error']

			if message == nil then
				return nil
			end

			if vim.startswith(code, "E") then
				severity = null_helpers.diagnostics.severities['error']
			elseif vim.startswith(code, "W") then
				severity = null_helpers.diagnostics.severities['warning']
			else
				severity = null_helpers.diagnostics.severities['information']
			end

			return {
				message = message,
				code = code,
				row = row,
				col = col,
				end_col = end_col,
				end_row = end_row,
				severity = severity,
				source = "cfn-lint",
			}
		end,
	})
}
null_ls.register(cfn_lint)

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
		-- default args to golangci use `--fast` which hide errors
		diagnostics.golangci_lint.with({
			args = { "run", "-v", "--fix=false", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" }
		}),
	},
})

