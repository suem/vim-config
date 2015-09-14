"===============================================================================
" Vundle
"===============================================================================

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" File navigation
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Show indent levels
Plugin 'nathanaelkane/vim-indent-guides'

" Comments
Plugin 'tpope/vim-commentary'

" Close Paris
Plugin 'kana/vim-smartinput'

" File browsing
Plugin 'scrooloose/nerdtree'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'

" Text Motion
Plugin 'justinmk/vim-sneak'

" Autosave Files
Plugin 'vim-scripts/vim-auto-save'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Text Objects
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Status line
Plugin 'bling/vim-airline'

" Color themems
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ajh17/Spacegray.vim'

" Haskell GHC completition
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'

" LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'


call vundle#end()
filetype plugin indent on 
syntax enable


"===============================================================================
" General Settings
"===============================================================================

syntax on

set lazyredraw

" Solid line for vsplit separator
set fcs=vert:│

" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
set number


"relative line numbering on focus
set relativenumber

" Hilight current line
" set cursorline

" Always splits to the right and below
set splitright
set splitbelow

" Colorscheme
" colorscheme jellybeans
" colorscheme spacegray

colorscheme solarized
set background=light
"set background=dark
let g:solarized_bold = 0
let g:solarized_underline = 0
let g:solarized_italic = 0
let g:solarized_visibility = 'high'

let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
    set guifont=Monaco:h13
elseif os == 'Linux'
    set guifont=Droid\ Sans\ Mono\ 11
endif

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Disable GUI stuff
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

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

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

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

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
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
  autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
augroup END



"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","


"===============================================================================
" Key Mappings
"===============================================================================

" Exit insert mode with jj
inoremap jj <ESC>

" Save with zz
nnoremap zz :w<CR>


"===============================================================================
" Tag files
"===============================================================================
"set tags+=~/.matlabtags

"===============================================================================
" Airline
"===============================================================================
 let g:airline_powerline_fonts=0
 let g:airline_left_sep=''
 let g:airline_right_sep=''


"===============================================================================
" NERDTree
"===============================================================================

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" Close vim if the only window open is nerdtree
"autocmd MyAutoCmd BufEnter *
"      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"===============================================================================
" NERDCommenter
"===============================================================================

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"===============================================================================
" Eclim
"===============================================================================
"let g:EclimCompletionMethod = 'omnifunc'


"===============================================================================
" Latex
"===============================================================================
let g:tex_conceal = ""
autocmd Filetype tex nmap ZZ :w \| :Latexmk <CR>

"===============================================================================
" YCM & UltiSnips
"===============================================================================
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_add_preview_to_completeopt = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"===============================================================================
" Haskell 
"===============================================================================
let g:necoghc_enable_detailed_browse = 1
nmap <silent> <leader>tt :GhcModType<CR>
nmap <silent> <leader>TT :GhcModTypeInsert<CR>
nmap <silent> <leader>tc :GhcModTypeClear<CR>


"===============================================================================
" Ocaml 
"===============================================================================
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "helptags " . g:opamshare . "/merlin/vim/doc"
let g:syntastic_ocaml_checkers = ['merlin']

"===============================================================================
" Auto save 
"===============================================================================
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode


"===============================================================================
" Indent Guides
"===============================================================================
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


"===============================================================================
" CtrlP
"===============================================================================
nnoremap <C-r> :CtrlPFunky<CR>
nnoremap ,b :CtrlPBuffer<CR>
nmap ,l :CtrlPLin<CR><C-\>w



"===============================================================================
" Tmux
"===============================================================================
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

