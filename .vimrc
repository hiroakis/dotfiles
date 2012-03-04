"=========================================================
" Basic Configuration
"=========================================================
set notitle
set nocompatible        "vi互換をoff
set autoindent          "オートインデントを有効
set smartindent         "スマートインデントを有効
set nobackup            "バックアップファイルを作らない
set noswapfile          "スワップファイルを作らない
set clipboard+=unnamed  "OS⇔vim間でコピペを可能にする
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

"vim-pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

""neocomplicache
filetype on

" Disable AutoComplPop.
let g:acp_enable_at_startup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Set manual completion length.
let g:neocomplcache_manual_completion_start_length = 0
" Auto select first
let g:neocomplcache_enable_auto_select = 1

" Print caching percent in statusline.
"let g:NeoComplCache_CachingPercentInStatusline = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
   \  'default' : '',
   \  'javascript' : '/Users/miche/.vim/dict/javascript/javascript.dict',
   \  'php' : '/Users/miche/.vim/dict/php/php.dict'
   \  }

"    \ 'ruby' : $DOTVIM.'/dict/ruby.dict'
"   \  'python' : '/Users/miche/.vim/dict/python/complete-dict',

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\v\h\w*'
let g:neocomplcache_snippets_dir = '~/.vim/snippets'

filetype on
autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType ruby setl omnifunc=rubycomplete#Complete
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP


" autocmd FileType ruby :set dictionary=~/.vim/plugin/ruby.vim
" autocmd FileType perl,cgi :set dictionary+=~/.vim/dict/perl_functions.dict


" set complete+=k

"filetype off
"filetype plugin on
"""""""

"python
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent
"cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
"autocmd FileType python let g:pydiction_location='/Users/miche/.vim/dict/python/complete-dict'
"g:pydiction_location='/Users/miche/.vim/dict/python/complete-dict'

"autocmd FileType javascript set
"dictionary='/Users/miche/.vim/dict/javascript/javascript.dict'
"autocmd FileType php set dictionary='/Users/miche/.vim/dict/php/php.dict'
"set complete+=k

""ruby
"autocmd FileType ruby setl autoindent
"autocmd FileType ruby setl smartindent
"cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType ruby setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
"