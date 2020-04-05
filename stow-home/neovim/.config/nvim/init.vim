" Yet another .vimrc (YAVR)
" Ben Simmonds (2015)
" See :options for further details.
"
" ▄▄▄▄· • ▌ ▄ ·. .▄▄
" ▐█ ▀█▪·██ ▐███▪▐█ ▀.
" ▐█▀▀█▄▐█ ▌▐▌▐█·▄▀▀▀█▄
" ██▄▪▐███ ██▌▐█▌▐█▄▪▐█
" ·▀▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀▀



" load plugins with vimplug
call plug#begin('~/.config/nvim/plugged')
Plug 'ntpeters/vim-better-whitespace' "trailing whitespace
Plug 'easymotion/vim-easymotion' "precise motioning
Plug 'vim-airline/vim-airline' "status line
Plug 'mhinz/vim-signify' "git gutter
Plug 'tpope/vim-fugitive' "git integration
"Plug 'jiangmiao/auto-pairs' "auto clode brackets
Plug 'tpope/vim-surround' "wrap text
Plug 'tpope/vim-commentary' "smart commenter
Plug 'shougo/denite.nvim' "file jumper
Plug 'mzlogin/vim-markdown-toc' "contents generator
Plug 'junegunn/vim-easy-align' "code neatener
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} "autocomplete
Plug 'fatih/vim-go' "golang
Plug 'nsf/gocode' "golang
Plug 'arcticicestudio/nord-vim' "colorscheme
Plug 'ryanoasis/vim-devicons' "file type icons
"Plug 'scrooloose/nerdtree' "file explorer
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "nerdtree devicons
Plug 'mcchrish/nnn.vim' "file explorer
Plug 'ap/vim-css-color' "colorise hashcodes
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html'] }
call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "drop some legacy compatibility in favour of new things
filetype on "file specific goodness
filetype plugin on
filetype indent on
set autoread "refresh file contents when modified externally
set autochdir "use the current file as working dir
set backspace=indent,eol,start "specifies what <BS> can do in Insert mode
set colorcolumn=80 "visual ruler
set cursorline "highlight the screen line of the cursor
set encoding=utf-8 "character encoding to be used in Vim
set fileencoding=utf-8 "character encoding to be used by current file
set gdefault "use the 'g' (global) flag for :substitute by default
set nohlsearch "highlight search results
set hidden "dont unload a buffer when no longer shown in a window
set ignorecase "ignore case when searching
set incsearch "show match for partly typed search command
set list "show non-vis characters
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:⋅ "representation of non-vis chars
let g:mapleader=',' "remap leader key to ,
set number "show line numbers
"set paste "disabled because resets expandtab (spaces not tabs)
set relativenumber "make line numbering relative to the current line
set shell=/bin/bash "default shell
set showmatch "when inserting a bracket, briefly jump to its match
set smartcase "override 'ignorecase' when pattern has upper case characters
set laststatus=2 "2 = always show a status line for vim-airline
set novisualbell "don't use a visual bell instead of beeping
set winheight=5 "minimal number of lines used for the current window
set winminheight=5 "minimal number of lines used for any window
set winwidth=84 "minimal number of columns used for the current window
set wildmode=list:longest "activate <TAB> auto-completion for file paths
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.git,.svn,.hg
set wildignore+=*~,*.swp,*.tmp



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab "expand <Tab> to spaces in Insert mode
set tabstop=4 "number of spaces a <Tab> in the text stands for
set softtabstop=4 "number of spaces to insert for a <Tab>
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set autoindent "automatically set the indent of a new line
set smartindent "do clever autoindenting
set wrap "wrap long lines



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undos
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile "don't use a swap file for this buffer
set nobackup "don't write a backup file before overwriting a file
set nowb "don't write a backup file before overwriting a file



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark "editor theme

"set termguicolors "enable true color
syntax enable "syntax highlighting
colorscheme nord "default color scheme
set t_Co=256 "the number of colors the terminal supports
let $TERM="st-256color"
"set term=st-256color "what terminal type to use
au BufNewFile,BufRead *.adoc set filetype=asciidoc



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" never arrows in vim,  break the addition today!
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" elevated save
cmap w!! w !sudo tee %


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys denite
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ; - search open buffers
nmap ; :Denite buffer -split=floating -winrow=1<CR>
" <leader>t - list files in current dir
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
" <leader>g - grep files in current dir
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
" <leader>j - search for term under cursor
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys COC
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Toggle NERDTree on/off
" nmap <leader>n :NERDTreeToggle<CR>
" " Opens current file location in NERDTree
" nmap <leader>f :NERDTreeFind<CR>
" " PageDown
" noremap <Space> <PageDown>
" " PageUp
" noremap - <PageUp>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys vim-easy-align
""""""""""""""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)






""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Denite
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
try

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:NERDTreeShowHidden = 1 "hidden files
"let g:NERDTreeMinimalUI = 1 " remove bookmarks and help text
""let g:NERDTreeDirArrowExpandable = '⬏' "custom icons for expandable
""let g:NERDTreeDirArrowCollapsible = '⬎' "custom icons for expandable
"let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$'] "ignore list



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""

try

let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline_section_z = airline#section#create(['linenr'])
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:NERDTreeStatusline = ''
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline_theme='oceanicnext'

let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:go_def_mode='gopls'



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin nnn.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

