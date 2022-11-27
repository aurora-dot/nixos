local opt = vim.opt
local g = vim.g

-- allow mouse
opt.mouse = "a"

-- look
opt.termguicolors = true
opt.cursorline = false -- dont highlight current line
opt.number = true
g.rainbow_active = true
vim.cmd([[colorscheme dracula]])

-- files
opt.autoread = true --reload files when they are changed on disk

-- autoformat
g.autoformat_autoindent = false
g.autoformat_retab = false
g.autoformat_remove_trailing_spaces = true

vim.cmd[[
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ["prettier.config.js"]
au BufWrite * :Autoformat
]]

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]
