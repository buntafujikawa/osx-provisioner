"-------エンコード------
"エンコーディング指定
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp


"-------オペレーション------
" オートインデント
set smartindent

" Backspaceキーの影響範囲に制限を設けない
set backspace=indent,eol,start

" 矩形ビジュアルモードをブロック表示に
set virtualedit=block

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full 

" 行末・行頭から次の行へ移動可能に
set whichwrap+=h,l,<,>,[,],b,s

" OSのクリップボードを使用する
set clipboard+=unnamed

"-------表示------
" 対応する括弧の強調
set showmatch 

" 編集中のファイル名を表示
set title 

" 行番号の表示
set number 

" カーソル位置表示
set ruler 

" カーソル行強調
set cursorline 

" ビープ音を可視化
set visualbell

"不過視文字を指定
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" コマンドラインの履歴を1000件保存する
set history=1000

set nf=""

"カラースキームの設定
set t_Co=256↲
syntax on↲
colorscheme molokai

"-------ソフトタブ------
set expandtab
set tabstop=2
set shiftwidth=2


"-------ファイル操作------
" 保存されていないファイルがあるときは終了前に保存確認
set confirm

"保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden

" ファイル保存時にバックアップファイルを作らない
set nobackup

" ファイル編集中にスワップファイルを作らない
set noswapfile

