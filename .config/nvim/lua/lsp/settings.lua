local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function get_cmd_str(cmdName) return '<cmd>lua vim.lsp.' .. cmdName .. '()<CR>' end

    local opts = { noremap=true, silent=true }

    local keymaps = {
        {type='n', key='gD', cmd_str=get_cmd_str('buf.declaration')},
        {type='n', key='gd', cmd_str=get_cmd_str('buf.definition')},
        {type='n', key='K', cmd_str=get_cmd_str('buf.hover')},
        {type='n', key='gi', cmd_str=get_cmd_str('buf.implementation')},
        {type='n', key='gr', cmd_str=get_cmd_str('buf.references')},
        {type='n', key='<C-k>', cmd_str=get_cmd_str('buf.signature_help')},
        {type='n', key='<space>rn', cmd_str=get_cmd_str('buf.rename')},
        {type='n', key='<a-cr>', cmd_str=get_cmd_str('buf.code_action')},
        {type='n', key='<space>e', cmd_str=get_cmd_str('diagnostic.show_line_diagnostics')},
        {type='n', key='[d', cmd_str=get_cmd_str('diagnostic.goto_prev')},
        {type='n', key=']d', cmd_str=get_cmd_str('diagnostic.goto_next')},
        {type='n', key='<space>q', cmd_str=get_cmd_str('diagnostic.setloclist')},
        {type='n', key='<space>F', cmd_str=get_cmd_str('buf.format')},
    }

    for _, keymap in pairs(keymaps) do
        buf_set_keymap(keymap.type, keymap.key, keymap.cmd_str, opts)
    end
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup {
    ensure_installed = {'sumneko_lua', 'tsserver'},
    automatic_installation = true
}

local servers = require('nvim-lsp-installer.servers')
for _, lsp in pairs(servers.get_installed_servers()) do
    require('lspconfig')[lsp.name].setup {
        on_attach = on_attach
    }
end
