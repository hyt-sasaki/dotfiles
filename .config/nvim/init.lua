-- ~/.config/nvim/init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "user.plugins" },
  },
  defaults = {
    lazy = true,
  },
  install = { colorscheme = { "tokyonight", "catppuccin" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "matchit",
        "tutor",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "zipPlugin",
        "logiPat",
        "gzip",
      },
    },
  },
})

require('user.options')
require('user.keymaps')
require('user.autocmds')
