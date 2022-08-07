local opt = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

-- support syntax highlighting
vim.cmd 'syntax enable'

-- try to recognize filetypes and load plugins
vim.cmd 'filetype plugin indent on'

-- use system clipboard
opt.clipboard = 'unnamedplus'

-- look and feel
opt.number = true
opt.relativenumber = true
opt.title = true
opt.scrolloff = 10
opt.inccommand = 'split'
opt.lazyredraw = true
opt.ruler = false
opt.mouse = 'n' -- fix mouse scroll on tmux
-- theme and colors
opt.termguicolors = true
opt.wildoptions = 'pum' -- Pop Up Menu on cmd line completion
opt.pumblend = 10 -- Pop Up transparency (0-100)
vim.cmd [[ colorscheme Dracula ]]

-- Show line background only on the current window
opt.cursorline = true
local bgHightLight = vim.api.nvim_create_augroup('BackgroundHighLight', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
  callback = function() opt.cursorline = true end,
  group = bgHightLight
})

vim.api.nvim_create_autocmd('WinLeave', {
  callback = function() opt.cursorline = false end,
  group = bgHightLight
})

-- text
opt.list = true --  show invisible characters
opt.textwidth = 80

-- keep indentation
local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.expandtab = true --  Use the spaces to insert a <Tab>
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
opt.smartindent = true

-- Search and replace
opt.ignorecase = true
opt.path = opt.path + "**"
opt.wildignore = opt.wildignore + { "**/node_modules/**", "*.DS_Store" }
