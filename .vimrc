" Disable compatible mode with old VI
set nocompatible

" Assume dark background
set background=dark
set t_Co=256

" Set tab width to 4 characters
set tabstop=4
"set softtabstop=4
" width of intending << and >>
set shiftwidth=4
" Use spaces instead of \t character
"set expandtab
set noexpandtab
set smarttab

set autoindent
set smartindent

" Enable filetype plugins
filetype on                   " required!
filetype plugin indent on

syntax on

let mapleader = ","

" Set to auto read when a file is changed from the outside
set autoread

" Tab character as autofill (in command writing mode; after :)
set wildchar=<Tab>
set wildmenu
set wildmode=list:longest,full

set smartcase

" allow for cursor beyond last character
set virtualedit=onemore

" display the current mode
set showmode

" Dispaly 5 lines around cursor
set scrolloff=5

" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Cursor moves as expected on wrapped lines
map j gj
map k gk
map <Down> gj
map <Up> gk
inoremap <Down> <C-o>g<Down>
inoremap <Up> <C-o>g<Up>

set showmatch

" This shows what you are typing as a command
set showcmd

" Height of the command bar
set cmdheight=1

" Enable mouse support
set mouse=a

" Normal backspace behavior
set backspace=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Highlight things that we find with the search
set hlsearch
" Incremental search when typing
set incsearch
" Use leader + l to clear the highlighting of :set hlsearch.
map <silent> <leader>l :noh<CR>
" Ignore case in search
set ignorecase

" Complete
set omnifunc=syntaxcomplete#Complete
"set completeopt=longest,menuone
set completeopt=menu,menuone,longest

" Wrap long lines in space instead of middle of the word
set linebreak

" Always show current positions along the bottom
set ruler

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" For regular expressions turn magic on
set magic

" Allow saving of files as sudo when forgot to start it as sudo
cmap w!! w !sudo tee > /dev/null %

" Colorscheme
colorscheme jellybeans

" Display line numbers
set number
highlight LineNr ctermfg=blue

" Disable toolbar in GVim
set guioptions-=T

" Show statusline
"set ls=2

" Run Pathogen - plugin manager
execute pathogen#infect()

" Use F10 in insert mode to disable autointendation when inserting
set pastetoggle=<F10>

" Set system clipboard as default for yanking and pasting
set clipboard=unnamedplus

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


let g:SuperTabDefaultCompletionType = "context"
" Have preview window for C++ as its complex prototypes
"let g:clang_cpp_completeopt = 'longest,menuone,preview'
let g:clang_cpp_completeopt = 'longest,menuone'
let g:clang_cpp_options = '-std=c++14'
let g:clang_diagsopt = ''

" Height of the suggestions
set pumheight=15

"let g:NERDTreeWinPos = "right"
"let Tlist_Auto_Open = 1
let Tlist_Use_SingleClick = 1

" map F2 to next buffer
map <F2> :previous<CR>
" map F3 to next buffer
map <F3> :next<CR>

augroup __java__
au!
au BufReadPre,BufNewFile *.java set fileencodings=utf-8 fileencoding=utf-8 encoding=utf-8
"au BufRead,BufNewFile *.java set tw=0 foldmethod=indent cindent
au BufRead,BufNewFile *.java set tw=0
au BufRead,BufNewFile *.java set tabstop=4 expandtab
"au BufRead,BufNewFile *.java set foldmethod=syntax foldclose=all foldnestmax=1
au BufRead,BufNewFile *.java noremap <F9> :JavaBrowser<CR>
au BufRead,BufNewFile *.java inoremap <F9> <Esc>:JavaBrowser<CR>
au BufRead,BufNewFile *.java noremap <Tab> >>
"au BufRead,BufNewFile *.java so ~/.vim/plugin/javabrowser.vim
augroup END

"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
map <silent> <leader>x :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
set ttimeoutlen=50

function! MyHelp()
    echo "----------------------------------------------------------"
    echo "^x^n- used for omni completition"
    echo "^p - used for completition of current word (Previous) before cursor"
    echo "^n - used for completition of current word (Next) after cursor"
    echo "^x^f- Completion filename in current directory"
    echo ", t - will call plugin vim-command-t for searching files recursivelly from current directory"
    echo ":TlistAddFilesRecursive for adding files to tag list"
    echo "----------------------------------------------------------"
    echo "\n\n\n"
endfunction

map <F12> :call MyHelp()<CR>

