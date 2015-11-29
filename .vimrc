" Disable compatible mode with old VI
set nocompatible

" Assume dark background
set background=dark

" Set tab width to 4 characters
set tabstop=4
set softtabstop=4
" width of intending << and >>
set shiftwidth=4
" Use spaces instead of \t character
"set expandtab
set smarttab

set autoindent

" Enable filetype plugins
filetype plugin on
filetype indent on

syntax on

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
"set laststatus=2

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

" \" is also :, - is / in noinsert mode (because of czech keyboard) - BAD FOR REGISTERS
"set langmap=\":,-/

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
" Ignore case in search
set ignorecase

" Complete
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Wrap long lines in space instead of middle of the word
set linebreak

" Always show current positions along the bottom
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

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
"execute pathogen#infect()

" Use F10 in insert mode to disable autointendation when inserting
set pastetoggle=<F10>

" Set system clipboard as default for yanking and pasting
set clipboard=unnamedplus

"BEGIN_DEVASSISTANT_1
"Setting value devassistant to 0 will use your existing .vimrc file
"Setting value devassistant to 1 will use the vimrc defined by the devassistant feature

let devassistant=0
if devassistant==1
 :source /usr/share/devassistant/files/snippets/vim/vimrc
endif
"END_DEVASSISTANT_1
"
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

