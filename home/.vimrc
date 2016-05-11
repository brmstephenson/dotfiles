set nocompatible
set backspace=2
filetype off

" clone Vundle directory if it doesn't already exist
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Information panels
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'airblade/vim-gitgutter'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'

Plugin 'kien/ctrlp.vim' " fuzzy file finder
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'mattn/emmet-vim' " improves HTML & CSS workflow
Plugin 'tpope/vim-commentary' " comment stuff out
Plugin 'ervandew/supertab' " perform all your vim inster mode completions with Tab
Plugin 'scrooloose/syntastic' " Checks for syntax errors
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple
Plugin 'godlygeek/tabular' " vim script for text filtering and alignment
" Plugin 'scrooloose/nerdtree' " file tree explorer
Plugin 'bling/vim-bufferline' " show bufferes in the command bar
Plugin 'editorconfig/editorconfig-vim' " editor config plugin
Plugin 'terryma/vim-multiple-cursors'
Plugin 'qpkorr/vim-bufkill'
" Plugin 'gerw/vim-HiLinkTrace'

" Snippets
" Bundle 'tomtom/tlib_vim'
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Syntax highlighters
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/html5.vim'
" Plugin 'burnettk/vim-angular'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'fatih/vim-go'
" Plugin 'wookiehangover/jshint.vim'
Plugin 'moskytw/nginx-contrib-vim'
Plugin 'elzr/vim-json'

" Plugin 'ElmCast/elm-vim'
" Plugin 'lambdatoast/elm.vim'

" Colorschemes
Plugin 'jonathanfilip/vim-lucius'
Plugin 'jgdavey/vim-railscasts'
Plugin 'goatslacker/mango.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/seoul256.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'blerins/flattown'
Plugin 'crusoexia/vim-monokai'
Plugin 'yosiat/oceanic-next-vim'
Plugin 'vim-airline/vim-airline-themes'

" All plugins must be added before the following line
call vundle#end()
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

"set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_map = '<C-p>' " change the default mapping
let g:ctrlp_cmd = 'CtrlP' " change the defualt command to invoke CtrlP
set wildignore+=*/.tmp*,*.so,*.swp,*.zip " exclude files and directories
let g:ctrlp_custom_ignore = '\v[\/](.*reports.*|\.idea|jspm_packages|node_modules|bower_components|dist|target)|(\.(swp|ico|git))$'
let g:ctrlp_show_hidden = 1 " index dotfiles
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
map <leader>o :CtrlPRoot<cr>

" toggle line numbers
nnoremap <F9> :set number!<cr>

" nerdtree
" map <C-n> :NERDTreeToggle<CR>
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

" close syntastic error window by deleting buffer
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd lclose\|bdelete


function! JavascriptLinters()
  let checkers = []
  let eslint = findfile('.eslintrc', '.;') != '' ? add(checkers, 'eslint') : ''
  let eslintjson = findfile('.eslint.json', '.;') !='' ? add(checkers, 'eslint') : ''
  let jscs = findfile('.jscsrc', '.;') != '' ? add(checkers, 'jscs') : ''
  let jshint = findfile('.jshintrc', '.;') != '' ? add(checkers, 'jshint') : ''

  return checkers

endfunction

" https://github.com/scrooloose/syntastic/issues/974#issuecomment-73837549
let g:syntastic_javascript_checkers=JavascriptLinters()


" Change snipmate so it does not use tab by default
" imap <C-J> <Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger

" Change utilsnips so it does not use tab by default
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-Z>"

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
autocmd BufEnter * silent! lcd %:p:h

au BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc setfiletype json

map <F7> <Esc>:echo expand('%:p')<Return>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
