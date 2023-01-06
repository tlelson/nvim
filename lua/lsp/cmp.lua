-- nvim-cmp setup

-- Prints an error message to the vim messages
local function notify_missing(plugin)
  vim.notify("Pluging '".. plugin .."' is missing")
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  notify_missing('cmp')
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  notify_missing('luasnip')
  return
end


cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    --['<A-k>'] = cmp.mapping.scroll_docs(-4), -- don't seem to work
    --['<A-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
