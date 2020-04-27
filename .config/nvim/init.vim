augroup MyAutoCmd
    autocmd!
augroup END

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

function! s:source_rc(path, ...) abort
    let use_global = get(a:000, 0, !has('vim_starting'))
    let abspath = resolve(expand('$CONFIG/nvim/rc/' . a:path))
    if !use_global
        if filereadable(abspath)
            execute 'source' fnameescape(abspath)
        endif
        return
    endif

    " substitute all 'set' to 'setglobal'
    let content = map(readfile(abspath),
                \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
    " create tempfile and source the tempfile
    let tempfile = tempname()
    try
        call writefile(content, tempfile)
        execute 'source' fnameescape(tempfile)
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction

call s:source_rc('local.vim')
call s:source_rc('plugins.vim')
call s:source_rc('options.vim')
call s:source_rc('languages.vim')
