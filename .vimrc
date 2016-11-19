" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" PLUGINS START

Plugin 'VundleVim/Vundle.vim' " required

Plugin 'jdonaldson/vaxe' " vaxe plugin for haxe shiz
" Plugin 'vim-scripts/AutoComplPop' " AutoComplPop


" PLUGINS END

call vundle#end()            " required
filetype plugin indent on    " required

" --------------------------------------------------------------

" BASICS
syntax enable " enable syntax highlighting

" SPACES AND TABS
set tabstop=4 " tab size 4
set softtabstop=4 " number of spaces in tab when editing

" CUSTOM
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set autowrite

" UI CONFIG
set number " show line numbers
set cursorline " highlight current line
filetype indent on " load filetype specific indent files
set wildmenu " visual autocomplete for command menu
set showmatch " highligh matching braces and such

" SEARCHING
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" LEADER SHORTCUTS

" jk is escape
inoremap jk <esc>

