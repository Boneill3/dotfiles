"Added for Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/syntastic' "syntax highlighting
"Plugin 'octol/vim-cpp-enhanced-highlight' "cpp enhanced syntax highlighting
Plugin 'vim-airline/vim-airline' "Footer bar
" All of your Plugins must be added before the following line
call vundle#end()            " required

"CPP Enchanced Highlight Options
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1


filetype indent plugin on
syntax on " turn on syntax highlighting
set number " line numbers
set ruler
" set cursorline
color desert " set color scheme to desert, more schemes in vim's color folder
set background=dark

" search options
" highlight search results, toggle with :set highlight! or disable with :noh
set hlsearch
 " show incremental matches to search options as it is being typed
set incsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set nostartofline
set autoindent
set laststatus=2 " always display status
set confirm
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set smartindent

" save on refocus
:au FocusLost * :wa " will complain on untitled and read-only buffers
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" function to restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

" autocommands
" restore cursor
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

