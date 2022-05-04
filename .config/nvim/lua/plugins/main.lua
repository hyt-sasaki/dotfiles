vim.api.nvim_set_var('dein#auto_recache', 1)

vim.api.nvim_set_var('dein#lazy_rplugins', 1)
vim.api.nvim_set_var('dein#enable_notification', 1)
vim.api.nvim_set_var('dein#install_max_processes', 16)
vim.api.nvim_set_var('dein#install_message_type', 'none')
vim.api.nvim_set_var('dein#enable_notification', 1)

local dein_dir = vim.env.HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
    if vim.fn.isdirectory(dein_repo_dir) ~= 1 then
        os.execute('git clone https://github.com/Shougo/dein.vim ' .. dein_repo_dir)
    end
    vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath
end

vim.call('dein#begin', dein_dir)

require('plugins/dein')

vim.call('dein#end')

vim.call('dein#install')
