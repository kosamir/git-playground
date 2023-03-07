" Remaping Alt key becaouse of gnome terminal
" set search path per project requires .vimrc file in project_root 
" set nocompatible
" set t_RV=

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
"u
"end remap
set ttimeout
set ttimeoutlen=100
set timeoutlen=500
set esckeys
set fileformat=unix
" Enable syntax highlithing
syntax on
" better command line completition
set wildmenu
":set bg=dark
" Display line numbers on the left
set number
" show line numbers
set incsearch
set relativenumber
set nowrap
set showcmd
"Indentation settings for using 4 spaces instead of tabs.
"Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4

set expandtab
" Always display the status line, even if only one window is displayed
set laststatus=2
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Use visual bell instead of beeping when doing something wrong
set visualbell
" Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
set backspace=2
set nobackup
set autowrite
set textwidth=100
set wrap linebreak
set colorcolumn=+1
set hlsearch incsearch
" folds html tags
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set background=dark
" java files gf
:set includeexpr=substitute(v:fname,'\\.','/','g')
"nmap <F12> :e#<CR>
set scrolloff=3 " keep three lines between the cursor and the edge of the screen
" first, enable status 1 line always
set laststatus=2

set exrc
set secure
set termguicolors

" do not save empty windows i.e. NERDTree
set sessionoptions-=blank
