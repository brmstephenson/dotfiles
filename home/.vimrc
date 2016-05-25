set nocompatible
set backspace=2
set runtimepath+=~/.vim/my-snippets/
filetype off

call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Information panels
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'mattn/emmet-vim' " improves HTML & CSS workflow
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic' " Checks for syntax errors
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'godlygeek/tabular' " vim script for text filtering and alignment
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-bufferline' " show bufferes in the command bar
Plug 'editorconfig/editorconfig-vim' " editor config plugin
Plug 'terryma/vim-multiple-cursors'
Plug 'qpkorr/vim-bufkill'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'mlaursen/vim-react-snippets'

" Syntax highlighters
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript', { 'branch': 'develop' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'fatih/vim-go'
Plug 'moskytw/nginx-contrib-vim'
Plug 'elzr/vim-json'

" Colorschemes
Plug 'jonathanfilip/vim-lucius'
Plug 'jgdavey/vim-railscasts'
Plug 'goatslacker/mango.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'blerins/flattown'
Plug 'crusoexia/vim-monokai'
Plug 'yosiat/oceanic-next-vim'
Plug 'vim-airline/vim-airline-themes'

" All plugins must be added before the following line
call plug#end()
filetype plugin indent on

color lucius
syntax on

let mapleader=","
inoremap jk <ESC>

set pastetoggle=<F12> " sane indentations when pasting
set cursorline        " highlight entire row that contains the cursor
set encoding=utf-8    " necessary to show unicode glyps
set backupcopy=yes    " copy file and then when saving overwrite the origin; helps with file watchers on Linux
set background=light
set hidden            " allow buffers to be hidden instead of closing
set hlsearch
set incsearch
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
set number		 " show line numbers
set nowrap		 " do not wrap lines
set tabstop=2		 " a tab is 2 spaces
set autoindent		 " always set autoindenting on
set shiftwidth=2	 " set number of spaces to use for autoindenting
set expandtab
set smarttab
set completeopt-=preview " Don't show autocomplete split
set autoread      " set to auto read when a file is changed from the outside
set showmatch     " set matching brackets when text indicator is over them
set timeout ttimeoutlen=50

set backupdir=/tmp/
set directory=/tmp/

imap <c-x><c-k> <plug>(fzf-complete-path)

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

" 'mxw/vim-jsx' does not require *.jsx extension to highlight jsx code
let g:jsx_ext_required = 0

" buffer naviation
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>
" switch to previously used buffer
map <leader>g :e#<cr>
" list buffers
map <leader>l :ls<cr>
" refresh all buffers
map <leader>r :bufdo checktime<cr>

" prevent buffers from showing up in the command line
let g:airline#extensions#tabline#buffer_nr_show = 1

" easily swithc between buffers 1-10
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

map <C-p> :FZF --multi<cr>
map <leader><C-p> :GitFiles<cr>

map <leader><C-b> :Buffer<cr>
map <leader><C-h> :History<cr>
" set wildchar=<Tab> wildmenu wildmode=full
" set wildcharm=<C-Z>

runtime! macros/matchit.vim

" toggle line numbers
nnoremap <F9> :set number!<cr>
" show the full file name
map <F7> <Esc>:echo expand('%:p')<Return>

" nerdtree
map <C-i> :NERDTreeToggle<CR>

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

let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:javascript_eslint_exe = 'npmexec eslint --'

function! JavascriptLinters()
  let checkers = []
  let eslint = findfile('.eslintrc', '.;') != '' ? add(checkers, 'eslint') : ''
  let eslintjson = findfile('.eslintrc.json', '.;') !='' ? add(checkers, 'eslint') : ''
  let jscs = findfile('.jscsrc', '.;') != '' ? add(checkers, 'jscs') : ''
  let jshint = findfile('.jshintrc', '.;') != '' ? add(checkers, 'jshint') : ''

  return checkers

endfunction

" https://github.com/scrooloose/syntastic/issues/974#issuecomment-73837549
let g:syntastic_javascript_checkers=JavascriptLinters()

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Change utilsnips so it does not use tab by default
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" allows me to use Alt key
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
" not sure if this breaks anything else
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
unlet c


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
      \'win'  : '#I #W #F',
      \'cwin' : '#I #W #F',
      \'x'    : '%a',
      \'y'    : '%R',
      \'z'    : '#H'}

" prevent window from scrolling when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

au BufRead,BufNewFile *.ats setfiletype typescript
au BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc setfiletype json

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
