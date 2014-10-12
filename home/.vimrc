set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'zeis/vim-kolor'
Plugin 'jgdavey/vim-railscasts'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

syntax on
set number
colorscheme railscasts

