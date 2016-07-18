"-------------------------------------------------
" 基本設定
"-------------------------------------------------
"
set nocompatible
" カーソルの上または下に表示する最小限の行数
set scrolloff=5

" 入力されているテキストの最大幅 「0」で無効
set textwidth=0

" バックアップの作成は行わない
set nobackup

" Vimの外部で変更されたことが判明したとき、自動的に読み直す
set autoread

" スワップファイルの作成は行わない
set noswapfile

" 保存しないで他のファイルを表示することが出来るようにする
set hidden

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 一行の文字数が多い場合でも描画を行う
set display=lastline

" 補完メニューの高さ
set pumheight=10

" 自動整形の実行方法
set formatoptions=lmq
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" ビープ音 ビジュアルベルを使用しない
set vb t_vb=

" ファイルブラウザの初期ディレクトリ
set browsedir=buffer

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  <  - [←]        ノーマルモード ビジュアルモード
"  >  - [→]         ノーマルモード ビジュアルモード
"  [ - [←]         挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,h,l,<,>,[,],~

" コマンド (の一部) を画面の最下行に表示する
set showcmd

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" カーソル位置の表示(行)
set cursorline

" ステータス行を常に表示する
set laststatus=2

" コマンドラインに使われる画面上の行数
set cmdheight=1

" Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する
set showmode

"モードラインの無効化
set nomodeline

" 特定のモードでマウスが有効
" n:ノーマルモード v:ヴィジュアルモード i:挿入モード c:コマンドラインモード
set mouse=nvc
" マウス機能でのターミナル設定
set ttymouse=xterm2

" クリップボードの利用
set clipboard=unnamed
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" カレントディレクトリを現在開いているファイルのディレクトリに自動変更
set autochdir

"ノーマルモード時にEnterで改行
noremap <CR> o<Esc>
"ノーマルモード時にShift-Enterで改行
noremap <S-CR> O<Esc>
"挿入モードから抜ける際にIMEをオフ
inoremap <ESC> <ESC>:set iminsert=0<CR>  " ESCでIMEを確実にOFF

"行の折り返しをしている時に見た目の次の行へ移動する
nnoremap j gj
nnoremap k gk

"gFでカーソル下のファイルを新しいタブで開く
nnoremap gF <C-w>gf

" 行番号を表示する
set number

" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set showmatch

" 対応カッコに'<'と'>'を追加
set matchpairs& matchpairs+=<:>

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" 保存時に行末の空白を除去する
function! RTrim()
  let s:cursor = getpos(".")
  if &filetype == "markdown" || &filetype == "pandoc"
    %s/\s\+\(\s\{2}\)$/\1/e
    match Underlined /\s\{2}/
  else
    %s/\s\+$//e
  endif
  call setpos(".", s:cursor)
endfunction

augroup del_eol_space
    autocmd!
    autocmd BufWritePre * :call RTrim()
augroup END
" augroup del_eol_space
"     autocmd!
"     autocmd BufWritePre * :%s/\s\+$//e
" augroup END

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
augroup python_indent
    autocmd!
    autocmd BufRead,BufNewFile *.py setlocal nosmartindent
augroup END

" <Tab> が対応する空白の数
set tabstop=4

" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set expandtab

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"C++でのpublic:等のインデント設定
set cinoptions=g0

" 検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する
set incsearch

"検索結果をハイライト
set hlsearch

"コマンドラインで補完候補を表示する
set wildmenu

" AutoChangeDirを無効にする
set noautochdir
"コマンドラインの補完モード
" ""              最初のマッチのみを補完する
" "full"          次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" "longest"       共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" "longest:full"  "longest" と似ているが、'wildmenu' が有効ならばそれを開始する
" "list"          複数のマッチがあるときは、全てのマッチを羅列する
" "list:full"     複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
" "list:longest"  複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される
set wildmode=list:longest,full

" フォントの追加
set encoding=utf-8
set guifont=Ricty_for_Powerline:h10
set guifontwide=Rigth:h10

