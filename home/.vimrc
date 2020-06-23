set nocompatible " use vim defaults

set cursorline " highligh current line
set number " show line numbers
set ruler " show the current row and column
set scrolloff=10 " keep 10 lines when scrolling

set ai " set auto-indenting
set autoread " autoload file changes
set showcmd " display incomplete commands
set wildmenu " visual autocomplete for command menu

set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " ignores the case when searching
set smartcase " case sensitive if pattern contains upper case character

set expandtab " insert spaces when pressing tab
set shiftwidth=4 " how many columns text will be shifted
set softtabstop=4 " how many columns are inserted when pressing tab
set tabstop=4 " how many columns a tab counts for

syntax on " turn syntax highlighting on
filetype on " detect file type
filetype indent on " load indent file for file type

set path+=** " recursive folder search

" move by visual line
nnoremap j gj
nnoremap k gk
