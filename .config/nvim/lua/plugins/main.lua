local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- library
    use 'vim-denops/denops.vim'
    use 'lambdalisue/mr.vim'
    use 'Shougo/pum.vim'

    -- ddc
    use 'Shougo/ddc.vim'
    use 'Shougo/ddc-around'
    use 'Shougo/ddc-matcher_head'
    use 'Shougo/ddc-sorter_rank'
    use 'Shougo/ddc-nvim-lsp'
    use 'LumaKernel/ddc-tabnine'

    -- ddu
    use 'Shougo/ddu.vim'
    use 'Shougo/ddu-ui-ff'
    use 'Shougo/ddu-source-file_rec'
    use 'Shougo/ddu-source-buffer'
    use 'Shougo/ddu-source-line'
    use 'kuuote/ddu-source-mr'
    use 'matsui54/ddu-source-command_history'
    use 'shun/ddu-source-rg'
    use 'Shougo/ddu-filter-matcher_substring'
    use 'Shougo/ddu-kind-file'

    -- theme
    use {
        'itchyny/lightline.vim',
        config = function()
            vim.api.nvim_set_var('lightline', { colorscheme = 'wombat' })
        end
    }
    use 'nanotech/jellybeans.vim'

    -- others
    use 'rhysd/clever-f.vim'
    use {
        'matsui54/denops-popup-preview.vim',
        config = function()
            vim.fn['popup_preview#enable']()
        end
    }
    use {
        'matsui54/denops-signature_help',
        config = function()
            vim.fn['signature_help#enable']()
            vim.api.nvim_set_var('lsp_signature_help_enabled', 0)
        end
    }
    use 'j-hui/fidget.nvim'
    use 'lambdalisue/gin.vim'
    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use { 'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
    end
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pakcer.lua source <afile> | PackerCompile
  augroup end
]])
