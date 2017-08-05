set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" languages
Plugin 'jdonaldson/vaxe' " haxe

" rust
Plugin 'rust-lang/rust.vim' " generic rust plugin

" ===============

" other stuff
Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

Plugin 'alvan/vim-closetag'

Plugin 'vim-syntastic/syntastic'

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

" YCM
let g:ycm_auto_trigger = 0 " disable auto complete
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1

" Haxe specific
" ctags generation
au FileType haxe nmap <F7> :call vaxe#Ctags()<CR>

" C++ specific
au FileType cpp set cindent
au FileType cpp set cino=N-sg0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'

" Rust specific
let g:syntastic_rust_checkers = ['cargo'] " syntastic check for rust
let g:ycm_rust_src_path = "/home/jackm/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

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
let g:syntastic_mode_map = { 'mode': 'passive' }

nmap <F5> :SyntasticCheck<CR>

" BASICS
syntax enable " enable syntax highlighting
set background=dark
colorscheme gruvbox

" remove vi support stuff
set nocompatible

" SPACES AND TABS
set tabstop=4 " tab size 4
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " when indenting with '>', use 4 spaces
set expandtab

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
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set ignorecase  " ignores the case when seaching
set smartcase   " if pattern contains an uppercase it will be case sensitive

set path+=**			" enables recursive folder search

" SEARCH IGNORE STUFF
set wildignore+=**/bin/**  " ignore stuff from compile folder
set wildignore+=**/target/** " ignore stuff from (rust) compile folder
set wildignore+=**/doc/** " ignore generated doc files
set wildignore+=**/build/** " ignore build files for cmake

" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" LEADER SHORTCUTS

" jj is escape
inoremap jj <Esc>

" removes all trailing whitespace when pressing F4
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

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

