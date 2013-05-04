
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Solarized'
Bundle 'Zenburn'
Bundle 'Auto-Pairs'
Bundle 'The-NERD-Commenter'
Bundle 'EasyMotion'
Bundle 'surround.vim'
Bundle 'SuperTab'
Bundle 'terryma/vim-expand-region.git'
Bundle 'Syntastic'
Bundle 'ctrlp.vim'

" fonts
set guifont=DejaVu\ Sans\ Mono\ 11


" Solarized Color Scheme
syntax enable
let g:solarized_termcolors=16
set background=light
colorscheme solarized

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"enable file type specific handling
filetype plugin indent on


" allow hidden buffers
set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
"    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
"    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"

" Fix NerdTree bug 
let g:NERDTreeDirArrows=0

" press jj in insert mode to exit it
:imap jj <Esc>


" user ; instead of : for commands
"nnoremap ; :

