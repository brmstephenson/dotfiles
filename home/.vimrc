set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jgdavey/vim-railscasts'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

syntax on
set number
set t_Co=256
colorscheme railscasts

set hlsearch

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"git gutter (with railscasts)
highlight SignColumn ctermbg=black
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

highlight GitGutterAdd ctermfg=46 "Green
highlight GitGutterChange ctermfg=220 "Gold
highlight GitGutterDelete ctermfg=196 "Red
highlight GitGutterChangeDelete ctermfg=208 "DarkOrange
