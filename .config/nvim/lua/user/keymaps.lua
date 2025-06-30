-- ~/.config/nvim/lua/user/keymaps.lua

local opts = { noremap = true, silent = true }

-- Prevent space from moving the cursor in normal mode
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', opts)

-- Change current directory to the directory of the current file
-- ディレクトリを変更したあとで、完了メッセージを表示する
vim.api.nvim_set_keymap('n', '<leader>cd', ':cd %:h<CR>:echo "Changed directory to current buffer directory"<CR>', opts)
