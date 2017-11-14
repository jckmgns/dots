" ------------------------------------------------------------
" VUNDLE
" ------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ------------------------------------------------------------

" Base
" ==============================

Plugin 'VundleVim/Vundle.vim'

" Languages
" ==============================

Plugin 'rust-lang/rust.vim'

" General Functionality
" ==============================

Plugin 'w0rp/ale'
Plugin 'shougo/neocomplete.vim'
Plugin 'sirver/ultisnips'

Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-surround'

Plugin 'octref/rootignore' " Set 'wildignore' from .gitignore

" Appearance
" ==============================

Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'

" ------------------------------------------------------------

call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------
" SETTINGS
" ------------------------------------------------------------

" Languages
" ==============================
" Language specific settings are located under ~/.vim/ftplugin/*

" Plugins
" ==============================

" Ale
let g:ale_lint_on_text_changed = 'never'

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Airline
set laststatus=2

let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:airline_theme = 'gruvbox'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = ''

" Internal / Shipped Plugins
" ==============================

" matchit
runtime! macros/matchit.vim " Extended % matching for HTML, LaTeX, and more ...

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" General
" ==============================

" History
set history=128 " Command mode history

" Completion
set omnifunc=syntaxcomplete#Complete " Enable omni-completion

" User Interface
syntax enable
set background=dark

silent! colorscheme gruvbox

set number " Show line numbers
set relativenumber " Show relative line numbers

set wildmenu " Visual autocomplete for command menu

set cursorline " Highligh current line

set colorcolumn=81
highlight colorcolumn ctermbg=darkgray

" Tabs and Spaces
set tabstop=4 " How many columns a tab counts for
set softtabstop=4 " How many columns are inserted when pressing tab
set shiftwidth=4 " How many columns text will be shifted
set expandtab " Insert spaces when pressing tab

filetype indent on " Load filetype specific indent files

" Searching
set incsearch " Search as characters are entered
set hlsearch " Highlight matches
set ignorecase " Ignores the case when searching
set smartcase " Case sensitive if pattern contains upper case character

set path+=** " Recursive folder search

" ------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------

" Plugins
" ==============================

" Tagbar (Tags)
nnoremap <Leader>t :TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" General
" ==============================

inoremap jj <Esc>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Remove all trailing whitespace when pressing <Leader>w
nnoremap <silent> <leader>w :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s
            \<Bar> :nohl <Bar> :unlet _s <CR>

" Mute search highlighting when pressing Control-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
