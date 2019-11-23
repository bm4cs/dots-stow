" Yet another .vimrc
" Ben Simmonds (2015)
" See :options for further details.






" load plugins with vimplug
call plug#begin('~/.vim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'

" trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" improved motion
Plug 'easymotion/vim-easymotion'

" status line
Plug 'vim-airline/vim-airline'

" show git changes in left gutter
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" auto-close plugin
Plug 'rstacruz/vim-closer'

" surround things quotes, tags, anything!
Plug 'tpope/vim-surround'

" lang aware commenter
Plug 'tpope/vim-commentary'

" TOML syntax support
Plug 'cespare/vim-toml'

" denite - fuzzy finding, buffer management
Plug 'shougo/denite.nvim'

" generate tocs for markdown
Plug 'mzlogin/vim-markdown-toc'

" code formatter
"Plugin 'prettier/vim-prettier'

" shorthand notation
Plug 'junegunn/vim-easy-align'

" intellisense engine
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" golang plugins
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" colorscheme
Plug 'mhartington/oceanic-next'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "drop some legacy compatibility in favour of new things
filetype on "file specific goodness
filetype plugin on
filetype indent on
set autoread "refresh file contents when modified externally
set autochdir "use the current file's dir as working dir
set backspace=indent,eol,start "specifies what <BS> can do in Insert mode
"set colorcolumn=80 "columns to highlight (local to window)
set cursorline "highlight the screen line of the cursor (local to window)
set encoding=utf-8 "character encoding to be used in Vim
set fileencoding=utf-8 "character encoding to be used by current file
set gdefault "use the 'g' (global) flag for :substitute by default
set nohlsearch "highlight search results
set hidden "don't unload a buffer when no longer shown in a window
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
"set expandtab "expand <Tab> to spaces in Insert mode
set tabstop=4 "number of spaces a <Tab> in the text stands for
set softtabstop=4 "number of spaces to insert for a <Tab>
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set autoindent "automatically set the indent of a new line
set smartindent "do clever autoindenting
set wrap "wrap long lines
"set formatoptions=aw "mutt friendly; a=auto format para, w=para termination 
"non-white space



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
colorscheme OceanicNext "monokai "default color scheme
set t_Co=256 "the number of colors the terminal supports
let $TERM="xterm-256color"
"set term=screen-256color "what terminal type to use "neovim choked on this
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


" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>





" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)


" === Nerdtree shorcuts === "
" Toggle NERDTree on/off
nmap <leader>n :NERDTreeToggle<CR>
" Opens current file location in NERDTree
nmap <leader>f :NERDTreeFind<CR>
" PageDown
noremap <Space> <PageDown>
" PageUp
noremap - <PageUp>






""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
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




" === coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
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





" === nerdtree === "
let g:NERDTreeShowHidden = 1 "hidden files
let g:NERDTreeMinimalUI = 1 " remove bookmarks and help text
"let g:NERDTreeDirArrowExpandable = '⬏' "custom icons for expandable
"let g:NERDTreeDirArrowCollapsible = '⬎' "custom icons for expandable
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$'] "ignore list




" === vim airline ==== "
try

" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif

" unicode symbols
"let g:airline_left_sep = '❮'
"let g:airline_right_sep = '❯'

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry



" === vim-go ==="
" use gopls (googles lang server protocol plugin)
let g:go_def_mode='gopls'





" References
"
" A guide to modern Web Development with (Neo)vim
" https://medium.freecodecamp.org/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2
"
" How I revamped my Vim setup
" https://alex.dzyoba.com/blog/vim-revamp/
" 
" How I'm still not using GUIs in 2019: A guide to the terminal
" https://lucasfcosta.com/2019/02/10/terminal-guide-2019.html
