local M = {}

local codeBlocksQuery = [[
  (fenced_code_block
    (info_string) @info
    (code_fence_content) @content
  ) @block
]]

local codeSectionsQuery = [[
  (section
    (atx_heading) @heading
    (fenced_code_block) @code
  ) @section
]]

local get_root = function(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "markdown")
  local tree = parser:trees()[1]
  return tree:root()
end

local get_command = function(bufnr, currLine)
  local query = vim.treesitter.parse_query("markdown", codeBlocksQuery)
  local root = get_root(bufnr)

  local details = {}
  for id, match, metadata in query:iter_matches(root, bufnr, 0, -1) do
    if vim.treesitter.is_in_node_range(match[3], currLine) then
      local row1, col1, row2, col2 = match[2]:range() -- range of the capture
      details["start"] = row1
      details["finish"] = row2 

      local irow1, icol1, irow2, icol2 = match[1]:range()
      local text = vim.api.nvim_buf_get_text(bufnr, irow1, icol1, irow2, icol2, {})
      local term = string.match(text[1], "terminal:(%d)")
      details["term"] = tonumber(term) or 1
    end
  end

  return details
end

function M.get_sections(bufnr)
  local query = vim.treesitter.parse_query("markdown", codeSectionsQuery)
  local root = get_root(bufnr)

  local details = {}
  for id, match, metadata in query:iter_matches(root, bufnr, 0, -1) do
      local irow1, icol1, irow2, icol2 = match[1]:range()
      local text = vim.api.nvim_buf_get_text(bufnr, irow1, icol1, irow2, icol2, {})
      --local section_name = text[1]
      -- text[1] H2 heading line
      local heading = string.match(text[1], "^#+%s*(.+)$"):gsub("%s+$", "")
      --local code_range = match[2]:range()
      if details[heading] == nil then
        details[heading] = {node = match[3], code_blocks = {} }
      end
      details[heading]["code_blocks"][#details[heading]["code_blocks"]+1] = match[2]
  end

  return details
end

--M.get_sections(5)


-- run all the code in a code snippet
function M.run_code(bufnr, currLine)
  local details = get_command(bufnr, currLine)
  local lines = vim.api.nvim_buf_get_text(bufnr, details["start"], 0, details["finish"], 0, {})

  for _, line in ipairs(lines) do
    local l = true and line:gsub("^%s+", ""):gsub("%s+$", "") or line
    require("toggleterm").exec(l, details["term"])
  end
end

--M.run_code(5, 15)
--M.run_code(5, 5)

function M.run_section(bufnr, nodes)
  for _, node in ipairs(nodes) do
    local line = node:range() + 1
    M.run_code(bufnr, line)
  end
end

--M.run_section(5, "H2 some other command")

--run_section_cmd()

return M
