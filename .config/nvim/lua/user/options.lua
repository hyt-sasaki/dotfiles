-- ~/.config/nvim/lua/user/options.lua

-- Set options
vim.opt.autochdir = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.conceallevel = 0
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.formatoptions = 'jqlnt'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true     -- ターミナルのTrue Colorを有効化 (set termguicolors)
vim.opt.autoread = true          -- 外部変更時に自動でファイルを再読み込み
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wrap = false

-- Set listchars
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
  extends = '…',
  precedes = '…',
}


