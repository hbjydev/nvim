local mode = require("consts").modes

local function map(mode, mapping, cmd, options)
  local opts = { noremap = true }
  if options then
    opts = vim.tbl_extend("force", opts, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

vim.g.mapleader = " "

-- navigate panes
map(mode.normal, "<leader>h", "<C-W><C-H>")
map(mode.normal, "<leader>j", "<C-W><C-J>")
map(mode.normal, "<leader>k", "<C-W><C-K>")
map(mode.normal, "<leader>l", "<C-W><C-L>")

-- equalize pane widths
map(mode.normal, "<leader>=", "<C-W><C-=>")

-- copy/paste
map(mode.visual_select, "<leader>c", '"*yy<CR>')
map(mode.normal, '<leader>v', '"+p<CR>')

-- tab nav
map(mode.normal, '<leader>n', 'gt')
map(mode.normal, '<leader>N', 'gT')

-- nerdtree
map(mode.normal, '<leader>e', ':NERDTreeToggle<CR>')

-- telescope
map(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(mode.normal, "<leader>f", ":Telescope live_grep<CR>")
map(mode.normal, "<leader>s", ":Telescope grep_string<CR>")
map(mode.normal, "<leader>b", ":Telescope buffers<CR>")
