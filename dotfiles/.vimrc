" ------------------------------------------------------------
" PLUG
" ------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" ------------------------------------------------------------

" General
" ==============================

" Completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Linting
Plug 'w0rp/ale'

" Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

" Snippets
Plug 'sirver/UltiSnips'

" Utility
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Languages
" ==============================

" GLSL
Plug 'tikhomirov/vim-glsl'

" Rust
Plug 'rust-lang/rust.vim'

" XML
Plug 'othree/xml.vim'

" Appearance
" ==============================

" Color scheme
Plug 'morhetz/gruvbox'

" Git
Plug 'airblade/vim-gitgutter'

" ------------------------------------------------------------

call plug#end()

" ------------------------------------------------------------
" SETTINGS
" ------------------------------------------------------------

" Language servers
" ==============================

" Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust']
        \ })
endif

" Languages
" ==============================
" Language specific settings are located under ~/.vim/ftplugin/*

" Plugins
" ==============================

" Language server protocol
let g:lsp_diagnostics_echo_cursor = 1

" asyncomplete.vim
let g:asyncomplete_popup_delay = 200

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

set autoread " Autoload file changes.

" User Interface
syntax enable " Enables syntax highlighting

set background=dark
silent! colorscheme gruvbox

set number relativenumber " Show hybrid numbers

set wildmenu " Visual autocomplete for command menu

set cursorline " Highligh current line

set colorcolumn=80
highlight colorcolumn ctermbg=darkgray

" Status line
set laststatus=2 " always show status line

set statusline=
set statusline+=\ %n\  " buffer number
set statusline+=\ %<%f\  " file name
set statusline+=%m " modified flag
set statusline+=%r " readonly flag

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

" Save backup files outside of working directory
if !isdirectory($HOME."/.vim/backup")
    silent call mkdir($HOME."/.vim/backup", "p")
endif
set backupdir=$HOME/.vim/backup//

" Save swap files outside of working directory
if !isdirectory($HOME."/.vim/swap")
    silent call mkdir($HOME."/.vim/swap", "p")
endif
set directory=$HOME/.vim/swap//

" ------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------

" Plugins
" ==============================

" fzf
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>

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
