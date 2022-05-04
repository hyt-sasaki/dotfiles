local call = vim.call
local api = vim.api
local keymap = vim.keymap

call('ddu#custom#patch_global', {
    ui = 'ff',
    sources = { {
        name = 'file_rec',
        params = {}
    } },
    sourceOptions = {
        ['_'] = {
            matchers = { 'matcher_substring' }
        }
    },
    kindOptions = {
        file = {
            defaultAction = 'open'
        }
    },
    uiParams = {
        ff = {
            split = 'floating'
        }
    }
})

-- keymap
keymap.set('n', '<Space>f', function()
    vim.fn['ddu#start']({sources = {{ name = 'file_rec'}}})
end, { noremap = true, silent = true, nowait = true})

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
        }
        for _, keymap_setting in ipairs(keymap_settings) do
            api.nvim_buf_set_keymap(0, 'n', keymap_setting['key'], create_cmd_name(keymap_setting['action']), { silent = true, noremap = true })
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
    end
})
