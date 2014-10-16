"=========================================================
" Basic Configuration
"=========================================================
set notitle
set nocompatible        "vi互換をoff
set autoindent          "オートインデントを有効
set smartindent         "スマートインデントを有効
set nobackup            "バックアップファイルを作らない
set noswapfile          "スワップファイルを作らない
" set clipboard+=unnamed  "OS⇔vim間でコピペを可能にする
set backspace=2         "<BS>でインデントや改行を削除できるようにする
set title               "ファイル名を表示
set number              "行番号を表示
set ruler               "ルーラーを表示
set laststatus=2        "ステータスを常に表示
set antialias           "アンチエイリアス
set showmatch           "対応するカッコをハイライト
set nolist              "改行などを表示しない。表示する時はset list
set showmode            "モードを表示する
set showcmd             "コマンドを表示
set display=uhex        "謎の文字を16進数で表示
set wildmenu            "補間候補を表示する
set nowrap              "エディタの端で折り返さない
set expandtab           "タブをスペースに変換
set tabstop=4           "タブをスペース4つ分として表示する
set shiftwidth=4        "シフトで移動する文字幅
set softtabstop=4       "タブキーを押したときに挿入する半角スペースの数
set noincsearch         "インクリメンタルサーチはしない
set wrapscan            "最後まで検索したら先頭へ戻る
set ignorecase          "大文字小文字無視
set smartcase           "検索文字列に大文字が含まれている場合は区別して検索する
set hlsearch            "検索文字をハイライト
set cursorline          "カーソルのある行をハイライト
"カーソルハイライトはカレントウィンドウのみ
autocmd WinEnter * setl cursorline
"カレントウィンドウから離れたらカーソルハイライトを消す
autocmd WinLeave * setl nocursorline
"全角スペースを見えるようにする
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
autocmd BufNewFile,BufRead * match ZenkakuSpace /　/

syntax on               "シンタックスオン

"=========================================================
"キーマップ
"=========================================================
"検索文字のハイライトを<ESC><ESC>で消す
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nmap <C-n> :set nonu
nmap <C-p> :set paste
nmap <S-n> :set nu
nmap <S-p> :set nopaste
"ウィンドウ移動のショートカット
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
"横スクロールのショートカット
nmap <S-l> zL
nmap <S-h> zH
"<C-k>ではりつけ
imap <C-k> <ESC>"*pa
":SVでvimrcを再読み込み
command! SV :source ~/.vimrc

"=========================================================
"encode
"=========================================================
"表示するときの文字コード(ターミナルの設定と同じ）
set encoding=utf-8
"保存するときの文字コード
set fenc=utf-8
"文字コード自動判別の候補とする文字コード種を列挙
set fencs=iso-2022-jp,euc-jp,cp932
" 文字コードの自動認識
if &encoding !=# 'utf-8'
 set encoding=japan
 set fileencoding=japan
endif

"=========================================================
"plugin
"=========================================================

"NeoBundle
if has('vim_starting')
   set nocompatible
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'tpope/vim-surround.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'vim-scripts/grep.vim.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'rizzatti/funcoo.vim.git'
NeoBundle 'rizzatti/dash.vim.git'

call neobundle#end()

NeoBundleCheck
filetype plugin indent on

"QuickRun
" nnoremap <C-Space> :QuickRun<CR><ESC>
nnoremap <Nul> :QuickRun<CR><ESC>

"unite.vim
nnoremap <C-z> :UniteWithBufferDir -buffer-name=files file<CR><ESC>
nnoremap <C-q> :Unite file_mru<CR><ESC>

"grep.vim
command! -nargs=1 Grep :GrepBuffer <args>
nnoremap <C-g> :GrepBuffer<Space><C-r><C-w>

"nerdcommander
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
nmap cc <plug>NERDCommenterAlignLeft
vmap cs <plug>NERDCommenterSexy
vmap cc <plug>NERDCommenterComment
vmap cx <plug>NERDCommenterUncomment
nmap cx <plug>NERDCommenterUncomment

"dash
" nmap <C-s> :Dash<Space><C-r><C-w>
