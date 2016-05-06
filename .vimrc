" This must be first, because it changes other options as a side effect.
set nocompatible



" ### Vundle

set nocompatible                    " be iMproved, required
filetype off                        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'          " required

" Custom Vundle Plugins
Plugin 'fatih/vim-go'               " Golang support
Plugin 'jpo/vim-railscasts-theme'   " Railscasts theme
Plugin 'kien/ctrlp.vim'             " Fuzzy file finder
Plugin 'Valloric/YouCompleteMe'     " Autocomplete without shortcuts

" <add more here>

" All of your Plugins must be added before the following line
call vundle#end()                   " required
filetype plugin indent on           " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ



" ### Vim Config

" Use ag for searching, if available; otherwise fall back to find
if executable("ag")
  let s:search_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .pants.d
      \ -g ""'
else
  let s:search_command = 'find %s -type f'
endif

" Show relative line numbers
set number
set relativenumber

" Turn on syntax highlighting
syntax on

" Intendation
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Don't wrap lines
set nowrap

" Wrap lines at convenient points
set linebreak

" Allow backspace in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=1000

" Show incomplete cmds down the bottom
set showcmd

" Show current mode down the bottom
set showmode

" Disable cursor blink
set gcr=a:blinkon0

" No sounds
set visualbell

" Reload files changed outside vim
set autoread

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Keep undo history across sessions, by storing in file
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Fold based on indent
set foldmethod=indent

" Deepest fold is 3 levels
set foldnestmax=3

" Don't fold by default
set nofoldenable

" Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest
set wildmenu

" Stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~ 
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Incremental search with highlight
set incsearch
set hlsearch

" Go Language Syntax Highlighting
set rtp+=$GOROOT/misc/vim
filetype plugin indent on

" YouCompleteMe global compilation flags file
let g:ycm_global_ycm_extra_conf = '~/bin/.ycm_extra_conf.py'

" Theme
syntax enable
colorscheme railscasts
