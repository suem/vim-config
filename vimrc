"===============================================================================
" vim-plug 
"===============================================================================

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

Plug 'scrooloose/syntastic'

Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'lervag/vimtex'

" Plug 'ajh17/VimCompletesMe'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}


Plug 'let-def/ocp-indent-vim'

call plug#end()
" "===============================================================================
" " General Settings
" "===============================================================================

" disable VI compability
set nocompatible 

" enable syntax hilighting
syntax on

" filetype specific settings on
filetype plugin indent on

" performance boost
set ttyfast 
set lazyredraw

" Solid line for vsplit separator
" set fcs=vert:│

" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
set number

"relative line numbering on focus
set relativenumber

" Hilight current line
set cursorline

" Always splits to the right and below
set splitright
set splitbelow

" Colorscheme
"base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" colorscheme solarized
" set background=light
" "set background=dark
" let g:solarized_bold = 0
" let g:solarized_underline = 0
" let g:solarized_italic = 0
" let g:solarized_visibility = 'high'

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Disable GUI stuff
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" Display unprintable chars
" set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
" set showbreak=↪

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode due to Powerline
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings, 1 tab == 4 spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Text display settings
set linebreak
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif


" Enable omni completion
augroup MyAutoCmd
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  " autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
augroup END


" Map leader and localleader key to comma
let mapleader =  "\<Space>"
let g:mapleader =  "\<Space>"
let maplocalleader =  "\<Space>"
let g:maplocalleader =  "\<Space>"

"===============================================================================
" Key Mappings
"===============================================================================



" Save with zz
nnoremap zz :w<CR>

" nnoremap <C-e> :BTags<CR>
" nnoremap <C-p> :Files<CR>
" nnoremap <C-b> :Buffers<CR>
" nnoremap <C-l> :BLines<CR>

" nnoremap <C-]> :YcmCompleter GoTo<CR>


nnoremap <C-b> :CtrlPBuffer<CR>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

"===============================================================================
" Airline
"===============================================================================
 let g:airline_powerline_fonts=0
 let g:airline_left_sep=''
 let g:airline_right_sep=''


"===============================================================================
" Syntastic
"===============================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"===============================================================================
" OCaml
"===============================================================================

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

let g:syntastic_ocaml_checkers = ['merlin']
let g:merlin_ignore_warnings = "false"
let g:merlin_split_method = "never"

set rtp^="/home/suem/.opam/system/share/ocp-indent/vim"


