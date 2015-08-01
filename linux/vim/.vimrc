set nocompatible

filetype on
filetype plugin on

execute pathogen#infect()
syntax enable

 
" ##### General settings #####
set t_Co=256
"set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set guifont=Monaco:h14
"set guioptions-=Be
"set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:⋅
set noswapfile
set number
set shell=/bin/bash
set showmatch
set smartcase
"set smartindent
"set term=screen-256color
set ts=2 sts=2 sw=2 expandtab
set visualbell
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84

syntax enable
colorscheme monokai

