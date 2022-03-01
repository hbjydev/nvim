local ls = require('luasnip')

local snip = ls.snippet

local t = ls.text_node
local f = ls.function_node

local date = function() return {os.date('%Y-%m-%d')} end

ls.snippets = {
  all = {
    snip('date', {
      f(date)
    }),
  }
}

