" Disable vi-compatibility
set nocompatible

"===============================================================================
" NeoBundle
"===============================================================================

if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" Fuzzy search
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/neomru.vim'

" Hilight search and replace
NeoBundle 'osyo-manga/vim-over'

" Code completion
NeoBundle 'Shougo/neocomplete'
" NeoBundle 'Valloric/YouCompleteMe'


" Snippets
"NeoBundle 'SirVer/ultisnips'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Comments
NeoBundle 'tpope/vim-commentary'

" Close Paris
NeoBundle 'kana/vim-smartinput'

" File browsing
NeoBundle 'scrooloose/nerdtree'

" Syntax checker
NeoBundle 'scrooloose/syntastic'

" Editor Config
NeoBundle 'editorconfig/editorconfig-vim'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" Motions
"NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'justinmk/vim-sneak'

" Text Objects
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_

" Status line
NeoBundle 'bling/vim-airline'
" NeoBundle 'maciakl/vim-neatstatus'

" Color themems
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'

" C/C++ support for neocomplete
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'osyo-manga/vim-reunions'

" Haskell GHC completition
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'

" Octave/Matlab
NeoBundle 'octave.vim'

" LaTeX
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'

" Javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

filetype plugin indent on
syntax enable

NeoBundleCheck


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

" Exit insert mode with jj
inoremap jj <ESC>

"relative line numbering on focus
set relativenumber

" Hilight current line
set cursorline

" Always splits to the right and below
set splitright
set splitbelow

" Colorscheme
colorscheme solarized
set background=light
" set background=dark
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
" set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
" set showbreak=↪

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" augroup MyAutoCmd
"   autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
"   autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
"   autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
"   autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
" augroup END

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

" Set sensible heights for splits
" set winheight=50
" Setting this causes problems with Unite-outline. Don't really need it
" set winminheight=5

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Don't show matching brackets
" set noshowmatch

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
" set colorcolumn=+1

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
" set textwidth=80
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


" Enable omni completion
augroup MyAutoCmd
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType matlab setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType octave setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
augroup END



"===============================================================================
" Tag files
"===============================================================================
set tags+=~/.matlabtags

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
autocmd MyAutoCmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"===============================================================================
" Matlab
"===============================================================================
" augroup filetypedetect
"     au! BufRead,BufNewFile *.m,*.oct set filetype=octave
" augroup END


"===============================================================================
" NERDCommenter
"===============================================================================

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"===============================================================================
" Eclim
"===============================================================================

let g:EclimCompletionMethod = 'omnifunc'


"===============================================================================
" Latex
"===============================================================================
let g:tex_conceal = ""
autocmd Filetype tex nmap ZZ :w \| :Latexmk <CR>

"===============================================================================
" YCM
"===============================================================================
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_add_preview_to_completeopt = 1

"===============================================================================
" UltiSnips
"===============================================================================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"===============================================================================
" Neocomplete
"==============================================================================

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" enable marcing clang complete
let g:marching_enable_neocomplete = 1
let g:marching_include_paths = filter(
\   split(glob('/usr/include/c++/*'), '\n') +
\   split(glob('/usr/include/*/c++/*'), '\n') +
\   split(glob('/usr/include/*/'), '\n'),
\   'isdirectory(v:val)')


" Snippets

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"===============================================================================
" Unite
"===============================================================================

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ ], '\|'))

" use the silver searcher
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt=''

" Mappings

nnoremap <space>f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>
nnoremap <space>b :<C-u>Unite -buffer-name=buffer<CR>
nnoremap <space><space> :<C-u>Unite -buffer-name=buffer file_mru<CR>
nnoremap <C-p> :<C-u>Unite -buffer-name=buffer file file_mru file_rec/async<CR>
nnoremap <space>o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
nnoremap <space>l :<C-u>Unite -buffer-name=line line<CR>
nnoremap <space>; :<C-u>Unite -buffer-name=history history/command command<CR>
nnoremap <space>g :<C-u>Unite -buffer-name=ag grep:.<CR>
nnoremap <space>G :<C-u>UniteWithCursorWord -buffer-name=ag grep:.<CR>

nnoremap <space>d :<C-u>Unite -buffer-name=directory_mru -default-action=lcd directory_mru<CR>
" nnoremap <space>n :<C-u>Unite -buffer-name=find find:.<CR>

" Map space to the prefix for Unite
" nnoremap [unite] <Nop>
" nmap <space> [unite]

" General fuzzy search
" nnoremap <silent> [unite]<space> :<C-u>Unite
"       \ -buffer-name=files buffer file_mru file_rec/async<CR>

" Quick registers
" nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
" noremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" " Quick yank history
" nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" " Quick outline
" nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
" nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
" nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
" nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" " Quickly switch lcd
" nnoremap <silent> [unite]d
"       \ :<C-u>Unite -buffer-name=directory_mru -default-action=lcd directory_mru<CR>
" nnoremap <silent> [unite]D
"       \ :<C-u>Unite -buffer-name=directory directory<CR>

" " Quick file search
" nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
" nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
" nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
" nnoremap <silent> [unite]L :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>
" nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=line line<CR>

" Quick MRU search
" nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
" nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
" nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
" nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
"       \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick commands
" nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>

" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
  " imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  " imap <buffer> <Tab> <Plug>(unite_exit_insert)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  if unite.buffer_name =~# '^outline'
    imap <buffer> <C-\> <Plug>(unite_exit)
  endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  if unite.buffer_name =~# '^search_file'
    imap <buffer> <C-_> <Plug>(unite_exit)
  endif
endfunction

" Start in insert mode
let g:unite_enable_start_insert = 1

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

"===============================================================================
" Haskell Stuff
"===============================================================================
let g:necoghc_enable_detailed_browse = 1
