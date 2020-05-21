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

" Plugins
" ==============================

" Languages
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'othree/xml.vim'

" Completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Linting
Plug 'w0rp/ale'

" Git
Plug 'airblade/vim-gitgutter'

" Motion
Plug 'easymotion/vim-easymotion'

" Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

" Utility
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Appearance
Plug 'morhetz/gruvbox'

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

set scrolloff=10 " Number of screen lines to keep around cursor

set ttimeoutlen=10 " Time that is waited for a key code sequence

set autoread " Autoload file changes

" User Interface
syntax enable " Enables syntax highlighting

set background=dark
silent! colorscheme gruvbox

set number relativenumber " Show hybrid line numbers

set wildmenu " Enhanced command-line completion

set cursorline " Highligh the screen line of the cursor

set colorcolumn=80
highlight colorcolumn ctermbg=darkgray

" Status line
set laststatus=2 " Always show status line

set statusline=
set statusline+=\ %n\  " Buffer number
set statusline+=\ %<%f\  " File name
set statusline+=%m " Modified flag
set statusline+=%r " Readonly flag

set statusline+=%= " Separation point between left and right aligned items

set statusline+=%y\  " File type (filetype plugin)
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " File encoding
set statusline+=%5l " Current line
set statusline+=/%L " Total lines
set statusline+=%4v\  " Virtual column number

" Tabs and Spaces
set tabstop=4 " How many columns a tab counts for
set softtabstop=4 " How many columns are inserted when pressing tab
set shiftwidth=4 " How many columns text will be shifted
set expandtab " Insert spaces when pressing tab

" Searching
set incsearch " Show where pattern mathes while typing
set hlsearch " Highlight all search pattern matches
set ignorecase " Ignores case when searching
set smartcase " Overrides 'ignorecase' if search contains upper case characters

set path+=** " Recursive folder search

" Store backup files outside of working directory
if !isdirectory($HOME."/.vim/backup")
    silent call mkdir($HOME."/.vim/backup", "p")
endif
set backupdir=$HOME/.vim/backup//

" Store swap files outside of working directory
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
