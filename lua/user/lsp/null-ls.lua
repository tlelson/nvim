local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	print("Couldn't require 'null-ls'!")
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

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier,  -- use .editorconfig
		formatting.black.with({ extra_args = { "--fast" } }),
		--formatting.stylua,  -- Sumneko lua handles this
		--diagnostics.flake8,
		diagnostics.cfn_lint.with({ filetypes = { "cfn" } }),
		-- default args to golangci use `--fast` which hide errors
		diagnostics.golangci_lint.with({
			args = { "run", "-v", "--fix=false", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" }
		}),
	},
})
