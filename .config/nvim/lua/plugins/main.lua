local fn = vim.fn
local api = vim.api

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save this file
api.nvim_create_autocmd('BufWritePost', {
    pattern = '*/nvim/lua/plugins/main.lua',
    group = api.nvim_create_augroup('packer_user_config_augroup', { clear = true }),
    callback = function()
        vim.cmd [[source <afile> | PackerSync]]
    end
})


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
    use 'Shougo/ddc-ui-native'
    use 'Shougo/ddc-around'
    use 'Shougo/ddc-matcher_head'
    use 'Shougo/ddc-sorter_rank'
    use 'Shougo/ddc-nvim-lsp'
    use 'LumaKernel/ddc-tabnine'

    -- ddu
    use 'Shougo/ddu.vim'
    use 'Shougo/ddu-ui-ff'
    use 'Shougo/ddu-ui-filer'
    use 'Shougo/ddu-column-filename'
    use 'Shougo/ddu-source-file_rec'
    use 'Shougo/ddu-source-file'
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
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            -- place this in one of your configuration file(s)
            vim.api.nvim_set_keymap('n', ',f', ":lua require'hop'.hint_char1()<cr>", {})
        end
    }
    use 'tpope/vim-repeat'
    use 'andymass/vim-matchup'
    use 'michaeljsmith/vim-indent-object'
    use 'windwp/nvim-autopairs'
    use 'machakann/vim-sandwich'
    use 'windwp/nvim-ts-autotag'
    use 'justinmk/vim-ipmotion'
    use 'terryma/vim-expand-region'
    use 'alvan/vim-closetag'
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
    use 'lukas-reineke/indent-blankline.nvim'
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    use { 'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
              signs = {
                add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
                change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
                delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
                topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
                changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
                untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
              },
              signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
              numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
              linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
              word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
              watch_gitdir = {
                interval = 1000,
                follow_files = true
              },
              attach_to_untracked = true,
              current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
              current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
              },
              current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
              sign_priority = 6,
              update_debounce = 100,
              status_formatter = nil, -- Use default
              max_file_length = 40000, -- Disable if file is longer than this (in lines)
              preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
              },
              yadm = {
                enable = false
              },
            }
        end
    }


    -- languages
    use 'jjo/vim-cue'
    use 'hashivim/vim-terraform'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
