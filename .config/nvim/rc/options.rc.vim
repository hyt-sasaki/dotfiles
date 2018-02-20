
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
"set ttymouse=xterm2

" クリップボードの利用
set clipboard=unnamed
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" カレントディレクトリを現在開いているファイルのディレクトリに自動変更
set autochdir

"ノーマルモード時にEnterで改行
noremap <CR> o<Esc>
"挿入モードから抜ける際にIMEをオフ
inoremap <ESC> <ESC>:set iminsert=0<CR>  " ESCでIMEを確実にOFF

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
  if &filetype == "markdown"
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

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

augroup python_indent
    autocmd!
    autocmd BufRead,BufNewFile *.py setlocal nosmartindent
augroup END

" pudbの起動用キーマップ
" pudbのインストールが必要
augroup python_debugger
    autocmd!
    autocmd BufRead,BufNewFile *.py nmap <F12> :!pudb %<CR>
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

autocmd FileType python setlocal completeopt-=preview

" highlightの設定
augroup highlight_setting
    autocmd!
    autocmd VImEnter,Colorscheme * highlight ChangedDefaultHl cterm=bold ctermfg=black ctermbg=yellow gui=bold guifg=black guibg=yellow
    autocmd VImEnter,Colorscheme * highlight clear SpellBad
    autocmd VImEnter,Colorscheme * highlight SpellBad cterm=underline ctermfg=red
augroup END
syntax on

set inccommand=split
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
