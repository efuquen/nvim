syntax on

set expandtab
set softtabstop=2
set shiftwidth=2

set hlsearch
set incsearch
set autoindent
set background=dark

set mouse=a

set colorcolumn=80
set number

set ignorecase
set smartcase
set showcmd

set list

set foldmethod=syntax
set foldcolumn=1

set wildignore+=*.class,.git,.svn

set statusline+=col:\ %c,

set hidden

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'valloric/youcompleteme'
call plug#end()

" ========
" NERDTree
" ========

" Start NERDTree by default
autocmd vimenter * NERDTree
" Start NERDTree even if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Map Ctrl-n to NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close nvim if NERDTree only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Start in window to right of NERDTree
autocmd vimenter * wincmd l
autocmd bufnew * wincmd l

"let NERDTreeWinSize=30

" =========
" Syntastic
" =========

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_javascript_checkers = ['jscs']

" =====
" CtrlP
" =====

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](project|target)$'
  \ }

" ========
" Deoplete
" ========

let g:deoplete#enable_at_startup = 1

" Rust Racer
" ==========

let g:racer_cmd="/home/efuquen/.cargo/bin/racer"
let $RUST_SRC_PATH="/home/efuquen/Code/oss/rust/rust-1.5.0/src"

"nmap <F8> :TagbarToggle<CR>
