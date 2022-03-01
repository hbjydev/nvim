local opt = vim.opt

opt.encoding = 'utf-8'
opt.expandtab = true
opt.nu = true
opt.errorbells = false
opt.wrap = false
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.incsearch = true
opt.autoindent = true
opt.hlsearch = false
opt.cmdheight = 2
opt.updatetime = 50

-- tabs
vim.cmd([[
  autocmd BufNewFile,BufRead *.go set filetype=go
  autocmd BufNewFile,BufRead *.rs set filetype=rust
]])

vim.cmd([[
  set sw=2 ts=2 sts=2 " Default
  autocmd FileType html :setlocal sw=2 ts=2 sts=2
  autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
  autocmd FileType python :setlocal sw=4 ts=4 sts=4
  autocmd FileType go :setlocal sw=4 ts=4 sts=4
  autocmd FileType rust :setlocal sw=4 ts=4 sts=4
  autocmd FileType php :setlocal sw=4 ts=4 sts=4
]])

