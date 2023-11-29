return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      cfn = { "cfn_lint" },
      go = { "golangcilint" },
      sh = { "shellcheck" },
      --fish = { "fish" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    },
    -- LazyVim extension to easily override linter options
    -- or add custom linters.
    ---@type table<string,table>
    linters = {
      cfn_lint = {
        args = {
          "--format",
          "parseable",
          "--ignore-checks",
          "I3042",
          "--include-checks",
          "I",
          "--", -- must add this otherwise it reads the input file as a check
        },
      },
    },
  },
}
