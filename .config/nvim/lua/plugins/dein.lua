local repositories = {
    'Shougo/dein.vim',
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'Shougo/ddc.vim',
    'vim-denops/denops.vim',
    'Shougo/ddc-around',
    'Shougo/ddc-matcher_head',
    'Shougo/ddc-sorter_rank',
    'Shougo/ddc-nvim-lsp',
    'LumaKernel/ddc-tabnine',
    'Shougo/ddu.vim',
    'Shougo/ddu-ui-ff',
    'Shougo/ddu-source-file_rec',
    'Shougo/ddu-source-buffer',
    'Shougo/ddu-source-line',
    'kuuote/ddu-source-mr',
    'matsui54/ddu-source-command_history',
    'shun/ddu-source-rg',
    'Shougo/ddu-filter-matcher_substring',
    'Shougo/ddu-kind-file',
    'rhysd/clever-f.vim',
    'lambdalisue/mr.vim',
    'Shougo/pum.vim',
    'matsui54/denops-popup-preview.vim',
    'matsui54/denops-signature_help',
    'itchyny/lightline.vim',
    'nanotech/jellybeans.vim',
    'j-hui/fidget.nvim',
}

for _, repo in pairs(repositories) do
    vim.fn['dein#add'](repo)
end

-- denops-signature_help
vim.fn['signature_help#enable']()
vim.api.nvim_set_var('lsp_signature_help_enabled', 0)
-- denops-popup-preview
vim.fn['popup_preview#enable']()

-- lightline
vim.api.nvim_set_var('lightline', { colorscheme = 'wombat' })
