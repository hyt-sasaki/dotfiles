let s:dein_dir = expand('$DATA/dein')

if &runtimepath !~# 'dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
    endif

    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('$CONFIG/nvim/dein')
  let s:toml      = s:toml_dir . '/normal.toml'
  let s:lazy_toml = s:toml_dir . '/lazy.toml'

  if filereadable(s:toml)
      call dein#load_toml(s:toml,      {'lazy': 0})
  endif
  if filereadable(s:lazy_toml)
      call dein#load_toml(s:lazy_toml, {'lazy': 1})
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
