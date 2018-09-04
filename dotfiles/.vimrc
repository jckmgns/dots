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

" Python
Plugin 'davidhalter/jedi-vim' " completion

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer' " completion

" XML
Plugin 'othree/xml.vim'

" GLSL
Plugin 'tikhomirov/vim-glsl'

" General Functionality
" ==============================

Plugin 'w0rp/ale'
Plugin 'shougo/neocomplete.vim'

Plugin 'junegunn/fzf.vim'

Plugin 'sirver/ultisnips'
Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Appearance
" ==============================

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

" Internal / Shipped Plugins
" ==============================

" matchit
runtime! macros/matchit.vim " Extended % matching for HTML, LaTeX, and more ...

" netrw
let g:netrw_banner = 0

" General
" ==============================

set history=128 " Number of rememebered command-lines

set omnifunc=syntaxcomplete#Complete " Enable omni-completion

set scrolloff=10 " Minimal number of screen lines to keep above / below cursor

set ttimeoutlen=10 " Lower time that is waited for a key code / sequence

" User Interface
syntax enable " Enables syntax highlighting

set background=dark
silent! colorscheme gruvbox

set number " Show line numbers

set wildmenu " Visual autocomplete for command menu

set cursorline " Highligh current line

set colorcolumn=80
highlight colorcolumn ctermbg=darkgray

" Status line
set laststatus=2 " always show status line

set statusline=
set statusline+=\ %n\  " buffer number
set statusline+=\ %<%t " file name
set statusline+=%m " modified flag
set statusline+=%r " modified flag

set statusline+=%= " separation point between left and right aligned items

set statusline+=%y\  " file type (filetype plugin)
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " file encoding
set statusline+=%5l " current line
set statusline+=/%L " total lines
set statusline+=%4v\  " virtual column number

" Tabs and Spaces
set tabstop=4 " How many columns a tab counts for
set softtabstop=4 " How many columns are inserted when pressing tab
set shiftwidth=4 " How many columns text will be shifted
set expandtab " Insert spaces when pressing tab

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
nnoremap <Leader>T :TagbarToggle<CR>

" fzf
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" General
" ==============================

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Remove all trailing whitespace when pressing <Leader>w
nnoremap <silent> <leader>w m':let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s
            \<Bar> :nohl <Bar> :unlet _s <CR>`'

" Mute search highlighting when pressing Control-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
