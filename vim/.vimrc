
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

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

" Show partial command you type in the last line of the screen.
set showcmd

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Use highlighting when doing a search.
set hlsearch

" turn off annoying bell
set belloff=all

set backupdir=.
set directory=.

" sometimes you press too fast
cnoremap W w
