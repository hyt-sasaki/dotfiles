-- ~/.config/nvim/lua/user/plugins.lua

return {
  -- nvim-tree.lua (ファイルエクスプローラー)
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',                   -- 最新バージョンを使用
    lazy = false,                    -- Neovim起動時にすぐにロード
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- ファイルアイコン用
    },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,         -- ドットファイルを表示
        },
        sync_root_with_cwd = true, -- CWDと同期
        update_focused_file = {
          enable = true,
          update_cwd = true,
        }
      })

      -- キーマップ設定
      local opts = { noremap = true, silent = true }
      -- <leader>e で nvim-tree をトグル
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', opts)
      vim.g.nvim_tree_respect_buf_cwd = true
    end,
  },

  -- nvim-treesitter (構文ハイライト)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- インストール後にパーサーをビルド
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c', 'cpp', 'python', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'html', 'css', 'json',
          'yaml',
          'markdown', 'markdown_inline'
        },               -- インストールする言語パーサー
        highlight = {
          enable = true, -- ハイライトを有効化
        },
        indent = {
          enable = true, -- インデントを有効化
        },
      })
    end,
  },

  -- lualine.nvim (ステータスライン)
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,                                     -- Neovim起動時にすぐにロード
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- ファイルアイコン用
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto', -- カラースキームに合わせて自動調整
          component_separators = { '', '' },
          section_separators = { '', '' },
          disabled_filetypes = {
            'alpha',
            'dashboard',
            'NvimTree',
          },
          always_last_status = 2,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'nvim-tree' },
      })
    end,
  },

  -- Tokyo Night カラースキーム
  {
    'folke/tokyonight.nvim',
    lazy = false,    -- カラースキームは起動時にロード
    priority = 1000, -- 他のプラグインより先にロードされるように優先度を高く設定
    config = function()
      vim.cmd.colorscheme('tokyonight')
    end,
  },

  -- plenary.nvim (telescopeの依存)
  'nvim-lua/plenary.nvim',

  -- telescope.nvim (ファジーファインダー)
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',                              -- 最新の安定版タグを指定
    dependencies = { 'nvim-lua/plenary.nvim' }, -- 依存関係を明示的に指定
    keys = {
      -- <leader>ff でファイル検索
      { "<leader>ff", function() require("telescope.builtin").find_files() end,               desc = "Find files" },
      -- <leader>fg でライブgrep
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,                desc = "Live Grep" },
      -- <leader>fb でバッファ検索
      { "<leader>b",  function() require("telescope.builtin").buffers() end,                  desc = "Find buffers" },
      -- <leader>fh でヘルプタグ検索
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,                desc = "Help Tags" },
      -- <leader>fo で最近開いたファイルを検索
      { "<leader>fo", function() require("telescope.builtin").oldfiles() end,                 desc = "Find Old Files" },
      -- <leader>ld で現在のバッファの診断メッセージを一覧表示
      { "<leader>ld", function() require("telescope.builtin").diagnostics() end,              desc = "List Diagnostics" },
      -- <leader>lD でワークスペース全体の診断メッセージを一覧表示
      { "<leader>lD", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, desc = "List All Diagnostics" },
      -- <leader>t でToggleTermの管理メニューを開く
      { "<leader>t",  "<cmd>Telescope toggleterm_manager<cr>",                                desc = "ToggleTerm Manager" },
      -- <leader>a で Companion のアクションメニューを開く
      { "<leader>a",  "<cmd>CodeCompanionActions<cr>",                                        desc = "Code Companion Actions" },
    },

    config = function()
      -- Telescopeのデフォルト設定（オプション）
      require('telescope').setup({
        defaults = {
          -- ここにデフォルトオプションを設定
          -- 例えば、プレビューウィンドウの表示方法など
          -- previewer = false, -- プレビューを無効にする場合
        },
      })
    end,
  },

  -- hop.nvim (高速カーソル移動)
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- v2ブランチを指定 (推奨)
    keys = {
      -- <leader>f で前方単一文字ジャンプ
      { ',f', function() require('hop').hint_char1({ direction = "after_cursor" }) end,  mode = { 'n', 'v' }, desc = 'Hop Char Forward' },
      -- <leader>F で後方単一文字ジャンプ
      { ',F', function() require('hop').hint_char1({ direction = "before_cursor" }) end, mode = { 'n', 'v' }, desc = 'Hop Char Backward' },
    },
    config = function()
      require('hop').setup({
        -- オプションをここに設定
        -- 例えば、キーの表示方法や色など
        -- hints = {
        --   -- hint_offset = 0,
        --   -- upper_case_hints = false,
        --   -- ...
        -- },
        -- ...
      })
    end,
  },

  -- nvim-autopairs (括弧の自動補完)
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- gitsigns.nvim (Git統合)
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost', -- バッファ読み込み後にロード
    keys = {
      -- 次の変更箇所へジャンプ
      {
        ']g',
        function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() require('gitsigns').next_hunk() end)
        end,
        mode = 'n',
        desc = 'Next Git Hunk'
      },

      -- 前の変更箇所へジャンプ
      {
        '[g',
        function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() require('gitsigns').prev_hunk() end)
        end,
        mode = 'n',
        desc = 'Prev Git Hunk'
      },

      -- 変更箇所をステージ
      { '<leader>hs', function() require('gitsigns').stage_hunk() end,                mode = { 'n', 'v' }, desc = 'Stage Hunk' },
      -- 変更箇所を元に戻す
      { '<leader>hr', function() require('gitsigns').reset_hunk() end,                mode = { 'n', 'v' }, desc = 'Reset Hunk' },
      -- ファイル全体をステージ
      { '<leader>hS', function() require('gitsigns').stage_buffer() end,              mode = 'n',          desc = 'Stage Buffer' },
      -- ファイル全体を元に戻す
      { '<leader>hR', function() require('gitsigns').reset_buffer() end,              mode = 'n',          desc = 'Reset Buffer' },
      -- 変更箇所をプレビュー
      { '<leader>hp', function() require('gitsigns').preview_hunk() end,              mode = 'n',          desc = 'Preview Hunk' },
      -- 変更箇所を書き込む (stash)
      { '<leader>hw', function() require('gitsigns').blame_line({ full = true }) end, mode = 'n',          desc = 'Blame Line' },
      -- 変更箇所をコピー
      { '<leader>hD', function() require('gitsigns').diffthis() end,                  mode = 'n',          desc = 'Diff This' },
      -- 変更箇所をコピー (HEADと比較)
      { '<leader>hd', function() require('gitsigns').diffthis('~') end,               mode = 'n',          desc = 'Diff This (HEAD)' },
      -- <leader>gs でGitsignsのメニューを表示 (オプション)
      { '<leader>gs', function() vim.cmd('Gitsigns') end,                             mode = 'n',          desc = 'Gitsigns Menu' },
    },
    config = function()
      require('gitsigns').setup({
        -- 基本的な設定
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '-' },
          topdelete = { text = '_' },
          changedelete = { text = '~' },
        },
        signcolumn = true, -- サインカラムを表示
        numhl = false,     -- 行番号のハイライト
        linehl = false,    -- 行全体のハイライト
        word_diff = false, -- 単語単位の差分表示
      })
    end,
  },

  -- LSP関連 (設定は user/lsp.lua で管理)
  {
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('user.lsp').setup()
    end,
  },

  -- コード補完 (nvim-cmp)
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
          }),
        },
      })
    end,
  },

  -- GitHub Copilot
  {
    'github/copilot.vim',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      -- GitHub Copilotの設定
    end,
  },

  -- telescope-undo.nvim (undo historyをtelescopeで表示)
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { -- lazy style key map
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    opts = {
      -- don't use `defaults = { }` here, do this in the main telescope spec
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        -- no other extensions here, they can have their own spec too
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },

  -- toggleterm.nvim (ターミナル管理)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm", -- ToggleTerm コマンドが実行されたときにロード
    keys = {
      { "<c-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 20,                -- ターミナルの高さ (垂直/水平分割の場合)
        hide_numbers = true,      -- 行番号を非表示
        direction = "float",      -- フローティングターミナル
        terminal_mappings = true, -- ターミナルモードでのキーマッピングを有効にする
        float_opts = {
          border = "curved",      -- 枠線のスタイル
          winblend = 0,           -- ウィンドウの透明度
        },
      })

      -- ターミナルを開く関数を定義
      function _G.set_terminal_keymaps()
        -- ターミナルモードでのキーマッピング
        -- Escキーでノーマルモードに戻る
        vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', "[[<C-\\><C-n>]]", { noremap = true })
        -- Ctrl + h/j/k/l でウィンドウを移動
        vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', "[[<C-\\><C-n><C-w>h]]", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', "[[<C-\\><C-n><C-w>j]]", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', "[[<C-\\><C-n><C-w>k]]", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', "[[<C-\\><C-n><C-w>l]]", { noremap = true })
      end

      -- ターミナルを開くたびにキーマップを設定
      vim.cmd('autocmd TermOpen * lua set_terminal_keymaps()')
    end,
  },

  -- toggleterm-manager.nvim (ToggleTermとTelescopeの連携)
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = function()
      local toggleterm_manager = require("toggleterm-manager")
      local actions = toggleterm_manager.actions
      require("toggleterm-manager").setup {
        titles = {
          prompt = "Pick Term",
          results = "Terminals"
        },
        mappings = {                                                              -- key mappings bound inside the telescope window
          i = {
            ["<CR>"] = { action = actions.toggle_term, exit_on_action = true },   -- toggles terminal open/closed
            ["<C-i>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
            ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
            ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
          },
        },
      }
    end
  },
  -- Code Companion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanionChat", "CodeCompanion", "CodeCompanionCmd", "CodeCompanionActions" },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
        },
      })
    end,
  }
}
