local ok, lint = pcall(require, 'lint')
if not ok then
  print("couldn't load nvim-lint!!")
end

local cfn_lint = lint.linters.cfn_lint
cfn_lint.args = {
  "--format", "parseable",
  "--ignore-checks", "I3042",
  "--include-checks", "I", "--" -- must add this otherwise it reads the input file as a check
}

lint.linters_by_ft = {
  markdown = {'vale'},
  cfn = { 'cfn_lint' },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
