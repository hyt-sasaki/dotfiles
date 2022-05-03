local o = vim.o
local wo = vim.wo

-- global options
o.scrolloff = 5
o.backup = false
o.autoread = true
o.swapfile = false
o.hidden = true
o.display = 'lastline'
o.pumheight = 10
o.visualbell = false
o.whichwrap = 'b,s,h,l,<,>,[,],~'
o.mouse = 'nvc'
o.clipboard = 'unnamedplus'
o.smarttab = true
o.incsearch = true
o.wildmenu = true
o.wildmode = 'list:longest,full'
o.expandtab = true
o.autoindent = true
o.textwidth = 0
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
vim.opt.completeopt = "menu,menuone,noselect"

-- window local options
wo.number = true

-- theme
vim.cmd([[
    colorscheme jellybeans
]])

