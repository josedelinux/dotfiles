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

" turn off annoying bell
set belloff=all

set backupdir=.
set directory=.

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" sometimes you press too fast
cnoremap W w
