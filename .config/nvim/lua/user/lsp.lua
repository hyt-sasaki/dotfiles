-- ~/.config/nvim/lua/user/lsp.lua

local M = {}

function M.setup()
  -- LSPのキーマップを定義
  local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end

  -- masonをセットアップ
  require('mason').setup()

  -- インストールするLSPサーバーのリスト
  local servers = { 'lua_ls', 'pyright', 'ts_ls' }

  -- mason-lspconfigをセットアップし、サーバーがインストールされていることを確認
  require('mason-lspconfig').setup({
    ensure_installed = servers,
  })

  -- 各言語ごとのカスタム設定
  local server_opts = {
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
    pyright = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = 'basic',
          },
          pythonPath = '.venv/bin/python',
        },
      },
    },
  }

  -- 各サーバーに設定を適用
  for _, server_name in ipairs(servers) do
    local opts = {
      on_attach = on_attach, -- 共通のキーマップをアタッチ
    }
    -- もしカスタム設定があれば、デフォルトのoptsにマージする
    if server_opts[server_name] then
      opts = vim.tbl_deep_extend('force', opts, server_opts[server_name])
    end
    -- LSPサーバーをセットアップ
    require('lspconfig')[server_name].setup(opts)
  end
end

return M