" modifiable
set modifiable
set write

" -や_でつながっている語も単語として選択するようにする
setlocal iskeyword-=_

" vimperatorrcのファイルタイプ設定
augroup vimperatorrc_config
    autocmd!
    autocmd BufRead,BufNewFile .vimperatorrc set filetype=vimperator
augroup END

" processingのファイルタイプ設定
augroup processing_config
    autocmd!
    autocmd BufRead,BufNewFile *.pde set filetype=processing
augroup END

" pythonのテンプレ入力
augroup python_template
    autocmd!
    autocmd BufNewFile *.py exe "normal ggI# -*- coding:utf-8 -*-\<CR>\<ESC>^"
augroup END

" markdownのプレビュー
augroup markdown_preview
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    "autocmd BufRead,BufNewFile *.md nnoremap <Leader>r :PrevimOpen<CR>
    autocmd BufRead,BufNewFile *.md nnoremap <Leader>p :set filetype=pandoc<CR>:Pandoc! #pdf<CR>:set filetype=markdown<CR>
    autocmd BufRead,BufNewFile *.md nnoremap <Leader>r :set filetype=markdown<CR>:PrevimOpen<CR>
    autocmd BufWritePre *.md :set filetype=markdown
augroup END

"-------------------------------------------------
" ユーザ定義関数
"-------------------------------------------------

"{が入力されたときに改行+閉じ括弧を補完する
function! GetBraceForC()
    let line = strpart(getline('.'), 0, col('.') - 1)
    if line =~ ') \=$'
        return "{\n}\<Esc>0bo"
    else
        return "{}\<Left>"
    endif
endfunction
augroup brace
    autocmd!
    autocmd FileType c,cpp,java,javascript,processing inoremap <expr> { GetBraceForC()
augroup END

"-------------------------------------------------
" NeoBundle 設定
"-------------------------------------------------

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
            \ 'cygwin' : 'make -f make_cygwin.mak',
            \ 'mac' : 'make -f make_mac.mak',
            \ 'unix' : 'make -f make_unix.mak',
    \ },
\ }

   "NeoBundle 'modsound/gips-vim'
   NeoBundle 'Lokaltog/vim-easymotion'
   NeoBundle 'Shougo/neomru.vim'
   NeoBundle 'Shougo/neosnippet-snippets'
   NeoBundle 'Shougo/unite-build'
   NeoBundle 'Shougo/vimshell.vim'
   NeoBundle 'Shougo/vimfiler.vim'
   NeoBundle 'itchyny/lightline.vim'
   NeoBundle 'kana/vim-submode'
   NeoBundle 'nanotech/jellybeans.vim'
   NeoBundle 'rhysd/clever-f.vim'
   NeoBundle 'ujihisa/unite-colorscheme'
   NeoBundle 'tpope/vim-fugitive'
   NeoBundle 'vim-jp/vimdoc-ja'
   NeoBundle 'idanarye/vim-merginal'
   NeoBundle "godlygeek/tabular"
   NeoBundle 'rcmdnk/vim-markdown'
   NeoBundle 'joker1007/vim-markdown-quote-syntax'
   NeoBundle 'kannokanno/previm'
   NeoBundle 'kakkyz81/evervim'
   NeoBundle 'vim-pandoc/vim-pandoc'
   NeoBundleLazy 'cohama/agit.vim'
   NeoBundleLazy 'scrooloose/nerdtree'
   NeoBundleLazy 'Rip-Rip/clang_complete'
   NeoBundleLazy 'Shougo/neocomplete', {'depends' : 'Shougo/vimproc'}
   NeoBundleLazy 'Shougo/neosnippet'
   NeoBundleLazy 'Shougo/unite.vim', {'depends' : 'neomru.vim'}
   NeoBundleLazy 'airblade/vim-rooter'
   NeoBundleLazy 'altercation/vim-colors-solarized'
   NeoBundleLazy 'croaker/mustang-vim'
   NeoBundleLazy 'davidhalter/jedi-vim'
   NeoBundleLazy 'koron/codic-vim'
   NeoBundleLazy 'Shougo/unite-outline', {'depends' : 'Shougo/unite.vim'}
   NeoBundleLazy 'nathanaelkane/vim-indent-guides'
   NeoBundle 'rhysd/unite-codic.vim', {'depends' : ['Shougo/unite.vim', 'koron/codic-vim']}
   NeoBundleLazy 'scrooloose/syntastic'
   NeoBundleLazy 'sjl/gundo.vim'
   NeoBundleLazy 'sophacles/vim-processing'
   NeoBundleLazy 'soramugi/auto-ctags.vim'
   NeoBundleLazy 'thinca/vim-quickrun'
   NeoBundleLazy 'tomasr/molokai'
   NeoBundleLazy 'w0ng/vim-hybrid'
   NeoBundleLazy 'wesleyche/SrcExpl'
   NeoBundle 'vim-latex/vim-latex'
   " NeoBundle 'lervag/vim-latex'
