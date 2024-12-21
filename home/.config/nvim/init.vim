" ------------------------------------------------------------
" PLUG
" ------------------------------------------------------------

if empty(glob("$HOME/.local/share/nvim/site/autoload/plug.vim"))
    silent !sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim"
                \ --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/plugged')

" ------------------------------------------------------------

" Plugins
" ==============================

" Languages
Plug 'tikhomirov/vim-glsl'

" Git
Plug 'airblade/vim-gitgutter'

" Motion
Plug 'justinmk/vim-sneak'

" Searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utility
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/vim-easy-align'

" Appearance
Plug 'jckmgns/vellum'

" ------------------------------------------------------------

call plug#end()

" ------------------------------------------------------------
" SETTINGS
" ------------------------------------------------------------

" Languages
" ==============================

autocmd FileType c    setlocal commentstring=//\ %s
autocmd FileType cpp  setlocal commentstring=//\ %s
autocmd FileType glsl setlocal commentstring=//\ %s

set cinoptions+=L0  " Don't indent labels, so the cursor doesn't jump when typing namespace colons.
set cinoptions+=N-s " Don't indent inside namespace.

" Plugins
" ==============================

" Sneak
let g:sneak#label = 1 " label-mode as a replacement for easy motion.
let g:sneak#use_ic_scs = 1 " use 'ignorecase' and 'smartcase' to determine case sensitivity

" Gitgutter
set updatetime=500

" Internal / Shipped Plugins
" ==============================

" Matchit
runtime! macros/matchit.vim " extended % matching for HTML, LaTeX, and more ...

" Netrw
let g:netrw_banner = 0

" General
" ==============================

set history=128 " number of rememebered command-lines

set omnifunc=syntaxcomplete#Complete " enable omni-completion

set completeopt=longest,menu " instert mode completion options

set scrolloff=10 " number of screen lines to keep around cursor

set ttimeoutlen=10 " time that is waited for a key code sequence

set autoread " autoload file changes

" User Interface
syntax enable

set termguicolors " enable true color support

set background=light
let g:vellum#monochrome=1
colorscheme vellum

set number relativenumber " show hybrid line numbers

set wildmenu " enhanced command-line completion

set cursorline " highlight the screen line of the cursor

set colorcolumn=101
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

" Tabs and spaces
set tabstop=4 " how many columns a tab counts for
set softtabstop=4 " how many columns are inserted when pressing tab
set shiftwidth=4 " how many columns text will be shifted
set expandtab " insert spaces when pressing tab

" Search and replace
set incsearch " show where pattern matches while typing
set hlsearch " highlight all search pattern matches
set ignorecase " ignores case when searching
set smartcase " overrides 'ignorecase' if search contains upper case characters

set path+=** " recursive folder search

set inccommand=nosplit " show effects of a command (e.g. replace) incrementally

" store backup files outside of working directory
if !isdirectory("$HOME/.local/share/backup")
    silent call mkdir($HOME . "/.local/share/backup", "p")
endif
set backupdir=$HOME/.local/share/backup//

" ------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------

" Plugins
" ==============================

" Fzf
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>n :Buffers<CR>

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" General
" ==============================

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" remove all trailing whitespace when pressing <Leader>w
nnoremap <silent> <leader>W m':let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s
            \<Bar> :nohl <Bar> :unlet _s <CR>`'

" mute search highlighting when pressing Control-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" add "il" as operator for whole line.
onoremap <silent> il :<C-u>normal! $v0<CR>
xnoremap <silent> il :<C-u>normal! $v0<CR>

" Abbreviations
" ==============================

iabbrev <expr> $# strftime('%Y-%m-%d')

" ------------------------------------------------------------
" SYNTAX HIGHLIGHTING
" ------------------------------------------------------------

match Todo /@[^:]*:/
