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

Plugin 'alvan/vim-closetag'

Plugin 'vim-syntastic/syntastic'

" needed for ailine theme
Plugin 'morhetz/gruvbox'

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
nmap <F7> :call vaxe#Ctags()<CR>

" Airline
set laststatus=2
let g:airline_theme='gruvbox'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 0

let g:airline_symbols = {}
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = ''

" vim-closetag
let g:closetag_filenames = "*.html,*.xml"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
set colorcolumn=81
highlight colorcolumn ctermbg=darkgray

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

" buffer switching
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>

" moving lines up and down using alt-j or alt-k
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
