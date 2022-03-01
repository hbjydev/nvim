local lsp = require('lsp-zero')
local cmp = require('cmp')
local luasnip = require('luasnip')

function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local cmp_default_mappings = require("lsp-zero.nvim-cmp-setup").default_mappings()
local cmp_mappings = vim.tbl_extend("force", cmp_default_mappings, {
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item(select_opts)
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_back_space() then
      fallback()
    else
      cmp.mapping.confirm({select = true})
      cmp.complete()
    end
  end, {'i', 's'}), 

  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item(select_opts)
      cmp.mapping.confirm({select = true})
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {'i', 's'}),
})

lsp.preset('recommended')
lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = require('cmp').config.sources {
    { name = 'luasnip' }
  },
  snippet = {
    expand = function(args)
      if not luasnip then
        return
      end
      luasnip.lsp_expand(args.body)
    end
  }
})
lsp.setup()

