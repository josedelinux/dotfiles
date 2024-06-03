" ref:
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" To temporarily use Vim without loading your .vimrc configuration file
" `vim -u /dev/null`

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

if &diff
    colorscheme blue
endif

" sometimes you press too fast
" command mode: write
cnoremap W w

" command mode: quit
cnoremap Q q

" command mode: sudo force write
cnoremap w!! w !sudo tee > /dev/null % <CR>

" normal mode: save
nnoremap <c-s> :w<CR>

" insert mode: escape
inoremap jk <ESC>
