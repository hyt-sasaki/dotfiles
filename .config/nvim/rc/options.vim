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

" 一行の文字数が多い場合でも描画を行う
set display=lastline

" 補完メニューの高さ
set pumheight=10

" ビープ音 ビジュアルベルを使用しない
set vb t_vb=

" ファイルブラウザの初期ディレクトリ
set browsedir=current

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
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

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

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

" 検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する
set incsearch

"検索結果をハイライト
set hlsearch

"コマンドラインで補完候補を表示する
set wildmenu

" AutoChangeDirを無効にする
set noautochdir
"コマンドラインの補完モード
set wildmode=list:longest,full

set encoding=utf-8

" modifiable
set modifiable
set write

" -や_でつながっている語も単語として選択するようにする
setlocal iskeyword-=_

set inccommand=split

colorscheme jellybeans

" highlightの設定
augroup highlight_setting
    autocmd!
    autocmd VImEnter,Colorscheme * highlight ChangedDefaultHl cterm=bold ctermfg=black ctermbg=yellow gui=bold guifg=black guibg=yellow
    autocmd VImEnter,Colorscheme * highlight clear SpellBad
    autocmd VImEnter,Colorscheme * highlight SpellBad cterm=underline ctermfg=red
augroup END
syntax on

