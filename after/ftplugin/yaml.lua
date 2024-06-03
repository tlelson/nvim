-- Add sub file type for special yaml files
-- See filetype config in mfussenegger/nvim-lint config

-- Cloudformation
if not vim.endswith(vim.bo.filetype, "cfn") then -- don't endlessly loop
  -- Scan all lines for CFN giveaway
  -- If this becomes slow, limit to first 3 and add pcall to deal with empty files
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, 0)

  for _, line in pairs(lines) do
    -- The only thing that is strictly required is a "Resources" block
    if line:find("AWS::") ~= nil then
      require("notify")("Cloudformation detected", "info", { title = "tims" })
      vim.bo.filetype = "yaml.cfn"
      break
    end
  end
end

-- Github Actions
vim.filetype.add({
  pattern = {
    [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
  },
})
