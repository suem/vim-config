
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Solarized'
Bundle 'Zenburn'
Bundle 'Auto-Pairs'
Bundle 'The-NERD-Commenter'
Bundle 'EasyMotion'
Bundle 'surround.vim'
"Bundle 'SuperTab'
Bundle 'terryma/vim-expand-region.git'
Bundle 'Syntastic'
Bundle 'ctrlp.vim'
Bundle 'scrooloose/nerdtree.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'neocomplcache'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/vimproc.vim'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'



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

" Activate wildmode
set wildmenu
set wildmode=list:longest,full

" Ignored filetypes in search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

" Fix NerdTree bug 
let g:NERDTreeDirArrows=0

" Configure CtrP
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ }
nmap <M-b> :CtrlPBuffer<cr>
nmap <M-o> :CtrlPBufTag<cr>

let g:EclimCompletionMethod = 'omnifunc'

" Completion options
set completeopt-=preview


" Neocomplcahce config
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"haskell stuff
let g:necoghc_enable_detailed_browse=1
let g:ghc="/usr/bin/ghc"
let g:haddock_browser="/usr/bin/chromium-browser"

au BufEnter *.hs compiler ghc


" press jj in insert mode to exit it
:imap jj <Esc>


" user ; instead of : for commands
"nnoremap ; :

