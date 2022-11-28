local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup {
    ensure_installed = { 'sumneko_lua', 'tsserver' },
    automatic_installation = true
}
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function get_cmd_str(cmdName) return '<cmd>lua vim.' .. cmdName .. '()<CR>' end

    local opts = { noremap = true, silent = true }

    local keymaps = {
        { type = 'n', key = 'gD', cmd_str = get_cmd_str('lsp.buf.declaration') },
        { type = 'n', key = 'gd', cmd_str = get_cmd_str('lsp.buf.definition') },
        { type = 'n', key = 'K', cmd_str = get_cmd_str('lsp.buf.hover') },
        { type = 'n', key = 'gi', cmd_str = get_cmd_str('lsp.buf.implementation') },
        { type = 'n', key = 'gr', cmd_str = get_cmd_str('lsp.buf.references') },
        { type = 'n', key = '<C-k>', cmd_str = get_cmd_str('lsp.buf.signature_help') },
        { type = 'n', key = '<space>rn', cmd_str = get_cmd_str('lsp.buf.rename') },
        { type = 'n', key = '<a-cr>', cmd_str = get_cmd_str('lsp.buf.code_action') },
        { type = 'n', key = '[d', cmd_str = get_cmd_str('diagnostic.goto_prev') },
        { type = 'n', key = ']d', cmd_str = get_cmd_str('diagnostic.goto_next') },
        { type = 'n', key = '<space>d', cmd_str = get_cmd_str('diagnostic.setloclist') },
        { type = 'n', key = '<space>F', cmd_str = get_cmd_str('lsp.buf.format') },
    }

    for _, keymap in pairs(keymaps) do
        buf_set_keymap(keymap.type, keymap.key, keymap.cmd_str, opts)
    end

    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = 'abuf',
        callback = function() return vim.lsp.buf.format() end
    })

    require 'fidget'.setup({})
end

local servers = require('nvim-lsp-installer.servers')
for _, lsp in pairs(servers.get_installed_servers()) do
    require('lspconfig')[lsp.name].setup {
        on_attach = on_attach
    }
end

return {
    on_attach = on_attach
}
