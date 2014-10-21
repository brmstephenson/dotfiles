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
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
"Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'goatslacker/mango.vim'
Plugin 'scrooloose/syntastic'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

set t_Co=256
set background=dark
syntax on
color mango

set pastetoggle=<F12>     " sane indentations when pasting
set cursorline
set encoding=utf-8        " necessary to show unicode glyps

let mapleader=","

" allow buffers to be hidden instead of closing
set hidden

" buffer naviation
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>

" not sure what the following 2 do
map <leader>g :e#<cr>
map <leader>l :ls<cr>

" clear highlighting with , + /
nmap <silent> ,/ :nohlsearch<CR>

nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
nnoremap <leader>0 :10b<cr>

"allow to switch buffers by {Buffer#}gb (e.g. 52gb --> buffer 52)
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<cr>"
  let c += 1
endwhile

nnoremap <F10> :b <C-Z>

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>

set number		 " show line numbers
set nowrap		 " do not wrap lines
set tabstop=2		 " a tab is 2 spaces
set autoindent		 " always set autoindenting on
set number		 " show the line numbers
set shiftwidth=2	 " set number of spaces to use for autoindenting
set expandtab
set smarttab

set autoread      " set to auto read when a file is changed from the outside
"set showmatch     " set matching brackets when text indicator is over them

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

" tmux-complete configuration
let g:tmuxcomplete#trigger = 'completefunc'

" navigate splits easier; no need for Ctrl-W prefix
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" not entirely sure
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd lclose\|bdelete

" allows me to use Alt key
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
" not sure if this breaks anything else
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" move lines up or down easier
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <ESC>:m .+1<CR>==gi
inoremap <A-k> <ESC>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv==gv
vnoremap <A-k> :m '<-2<CR>gv==gv

" tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
