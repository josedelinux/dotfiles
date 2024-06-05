" ref:
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" To temporarily use Vim without loading your .vimrc configuration file
" `vim -u /dev/null`

" Leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

if ! empty(globpath(&rtp, 'autoload/plug.vim'))
  call plug#begin()

  " List your plugins here
  Plug 'morhetz/gruvbox'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/tagbar'
  Plug 'liuchengxu/vim-which-key'
  "Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

  call plug#end()
endif

" === whichkey ===
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=500
let g:which_key_map =  {}

" buffer operation
let g:which_key_map.b = 'new-buffer'
let g:which_key_map.x = 'close-buffer'

silent! call which_key#register('<Space>', "g:which_key_map")
" === whichkey ===

" === theme gruvbox ===
"colorscheme gruvbox
if &runtimepath =~? "gruvbox"
  colorscheme gruvbox
else
  colorscheme desert
endif
" Setting dark mode
set background=dark

if &diff
    colorscheme blue
endif

" transparent background
autocmd VimEnter * hi Normal ctermbg=none

" === theme gruvbox ===

" === indent-guides ===

let g:indent_guides_enable_on_vim_startup = 1
" colorscheme tir_black
" set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" === indent-guides ===

" === gutentags ===
"let g:gutentags_trace = 1
let g:gutentags_modules = ['ctags']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" Specifies the name of the tag file to create
"let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags)
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--kinds-C=+px']
let g:gutentags_ctags_extra_args += ['--kinds-C++=+px']
"autocmd! User vim-gutentags call gutentags#setup_gutentags()

" === gutentags ===

" === airline ===
let g:airline#extensions#tabline#enabled = 1

" === airline ===


" === tagbar ===
nmap <leader>tb :TagbarToggle<CR>

" === tagbar ===


" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
"set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" also check out :help \c

" show cursor position
set ruler

" Show partial command you type in the last line of the screen.
set showcmd

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Use highlighting when doing a search.
set hlsearch

" Indentation without hard tabs
" ref: https://vim.fandom.com/wiki/Indenting_source_code

" `:set et/noet` to turn on/off
" `:retab` to convert tab to space
"set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

if has("autocmd")
    " If the filetype is Makefile then we need to use tabs
    " So do not expand tabs into space.
    autocmd FileType make   set noexpandtab
endif

" Enable auto-indentation
set autoindent
set smartindent
set cindent

" Show indentation guides
set list listchars=tab:▸\ ,trail:·
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣


" turn off annoying bell
set belloff=all

" Save undo history between sessions
set undofile

" Keep 100 lines of undo history
set undolevels=500

" Turn on backup option
set backup

" Always show tabline (default 1)
set showtabline=2

if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir -p ~/.vim/backupdir"
endif

"Where to store backups
set backupdir=~/.vim/backupdir//,.

"Where to store swap files
set directory=~/.vim/backupdir//,.

"Where to store undo files
set undodir=~/.vim/backupdir//,.

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Mappings

" sometimes you press too fast
" command mode: write
cnoremap W w

" command mode: quit
cnoremap Q q

" command mode: sudo force write
cnoremap w!! w !sudo tee > /dev/null % <CR>

" normal mode: save
nnoremap <c-s> :w<CR>

" Copy and paste
if has('clipboard')
	" Copy the Whole file
	nnoremap <c-c> :%y+<CR>

	" use y p d probably more efficient
	vnoremap <C-c> "+y
	vnoremap <C-x> "+d
	vnoremap <C-v> "+p

	" input mode paste
	inoremap <C-v> <C-r><C-o>+
endif

" insert mode: escape
inoremap jk <ESC>

" normal mode: clear highlight
nnoremap <Esc> :noh<CR>

" buffer navigation
nnoremap <leader>b :enew<CR>

nnoremap <tab> :bnext<CR>
"let g:which_key_map['<tab>'] = 'next'

nnoremap <S-tab> :bprevious<CR>

nnoremap <leader>x :bdelete<CR>

