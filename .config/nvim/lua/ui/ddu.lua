local call = vim.call
local api = vim.api
local keymap = vim.keymap
local fn = vim.fn

call('ddu#custom#patch_global', {
    ui = 'ff',
    sources = { {
        name = 'file_rec'
    }, {
        name = 'buffer'
    }, {
        name = 'rg',
        params = {
            args = { '--column', '--no-heading', '--color', 'never' }
        }
    } },
    sourceOptions = {
        ['_'] = {
            matchers = { 'matcher_substring' }
        }
    },
    kindOptions = {
        file = {
            defaultAction = 'open'
        },
        command_history = {
            defaultAction = 'execute'
        }
    },
    uiParams = {
        ff = {
            split = 'floating'
        }
    }
})

call('ddu#custom#patch_local', 'filer', {
    ui = 'filer',
    sources = { {
        name = 'file',
        params = {},
    } },
    sourceOptions = {
        ['_'] = {
            columns = { 'filename' },
        }
    },
    kindOptions = {
        file = {
            defaultAction = 'open',
        },
    },
    uiParams = {
        filer = {
            winWidth = 40,
            split = 'vertical',
            splitDirection = 'topleft',
        }
    },
})

-- keymap
local start_mappings = {
    { key = '<Space>f', funcArgs = { sources = { { name = 'file_rec' } } } },
    { key = '<Space>c', funcArgs = { sources = { { name = 'file' } } } },
    { key = '<Space>b', funcArgs = { sources = { { name = 'buffer' } } } },
    { key = '<Space>r', funcArgs = { sources = { { name = 'mr' } } } },
    { key = '<Space>l', funcArgs = { sources = { { name = 'line' } } } },
    { key = '<Space>h', funcArgs = { sources = { { name = 'command_history' } } } },
    { key = '<Space>g', funcArgs = {
        volatile = true,
        sources = { { name = 'rg', options = { matchers = {} } } },
        uiParams = {
            ignoreEmpty = false,
            autoResize = false
        }
    } },
}
for _, mapping in pairs(start_mappings) do
    keymap.set('n', mapping.key, function()
        fn['ddu#start'](mapping.funcArgs)
    end, { noremap = true, silent = true, nowait = true })
end

-- ddu-ff
api.nvim_create_autocmd('FileType', {
    pattern = 'ddu-ff',
    callback = function()
        local create_cmd_name = function(action)
            return ':call ddu#ui#ff#do_action("' .. action .. '")<CR>'
        end
        local keymap_settings = {
            { key = '<CR>', action = 'itemAction' },
            { key = 'i', action = 'openFilterWindow' },
            { key = 'q', action = 'quit' },
            { key = '<ESC>', action = 'quit' },
        }
        for _, keymap_setting in pairs(keymap_settings) do
            api.nvim_buf_set_keymap(0, 'n', keymap_setting.key, create_cmd_name(keymap_setting.action), { silent = true, noremap = true })
        end
    end
})

-- ddu-ff-filter
api.nvim_create_autocmd('FileType', {
    pattern = 'ddu-ff-filter',
    callback = function()
        api.nvim_buf_set_keymap(0, 'i', '<CR>', '<Esc>:close<CR>', { silent = true, noremap = true })
        api.nvim_buf_set_keymap(0, 'n', '<CR>', ':close<CR>', { silent = true, noremap = true })
        api.nvim_buf_set_keymap(0, 'n', 'q', ':close<CR>', { silent = true, noremap = true })
        api.nvim_buf_set_keymap(0, 'n', '<ESC>', ':close<CR>', { silent = true, noremap = true })
    end
})

-- ddu-filer
api.nvim_create_autocmd('FileType', {
    pattern = 'ddu-filer',
    callback = function()
        for _, key in pairs({ '<CR>', '<Space>' }) do
            api.nvim_buf_set_keymap(0, 'n', key, '', {
                silent = true,
                noremap = true,
                callback = function()
                    if call('ddu#ui#filer#is_tree') then
                        call('ddu#ui#filer#do_action', 'expandItem', { mode = 'toggle' })
                    else
                        call('ddu#ui#filer#do_action', 'itemAction', { name = 'open' })
                    end
                end
            })
        end
        for _, key in pairs({ '<Esc>', 'q' }) do
            api.nvim_buf_set_keymap(0, 'n', key, '', {
                silent = true,
                noremap = true,
                callback = function() call('ddu#ui#filer#do_action', 'quit') end
            })
        end
    end
})

vim.keymap.set('n', ';d', function()
    call('ddu#start', {
        name = 'filer',
        uiParams = {
            filer = {
                search = vim.fn.expand('%:p')
            }
        }
    })
end, { silent = true })
