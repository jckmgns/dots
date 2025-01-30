" ================ PLUG ================

if empty(glob("$HOME/.local/share/nvim/site/autoload/plug.vim"))
    silent !sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim"
                \ --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/plugged')

" --------------------------------

" XML/HTML
Plug 'othree/xml.vim'

" Git
Plug 'airblade/vim-gitgutter'

" Motion
Plug 'ggandor/leap.nvim'

" Searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utility
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

Plug 'echasnovski/mini.align'
Plug 'echasnovski/mini.comment'
Plug 'echasnovski/mini.surround'

" Appearance
Plug 'jckmgns/vellum'

" --------------------------------

call plug#end()

" ================ SETTINGS ================

" ==== Languages ====

autocmd BufRead,BufNewFile *.glsl set filetype=c

autocmd FileType c    setlocal commentstring=//\ %s
autocmd FileType cpp  setlocal commentstring=//\ %s

set cinoptions+=L0  " Don't indent labels (added so the cursor doesn't jump for namespace colons).
set cinoptions+=N-s " Don't indent inside namespace.

let c_no_curly_error=1 " Don't highlight {} inside () as an error (added for compound literals).

" ==== General ====

set history=128 " Number of remembered command-lines.

set omnifunc=syntaxcomplete#Complete " Enable omni-completion.

set completeopt=longest,menu " Insert mode completion options.

set ttimeoutlen=10 " Time that is waited for a key code sequence.

set autoread " Autoload file changes.

set formatoptions+=o/ " Insert a comment leader only when // is at the start of the line.

" ==== User Interface ====

syntax enable

set termguicolors " Enable true color support

set background=light
colorscheme vellum

set number relativenumber " Show hybrid line numbers.

set scrolloff=10 " Number of screen lines to keep around cursor.

set linebreak       " Visually wraps long lines at characters defined in 'breakat'.
set showbreak=\ >\  " String to put at the start of wrapped lines.

set wildmenu " Enhanced command-line completion.

set cursorline " Highlight the screen line of the cursor.

" == Status line ==

set laststatus=2 " Always show status line.

set statusline=
set statusline+=\ %n\    " Buffer number.
set statusline+=\ %<%f\  " File name.
set statusline+=%m       " Modified flag.
set statusline+=%r       " Readonly flag.

set statusline+=%= " Separation point between left and right aligned items.

set statusline+=%y\                             " File type (filetype plugin).
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " File encoding.
set statusline+=%5l                             " Current line.
set statusline+=/%L                             " Total lines.
set statusline+=%4v\                            " Column number.

" ==== Tabs and spaces ====

set tabstop=4     " How many columns a tab counts for.
set softtabstop=4 " How many columns are inserted when pressing tab.
set shiftwidth=4  " How many columns text will be shifted.
set expandtab     " Insert spaces when pressing tab.

" ==== Search and replace ====

set incsearch  " Show where pattern matches while typing.
set hlsearch   " Highlight all search pattern matches.
set ignorecase " Ignores case when searching.
set smartcase  " Overrides 'ignorecase' if search contains upper case characters.

set path+=** " Recursive folder search.

set inccommand=nosplit " Show effects of a command (e.g. replace) incrementally.

" ==== Plugins ====

" leap.nvim
lua require('leap').create_default_mappings()

" mini.vim
lua require('mini.align').setup()
lua require('mini.comment').setup()
lua require('mini.surround').setup({
            \mappings = {
            \add = 'ma',
            \delete = 'md',
            \replace = 'mr',
            \find = '',
            \find_left = '',
            \highlight = '',
            \update_n_lines = '',
            \suffix_last = '',
            \suffix_next = '',
            \}})

" Gitgutter
set updatetime=500

" Matchit
runtime! macros/matchit.vim " Extended % matching for HTML, LaTeX, and more ...

" Netrw
let g:netrw_banner = 0

" ================ KEY MAPPINGS ================

" ==== General ====

" Remap leader to space, since it's easier to press than '\'.
nnoremap <SPACE> <Nop>
let mapleader=" "

" Unmap mark, since 'm' is used for mini.surround.
map m <Nop>

" Add a fallback mapping for mark (contains a trailing space).
nnoremap mm :mark 

" Move by visual line.
nnoremap j gj
nnoremap k gk

" Select all (i.e. the whole file).
nnoremap <C-A> ggVG

" Mute search highlighting when pressing Control-l.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Add "il" as operator for whole line.
onoremap <silent> il :<C-u>normal! $v0<CR>
xnoremap <silent> il :<C-u>normal! $v0<CR>

" ==== Plugins ====

" Fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>w :Windows<CR>

" ================ COMMANDS ================

" Remove trailing whitespace in the whole buffer.
function! ClearTrailingWhitespace()
    let l:position = winsaveview()
    :silent! keeppatterns %s/\s\+$//
    call winrestview(l:position)
endfunction
command! ClearTrailingWhitespace call ClearTrailingWhitespace()

" Show the name of the syntax group for the character under the cursor.
function! ShowSyntaxGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
command! ShowSyntaxGroup call ShowSyntaxGroup()

" ================ PROGRAMS ================

" grepprg
if executable('ugrep')
    set grepprg=ugrep\ -RInk\ -j\ -u\ --tabs=1\ --ignore-files
    set grepformat=%f:%l:%c:%m,%f+%l+%c+%m,%-G%f\\\|%l\\\|%c\\\|%m
endif

" ================ NEOVIDE ================

if exists("g:neovide")
    set guifont=monospace:h13.5

    let g:neovide_scroll_animation_length   = 0.2
    let g:neovide_position_animation_length = 0

    let g:neovide_cursor_animation_length = 0.06
    let g:neovide_cursor_trail_size       = 0.6
endif
