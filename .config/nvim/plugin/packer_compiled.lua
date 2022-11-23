-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sasaki/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sasaki/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sasaki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sasaki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sasaki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["ddc-around"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc-around",
    url = "https://github.com/Shougo/ddc-around"
  },
  ["ddc-matcher_head"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc-matcher_head",
    url = "https://github.com/Shougo/ddc-matcher_head"
  },
  ["ddc-nvim-lsp"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc-nvim-lsp",
    url = "https://github.com/Shougo/ddc-nvim-lsp"
  },
  ["ddc-sorter_rank"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc-sorter_rank",
    url = "https://github.com/Shougo/ddc-sorter_rank"
  },
  ["ddc-tabnine"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc-tabnine",
    url = "https://github.com/LumaKernel/ddc-tabnine"
  },
  ["ddc-ui-native"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc-ui-native",
    url = "https://github.com/Shougo/ddc-ui-native"
  },
  ["ddc.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddc.vim",
    url = "https://github.com/Shougo/ddc.vim"
  },
  ["ddu-column-filename"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-column-filename",
    url = "https://github.com/Shougo/ddu-column-filename"
  },
  ["ddu-filter-matcher_substring"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-filter-matcher_substring",
    url = "https://github.com/Shougo/ddu-filter-matcher_substring"
  },
  ["ddu-kind-file"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-kind-file",
    url = "https://github.com/Shougo/ddu-kind-file"
  },
  ["ddu-source-buffer"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-buffer",
    url = "https://github.com/Shougo/ddu-source-buffer"
  },
  ["ddu-source-command_history"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-command_history",
    url = "https://github.com/matsui54/ddu-source-command_history"
  },
  ["ddu-source-file"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-file",
    url = "https://github.com/Shougo/ddu-source-file"
  },
  ["ddu-source-file_rec"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-file_rec",
    url = "https://github.com/Shougo/ddu-source-file_rec"
  },
  ["ddu-source-line"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-line",
    url = "https://github.com/Shougo/ddu-source-line"
  },
  ["ddu-source-mr"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-mr",
    url = "https://github.com/kuuote/ddu-source-mr"
  },
  ["ddu-source-rg"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-source-rg",
    url = "https://github.com/shun/ddu-source-rg"
  },
  ["ddu-ui-ff"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-ui-ff",
    url = "https://github.com/Shougo/ddu-ui-ff"
  },
  ["ddu-ui-filer"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu-ui-filer",
    url = "https://github.com/Shougo/ddu-ui-filer"
  },
  ["ddu.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/ddu.vim",
    url = "https://github.com/Shougo/ddu.vim"
  },
  ["denops-popup-preview.vim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\25popup_preview#enable\afn\bvim\0" },
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/denops-popup-preview.vim",
    url = "https://github.com/matsui54/denops-popup-preview.vim"
  },
  ["denops-signature_help"] = {
    config = { "\27LJ\2\n|\0\0\4\0\6\0\v6\0\0\0009\0\1\0009\0\2\0B\0\1\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0)\3\0\0B\0\3\1K\0\1\0\31lsp_signature_help_enabled\17nvim_set_var\bapi\26signature_help#enable\afn\bvim\0" },
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/denops-signature_help",
    url = "https://github.com/matsui54/denops-signature_help"
  },
  ["denops.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/denops.vim",
    url = "https://github.com/vim-denops/denops.vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gin.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/gin.vim",
    url = "https://github.com/lambdalisue/gin.vim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nµ\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\1K\0\1\0':lua require'hop'.hint_char1()<cr>\a,f\6n\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["jellybeans.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/jellybeans.vim",
    url = "https://github.com/nanotech/jellybeans.vim"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\2\nX\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\16colorscheme\vwombat\14lightline\17nvim_set_var\bapi\bvim\0" },
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["mr.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/mr.vim",
    url = "https://github.com/lambdalisue/mr.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["pum.vim"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/pum.vim",
    url = "https://github.com/Shougo/pum.vim"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-cue"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-cue",
    url = "https://github.com/jjo/vim-cue"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-ipmotion"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-ipmotion",
    url = "https://github.com/justinmk/vim-ipmotion"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/sasaki/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
try_loadstring("\27LJ\2\nX\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\16colorscheme\vwombat\14lightline\17nvim_set_var\bapi\bvim\0", "config", "lightline.vim")
time([[Config for lightline.vim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\1K\0\1\0':lua require'hop'.hint_char1()<cr>\a,f\6n\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: denops-signature_help
time([[Config for denops-signature_help]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\6\0\v6\0\0\0009\0\1\0009\0\2\0B\0\1\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0)\3\0\0B\0\3\1K\0\1\0\31lsp_signature_help_enabled\17nvim_set_var\bapi\26signature_help#enable\afn\bvim\0", "config", "denops-signature_help")
time([[Config for denops-signature_help]], false)
-- Config for: denops-popup-preview.vim
time([[Config for denops-popup-preview.vim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\25popup_preview#enable\afn\bvim\0", "config", "denops-popup-preview.vim")
time([[Config for denops-popup-preview.vim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
