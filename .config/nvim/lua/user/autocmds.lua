-- ~/.config/nvim/lua/user/autocmds.lua

-- ヤンク時に一時的にハイライトする機能
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch', -- ハイライトグループ (IncSearchは検索中のハイライトと同じ)
      timeout = 500,         -- ハイライト表示時間 (ミリ秒)
    })
  end,
})

-- 保存時にLSPでフォーマットする機能
local format_on_save_group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = format_on_save_group,
  pattern = '*',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
  desc = 'Format file on save',
})

-- 自動保存機能
local auto_save_group = vim.api.nvim_create_augroup('AutoSave', { clear = true })
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertLeave' }, {
  group = auto_save_group,
  callback = function()
    if vim.bo.modifiable and vim.bo.buftype == '' and vim.bo.filetype ~= 'gitcommit' then
      vim.cmd('silent! wall') -- 変更があるバッファのみを保存
    end
  end,
  desc = 'Auto save on BufLeave and FocusLost',
})