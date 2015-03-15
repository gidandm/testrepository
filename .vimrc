" me
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
set laststatus=2        " status line enable
set number              " always display number
colo elflord            " color theme elflord
syntax on
set t_Co=256

filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'bling/vim-airline'

call vundle#end()            " required
let g:airline_powerline_fonts = 1 
filetype plugin indent on    " required
set viminfo='50,<1000,s100,h
set clipboard+=unnamed
