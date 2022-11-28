vim.call('ddc#custom#patch_global', 'ui', 'native')

vim.call('ddc#custom#patch_global', 'sources', {'around', 'nvim-lsp', 'tabnine'})

vim.call('ddc#custom#patch_global', 'sourceOptions', {
    around = {
        mark = 'A',
    },
    tabnine = {
        mark = 'TN',
        maxCandidates = 5,
        isVolatile = true
    },
    ['nvim-lsp'] = {
        mark = 'lsp',
        forceCompletionPattern = [[\.\w*|:\w*|->\w*]]
    },
    ['_'] = {
        matchers = {'matcher_head'},
        sorters = {'sorter_rank'}
    }
})
vim.call('ddc#custom#patch_global', 'sourceParams', {
    ['nvim-lsp'] = {
        kindLabels = {
            Class = 'c'
        }
    }
})

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.keymap.set('i', '<Tab>', function() return t'<C-N>' end, { silent = true, expr = true })
vim.keymap.set('i', '<S-Tab>', function() return t'<C-P>' end, { expr = true })
vim.call('ddc#enable')
