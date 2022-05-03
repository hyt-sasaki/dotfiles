vim.call('ddc#custom#patch_global', 'sources', {'around', 'nextword', 'nvim-lsp', 'tabnine'})

vim.call('ddc#custom#patch_global', 'sourceOptions', {
    around = {
        mark = 'A',
    },
    nextword = {
        mark = 'nextword',
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
vim.call('ddc#enable')
