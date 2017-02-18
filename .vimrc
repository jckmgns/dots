set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'jdonaldson/vaxe'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

" :PluginInstall to install plugins and stuff
" ----------------------------------------------------

" Vaxe stuff
let g:vaxe_lime_target = 'linux -neko -64'
" let g:vaxe_cache_server = 1
let g:vaxe_enable_airline_defaults = 0

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='base16_default'

let g:airline#extensions#whitespace#enabled = 0

let g:airline_left_sep=''
let g:airline_right_sep=''

" BASICS
syntax enable " enable syntax highlighting

" remove vi support stuff
set nocompatible

" SPACES AND TABS
set tabstop=4 " tab size 4
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " when indenting with '>', use 4 spaces

" CUSTOM
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set autowrite

" UI CONFIG
set number " show line numbers
set cursorline " highlight current line
filetype indent on " load filetype specific indent files
set wildmenu " visual autocomplete for command menu
set colorcolumn=80
highlight colorcolumn ctermbg=8

" SEARCHING
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set path+=**			" enables recursive folder search

" SEARCH IGNORE STUFF
set wildignore+=**/bin/**  " ignore stuff from compile folder

" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" LEADER SHORTCUTS

" jk is escape
inoremap jj <esc>

" removes all trailing whitespace when pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

map <C-j> :bprev<CR>
map <C-k> :bnext<CR>

inoremap <C-Space> <C-x><C-o>
