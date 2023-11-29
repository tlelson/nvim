-- Add sub file type for special yaml files

-- Cloudformation
if not vim.endswith(vim.bo.filetype, "cfn") then -- don't endlessly loop
  -- Scan all lines for CFN giveaway
  -- If this becomes slow, limit to first 3 and add pcall to deal with empty files
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, 0)

  for _, line in pairs(lines) do
    if line:find("AWSTemplateFormatVersion") ~= nil then
      require("notify")("Cloudformation detected", "info", { title = "tims", timeout = 3000 })
      vim.bo.filetype = "yaml.cfn"
    end
  end
end