" --> NeoBundle 'USER/REPOSITORY-NAME'
" GitHubリポジトリにあるプラグインを利用する

" GitHub以外のGitリポジトリにあるプラグインを利用する
   "NeoBundleLazy 'git://git.code.sf.net/p/vim-latex/vim-latex'
   "NeoBundleLazy 'https://git.code.sf.net/p/vim-latex/vim-latex'

" vim-scripts リポジトリにあるプラグインを利用する
   NeoBundleLazy 'dbext.vim'
   NeoBundleLazy 'java_getset.vim'
   NeoBundleLazy 'DoxygenToolkit.vim'
   NeoBundle 'open-browser.vim'
   NeoBundle 'changed'

   " --- vim-pandocの設定 ---"
   if neobundle#tap('vim-pandoc')
       function! neobundle#tapped.hooks.on_source(bundle)
           function! MyPandocOpen(file)
               return "open -a firefox ". a:file
           endfunction
           let g:pandoc#command#custom_open = "MyPandocOpen"
       endfunction

       call neobundle#untap()
   endif

   " --- gundoの設定 ---
   nnoremap U :<C-u>GundoToggle<CR><C-w>p
   let g:gundo_right = 1
   if neobundle#tap('gundo.vim')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'commands' : ['GundoToggle']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           nnoremap <F5> :<C-u>GundoRenderGraph<CR><C-w>p
       endfunction

       call neobundle#untap()
   endif

   " --- evervimの設定 ---
   if neobundle#tap("evervim")
       nnoremap <Leader>n :EvervimNotebookList<CR>
       nnoremap <Leader>s :EvervimSearchByQuery<Space>
       nnoremap <Leader>c :EvervimCreateNote<CR>
       nnoremap <Leader>t :EvervimListTags<CR>
       function! neobundle#tapped.hooks.on_source(bundle)
            let g:evervim_devtoken="S=s78:U=848637:E=15af75dd29b:C=1539faca488:P=1cd:A=en-devtoken:V=2:H=0e50f8cf67cbef0ef6b8e16c764d0081"
       endfunction
       call neobundle#untap()
   endif

   " --- open-browserの設定 ---
   if neobundle#tap("open-browser.vim")
       nmap gx <Plug>(openbrowser-smart-search)
       vmap gx <Plug>(openbrowser-smart-search)
       nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space>

       call neobundle#untap()
   endif

   " -- codic-vimの設定
   if neobundle#tap("codic-vim")
       call neobundle#config({
                   \ "autoload" : {
                   \ "commands" : ['Codic'],
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
       endfunction

       call neobundle#untap()
   endif
   " -- dbextの設定 ---
   if neobundle#tap("dbext.vim")
       call neobundle#config({
                   \ "autoload" : {
                   \ "filetypes" : ['sql']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           let g:dbext_default_SQLITE_bin = 'sqlite3'
           let g:dbext_default_profile_test = 'type=SQLITE:dbname=~/programming/sqlite/test.db'
           let g:dbext_default_profile = 'test'
       endfunction
       nnoremap <Leader>sa ggVG:DBExecRangeSQL<CR>
       call neobundle#untap()
   endif
   " --- vim-processingの設定 ---
   if neobundle#tap('vim-processing')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetypes' : ['processing']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
       endfunction

       call neobundle#untap()
   endif
   " --- java_getsetの設定 ---
   if neobundle#tap('java_getset.vim')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetype' : ['java']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
       endfunction

       call neobundle#untap()
   endif

   " --- DoxygenToolkitの設定 ---
   if neobundle#tap('DoxygenToolkit.vim')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'commands' : ['Dox', 'DoxAuthor']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
       endfunction

       call neobundle#untap()
   endif

   " --- jedi-vimの設定 ---
   if neobundle#tap("jedi-vim")
       call neobundle#config({
                   \ "autoload" : {
                   \ "filetypes" : ["python"]
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           augroup python_config
               autocmd!
               autocmd FileType python setlocal omnifunc=jedi#completions
               autocmd FileType python setlocal completeopt-=preview
           augroup END
           let g:jedi#completions_enabled = 0
           let g:jedi#auto_vim_configuration = 0
           let g:jedi#rename_command = '<Leader>R'

           if !exists('g:neocomplete#force_omni_input_patterns')
               let g:neocomplete#force_omni_input_patterns = {}
           endif
           let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
       endfunction

       call neobundle#untap()
   endif

   " --- vim-indent-guidesの設定 ---
   if neobundle#tap("vim-indent-guides")
       call neobundle#config({
                   \ "autoload" : {
                   \ "filetypes" : ["python"]
                   \}
                   \})

       function! neobundle#tapped.hooks.on_source(bundle)
           " vim-indent-guides
           " Vim 起動時 vim-indent-guides を自動起動
           let g:indent_guides_enable_on_vim_startup=1
           " ガイドをスタートするインデントの量
           let g:indent_guides_start_level=2
           " 自動カラー無効
           let g:indent_guides_auto_colors=0
           " ガイドの色指定
           augroup python_color
               autocmd!
               autocmd VimEnter,Colorscheme *.py :hi IndentGuidesOdd  guibg=#444433 ctermbg=darkgray
               autocmd VimEnter,Colorscheme *.py :hi IndentGuidesEven guibg=#333344 ctermbg=black
           augroup END
           " ガイドの幅
           let g:indent_guides_guide_size = 1
       endfunction

       call neobundle#untap()
   endif

   " --- unite-outlineの設定 ---
   if neobundle#tap('unite-outline')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'unite_sources': ['outline']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
       endfunction

       nnoremap <silent> <Leader>o :<C-u>Unite -vertical -winwidth=40 -no-quit outline<CR>

       call neobundle#untap()
   endif

   " --- syntasticの設定 ---
   " http://rcmdnk.github.io/blog/2014/07/25/computer-vim/参照
   if neobundle#tap('syntastic')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetypes' : ['c', 'cpp', 'java', 'python']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           " Disable automatic check at file open/close
           let g:syntastic_check_on_open=0
           let g:syntastic_check_on_wq=0
           " C
           let g:syntastic_c_check_header = 1
           " C++
           let g:syntastic_cpp_check_header = 1
           let g:syntastic_cpp_compiler = 'g++'
           let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -I .'
           " Java
           let g:syntastic_java_javac_config_file_enabled = 1
           let g:syntastic_java_javac_config_file = "$HOME/.syntastic_javac_config"
           " Python
           let g:syntastic_python_checkers = ['flake8']
           let g:syntastic_python_flake8_args='--ignore=E265'
       endfunction

       call neobundle#untap()
   endif

   " --- vim-rooterの設定 ---
   if neobundle#tap('vim-rooter')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetypes' : ['cpp', 'c', 'java', 'javascript', 'python', 'html', 'css', 'vim', 'vimperator', 'processing']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           " Change only current window's directory
           let g:rooter_use_lcd = 1
           " files/directories for the root directory
           let g:rooter_patterns = ['.git/', '.root', '.git', 'Makefile', 'CMakeLists.txt', 'tags']
       endfunction

       call neobundle#untap()
   endif

   " --- auto-ctagsの設定 ---
   if neobundle#tap('auto-ctags.vim')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetypes' : ['cpp', 'c', 'java', 'javascript', 'python', 'html', 'css', 'vim', 'vimperator', 'processing']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           let g:auto_ctags = 1
       endfunction

       call neobundle#untap()
   endif

   " --- SrcExplの読み込み設定 ---
   if neobundle#tap('SrcExpl')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'commands': ['SrcExplToggle']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           " Set refresh time in ms
           let g:SrcExpl_RefreshTime = 1000
           " Is update tags when SrcExpl is opened
           let g:SrcExpl_isUpdateTags = 0
           " Tag update command
           let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
           " Update all tags
           function! g:SrcExpl_UpdateAllTags()
               let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
               call g:SrcExpl_UpdateTags()
               let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
           endfunction
       endfunction

       " Mappings
       "nn [srce] <Nop>
       "nm <Leader>E [srce]
       "nn <silent> [srce]<CR> :SrcExplToggle<CR>
       "nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
       "nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
       "nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
       "nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>
       nmap <F8> :SrcExplToggle<CR>
       nnoremap <Space> <C-W>j:call g:SrcExpl_Jump()<CR>
       nnoremap <S-Space> :call g:SrcExpl_GoBack()<CR>

       call neobundle#untap()
   endif

   " --- neocompleteの設定 ---
   if neobundle#tap('neocomplete')
       call neobundle#config({'autoload': {'insert': 1}})
       function! neobundle#tapped.hooks.on_source(bundle)
           let g:neocomplete#enable_at_startup = 1
           let g:neocomplete#acp_enableAtStartup = 0
           let g:neocomplete#enable_smart_case = 1
           "補完ディレクトリの追加
           let g:neocomplete#sources#include#paths = {
                       \ 'cpp':    '., /usr/local/include/, /usr/local/include/opencv2/, /usr/include/c++/4.8/, /usr/include/c++/4.8.2/, /usr/include/boost/',
                       \}
       endfunction

       call neobundle#untap()
   endif

   " --- clang_completeの設定 ---
   if neobundle#tap('clang_complete')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetypes' : ['cpp', 'h', 'hpp']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           let g:clang_periodic_quickfix = 1
           let g:clang_use_library = 1
           let g:clang_user_options = '-std=c++11 -Wall -I . `pkg-config --cflags opencv` -MMD -MP'
           let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'


           " neocomplete.vim と併用して使用する場合は以下の設定も行う
           if !exists('g:neocomplete#force_omni_input_patterns')
               let g:neocomplete#force_omni_input_patterns = {}
           endif
           let g:neocomplete#force_overwrite_completefunc = 1
           let g:neocomplete#force_omni_input_patterns.c =
                       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
           let g:neocomplete#force_omni_input_patterns.cpp =
                       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
           let g:neocomplete#force_omni_input_patterns.objc =
                       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
           let g:neocomplete#force_omni_input_patterns.objcpp =
                       \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

           " clang_complete では自動補完を行わない用に設定
           let g:clang_complete_auto = 0
           let g:clang_auto_select = 0
       endfunction

       call neobundle#untap()
   endif

   " --- neosnippetの設定 ---
   if neobundle#tap('neosnippet')
       call neobundle#config({'autoload' : {'insert' : 1}})
       function! neobundle#tapped.hooks.on_source(bundle)
           " For snippet_complete marker.
           if has('conceal')
               set conceallevel=2 concealcursor=i
           endif
       endfunction

       " <TAB>: completion.
       " inoremap <expr><TAB>  pumvisible() ? '\<C-n>' : '\<TAB>'
       inoremap <expr><S-TAB>  pumvisible() ? '\<C-p>' : '\<S-TAB>'

       " Plugin key-mappings.
       imap <C-k>     <Plug>(neosnippet_expand_or_jump)
       smap <C-k>     <Plug>(neosnippet_expand_or_jump)

       " SuperTab like snippets behavior.
       " imap <expr><TAB> neosnippet#jumpable() ?
       " "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
       imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
       smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

       call neobundle#untap()
   endif

   " --- vim-quickrunの設定 ---
   if neobundle#tap('vim-quickrun')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'commands' : ['QuickRun'],
                   \ 'mappings' : ['<Leader>r']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           if !exists('g:quickrun_config')
               let g:quickrun_config = {}
           endif

           let g:quickrun_config['_'] = {
                       \ 'runner/vimproc/updatetime' : 80,
                       \ 'outputter' : 'error',
                       \ 'outputter/buffer/split' : ':rightbelow 8sp',
                       \ 'outputter/error/error' : 'buffer',
                       \ 'outputter/error/success' : 'buffer',
                       \ 'runner' : 'vimproc',
                       \ }

           " processingの実行設定
           if has('win32unix') || has('win64unix')
               let g:quickrun_config['processing'] = {
   "                        \     'command': 'processing-java',
   "                        \     'exec': '%c --sketch=`cygpath -aw %s:p:h/` --output=`cygpath -aw %s:p:h/output` --run --force'
               \}
           else
               let g:quickrun_config['processing'] = {
                           \     'command': 'processing-java',
                           \     'exec': '%c --sketch=%s:h/ --output=%s:h/output --run --force' }
           endif

           "JAVAの実行設定
           let g:quickrun_config['java'] = {
                       \     'exec' : ['javac -J-Dfile.encoding=UTF8 %o %s:t:r.java', '%c -Dfile.encoding=UTF8 %s:t:r %a']
                       \}

           let g:quickrun_config['python'] = {
                       \ 'command': 'python',
                       \ 'exec': '%c %o %s %a',
                       \ 'hook/eval/template': 'print(%s)',
                       \ 'hook/output_encode/encoding': 'utf-8',
                       \ }

       endfunction

       nnoremap ,q :cd ../..<CR> :QuickRun<CR>
       nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

       call neobundle#untap()
   endif

   " --- uniteの設定 ---
   if neobundle#tap('unite.vim')
       call neobundle#config({
                   \'autoload': {
                   \'commands': ['Unite', 'UniteWithBufferDir']
                   \}
                   \})

       function! neobundle#tapped.hooks.on_source(bundle)
           " 入力モードで開始する
           "let g:unite_enable_start_insert=1

           " 大文字小文字を区別しない
           let g:unite_enable_ignore_case = 1
           "let g:unite_enable_smart_case = 1

           " ウィンドウを分割して開く
           augroup unite_group
               autocmd!
               autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
               autocmd FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
               " tocmdウィンドウを縦に分割して開く
               autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
               autocmd FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
               " ESCキーを2回押すと終了する
               "autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
               "autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
               " 初期設定関数を起動する
               au FileType unite call s:unite_my_settings()
           augroup END
           function! s:unite_my_settings()
               " Overwrite settings.
           endfunction

           " 様々なショートカット
           call unite#custom#substitute('file', '\$\w\+', '\=eval(submatch(0))', 200)
           call unite#custom#substitute('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
           call unite#custom#substitute('file', '^@', '\=getcwd()."/*"', 1)
           call unite#custom#substitute('file', '^;r', '\=$VIMRUNTIME."/"')
           call unite#custom#substitute('file', '^\~', escape($HOME, '\'), -2)
           call unite#custom#substitute('file', '\\\@<! ', '\\ ', -20)
           call unite#custom#substitute('file', '\\ \@!', '/', -30)

           if has('win32') || has('win64')
               call unite#custom#substitute('file', '^;p', 'C:/Program Files/')
               call unite#custom#substitute('file', '^;v', '~/vimfiles/')
           else
               call unite#custom#substitute('file', '^;v', '~/.vim/')
           endif
       endfunction

       " バッファ一覧
       "noremap <C-P> :Unite buffer<CR>
       " ファイル一覧
       "noremap <C-N> :Unite -buffer-name=file file<CR>
       " 最近使ったファイルの一覧
       noremap <C-Z> :Unite file_mru<CR>

       call neobundle#untap()
   endif

   " --- clever-fの設定 ---
   " http://rhysd.hatenablog.com/entry/2013/09/17/220837を参考
   if neobundle#tap('clever-f.vim')
       " 大文字を入力した時のみ大文字小文字を区別
       let g:clever_f_smart_case = 1
       " ローマ字入力で日本語も検索
       let g:clever_f_use_migemo = 1
       " 任意の記号を';'で検索
       let g:clever_f_chars_match_any_signs = ';'

       call neobundle#untap()
   endif

   " --- vim-submodeの設定 ---
   " http://d.hatena.ne.jp/thinca/20130131/1359567419
   if neobundle#tap('vim-submode')
       function! neobundle#tapped.hooks.on_source(bundle)
           "各関数の最初の引数は、サブモードの名前
           "第2引数はモードの種類。n = ノーマルモード、i = 挿入モードと言った感じで、ni のように複数同時に指定可能。
           "第3引数は map のオプションで、b = <buffer> e = <expr> と言った具合。
           "第4引数と第5引数が map の {lhs} と {rhs}

           " ウィンドウサイズの変更キーを簡易化
           call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
           call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
           call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
           call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
           call submode#map('winsize', 'n', '', '>', '<C-w>>')
           call submode#map('winsize', 'n', '', '<', '<C-w><')
           call submode#map('winsize', 'n', '', '+', '<C-w>-')
           call submode#map('winsize', 'n', '', '-', '<C-w>+')

           " タブページの切り替えキーを簡略化
           call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
           call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
           call submode#map('changetab', 'n', '', 't', 'gt')
           call submode#map('changetab', 'n', '', 'T', 'gT')
       endfunction

       call neobundle#untap()
   endif

   " --- VIM-LaTeXの設定 ---
   if neobundle#tap('vim-latex')
       call neobundle#config({
                   \ 'autoload' : {
                   \ 'filetypes' : ['tex', 'plaintex']
                   \}
                   \})
       function! neobundle#tapped.hooks.on_source(bundle)
           " Vim-LaTeXを利用するファイルの拡張子を設定する
           let g:tex_flavor='latex'
           set shellslash
           " IMPORTANT: grep will sometimes skip displaying the file name if you
           " search in a singe file. This will confuse latex-suite. Set your grep
           " program to alway generate a file-name.
           set grepprg=grep\ -nH\ $*
           "" .texファイルのコンパイルプログラムを指定(エラーで停止しないようオプション指定)
           let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
           "" .bibファイルのコンパイルプログラムを指定
           let g:Tex_BibtexFlavor = 'upbibtex'
           "" .dviファイルのビュープログラムを指定 環境に合わせてパスを設定すること
           let g:Tex_ViewRule_dvi = 'xdvi -expert'
           "" pdfファイル生成のための依存関係を記述
           "" 以下の設定の場合、ターゲットにpdfを指定して\llでコンパイルすると、
           "" まず.dviファイルが作られ、次にそれをもとに.pdfファイルが作られる
           let g:Tex_FormatDependency_pdf = 'dvi,pdf'
           "" .dviファイルのコンパイルプログラムを指定
           let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
           "" .pdfファイルのビュープログラムを指定 環境に合わせてパスを設定すること
           let g:Tex_ViewRule_pdf = 'okular'
       endfunction

       nnoremap <Leader>lp :TTarget pdf<CR>

       call neobundle#untap()
   endif

   " --- easymotionの設定 ---
   if neobundle#tap('vim-easymotion')
       let g:EasyMotion_use_migemo = 1

       nmap s <Plug>(easymotion-s)
       vmap s <Plug>(easymotion-s)
       omap z <Plug>(easymotion-s)

       call neobundle#untap()
   endif

   " --- VimFilerの設定 ---
   if neobundle#tap('vimfiler.vim')
       nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>
       function! neobundle#tapped.hooks.on_source(bundle)
           call vimfiler#custom#profile('default', 'context', {
               \ 'safe' : 0,
               \ 'edit_action' : 'tabopen',
               \ })
       endfunction

       call neobundle#untap()
   endif

   " --- lightlineの設定 ---
   if neobundle#tap('lightline.vim')
       let g:lightline = {
             \ 'colorscheme': 'landscape',
             \ 'active': {
             \   'left': [ [ 'mode', 'paste' ],
             \             [ 'fugitive', 'filename' ] ],
             \   'right': [ [ 'syntastic', 'lineinfo' ],
             \              ['percent'],
             \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
             \ },
             \ 'component_function': {
             \   'fugitive': 'LightLineFugitive',
             \   'readonly': 'LightLineReadonly',
             \   'modified': 'LightLineModified',
             \   'fileformat': 'LightLineFileformat',
             \   'filetype': 'LightLineFiletype',
             \   'fileencoding': 'LightLineFileencoding',
             \   'mode': 'LightLineMode',
             \   'filename': 'LightLineFilename'
             \ },
             \ 'component_expand': {
             \   'syntastic': 'SyntasticStatuslineFlag',
             \ },
             \ 'component_type': {
             \   'syntastic': 'error',
             \ },
             \ 'separator': { 'left': '⮀', 'right': '⮂' },
             \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
             \ }

       function! LightLineModified()
         if &filetype == "help"
           return ""
         elseif &modified
           return "+"
         elseif &modifiable
           return ""
         else
           return ""
         endif
       endfunction

       function! LightLineReadonly()
         if &filetype == "help"
           return ""
         elseif &readonly
           return "⭤"
         else
           return ""
         endif
       endfunction

       function! LightLineFilename()
         return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
              \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
              \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
       endfunction

       function! LightLineFugitive()
         if exists("*fugitive#head")
           let _ = fugitive#head()
           return strlen(_) ? '⭠ '._ : ''
         endif
         return ''
       endfunction

       function! LightLineFileformat()
         return winwidth(0) > 70 ? &fileformat : ''
       endfunction

       function! LightLineFiletype()
         return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
       endfunction

       function! LightLineFileencoding()
         return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
       endfunction

       function! LightLineMode()
         let fname = expand('%:t')
         return  fname == '__Gundo__' ? 'Gundo' :
               \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
               \ &ft == 'unite' ? 'Unite' :
               \ &ft == 'vimshell' ? 'VimShell' :
               \ winwidth(0) > 60 ? lightline#mode() : ''
       endfunction

       let g:tagbar_status_func = 'TagbarStatusFunc'

       function! TagbarStatusFunc(current, sort, fname, ...) abort
           let g:lightline.fname = a:fname
         return lightline#statusline(0)
       endfunction

       augroup AutoSyntastic
         autocmd!
         autocmd BufWritePost *.py,*.js,*.java,*.c,*.cpp call s:syntastic()
       augroup END
       function! s:syntastic()
         SyntasticCheck
         call lightline#update()
       endfunction

       let g:unite_force_overwrite_statusline = 0
       let g:vimshell_force_overwrite_statusline = 0

       call neobundle#untap()
   endif

   call neobundle#end()

" Installation check.
NeoBundleCheck
filetype plugin indent on     " Required!

"-------------------------------------------------
" Color Scheme設定
"-------------------------------------------------
syntax enable
set t_Co=256
colorscheme jellybeans
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight SpellBad ctermbg=none cterm=none
