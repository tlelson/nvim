-- Add sub file type for special yaml files

-- Cloudformation
if not vim.endswith(vim.bo.filetype, 'cfn') then -- don't endlessly loop
	-- Scan first 3 lines for CFN giveaway
	local lines = vim.api.nvim_buf_get_lines(0, 0, 3, 0)
	for _, line in pairs(lines) do
		if line:find('AWSTemplateFormatVersion') ~= nil then
			print('Cloudformation detected')
			vim.bo.filetype = 'yaml.cfn'
		end
	end
end
