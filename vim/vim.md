### VIM TODO

### power of g


### copy paste


### My .vimrc
```
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
set nohlsearch
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
set notimeout ttimeout ttimeoutlen=200
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
set backspace=2
set nobackup
set autowrite
set textwidth=100
set colorcolumn=+1

" AUTOCOMPLETITION
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"KEY omnifuncMAPPINGS
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'wikitopian/hardmode'  
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'    
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'chiel92/vim-autoformat'
call plug#end()
inoremap <expr> j ( pumvisible() )?( "\<C-n>" ):("j")
inoremap <expr> k ( pumvisible() )?( "\<C-p>" ):("k")

autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal commentstring={/*\ %s\ */}
" mapping for emmet  
" let g:user_emmet_leader_key=','
runtime macros/matchit.vim
nnoremap <Space> viw
let mapleader = " " " Leader is the space key
let g:mapleader = " "
vnoremap <leader>y "+y
vnoremap <leader>p "0p
"color scheme
map <leader><leader> <Plug>(easymotion)<cr>
set background=dark
let g:gruvbox_termcolors='256'
colorscheme gruvbox
" copy paste remaps
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" search 
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" first, enable status 1 line always
set laststatus=2
hi NormalColor guifg=Black guibg=Green ctermbg=Green ctermfg=0
hi InsertColor guifg=Black guibg=Red ctermbg=Red ctermfg=0
hi ReplaceColor guifg=Black guibg=White ctermbg=White ctermfg=0
hi VisualColor guifg=Black guibg=Blue ctermbg=Blue ctermfg=0
hi VisuallineColor guifg=Black guibg=Blue ctermbg=Blue ctermfg=0
set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisuallineColor#%{(mode()=='V')?'\ \ VISUAL\ LINE\ ':''}
set statusline+=%8*\ [%n]                                " buffernr
" Find out current buffer's size and output it.
"
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction
"function! GitInfo()
"
"  let git = fugitive#head()
"  if git != ''
"    return ' '.fugitive#head()
"  else
"    return ''
"endfunction
"set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" easier write
nmap <leader>w :w!<cr>
" easier quit
nmap <leader>q :q<cr>
" silence search highlighting
nnoremap <leader>hh :nohlsearch<Bar>:echo<CR>
"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
"select all
nnoremap <leader>a ggVG

nnoremap xd :g/^\s*$/d<CR>
"paste from 0 register
"Useful because `d` overwrites the <quote> register
nnoremap <silent> <Plug>blankUp   :<A-q>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> <Plug>blankDown :<A-a>call <SID>BlankDown(v:count1)<CR>
"let mapleader = " "
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
"copy to outside buffer
nmap <M-LEFT> :bN<cr>
nmap <M-RIGHT> :bn<cr>

nmap <F12> :e#<CR>
"scrolling on insert
inoremap <C-Y> <C-X><C-E> 
inoremap <C-E> <C-X><C-Y>
set scrolloff=3 " keep three lines between the cursor and the edge of the screen

function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
    ']+1
  silent! call repeat#set("\<Plug>blankUp", a:count)
endfunction

function! s:BlankDown(count) abort
    put =repeat(nr2char(10), a:count)
      '[-1

    silent! call repeat#set("\<Plug>blankDown", a:count)
endfunction

function! s:MoveBlockDown() range
      execute a:firstline "," a:lastline "move '>+1"
        normal! gv=gv
    endfunction

function! s:MoveBlockUp() range
      execute a:firstline "," a:lastline "move '<-2"
        normal! gv=gv
endfunction

"remaping Alt key becaouse of gnome terminal
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=30
"end remap

"nnoremap <silent> <A-j> :m .+1<CR>==
"nnoremap <silent> <A-k> :m .-2<CR>==
"inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
"inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :call <SID>MoveBlockDown()<CR>
vnoremap <silent> <A-k> :call <SID>MoveBlockUp()<CR>

" open files
nnoremap <C-p> :GFiles <CR>
nnoremap <C-o> :Files <CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :BLines<CR>

noremap <silent> <Up>    <Nop>
noremap <silent> <Down>  <Nop>
noremap <silent> <Left>  <Nop>
noremap <silent> <Right> <Nop>
" moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"nmap <leader>gd<Plug>(coc-definition)
"nmap <leader>gr<Plug>(coc-references)
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='never'
"let g:ale_fixers['javascript'] = ['eslint']
" Fix files automatically on save
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_javascript_eslint_executable='npx eslint'

```
