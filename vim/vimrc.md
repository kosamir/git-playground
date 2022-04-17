`
" set search path per project requires .vimrc file in project_root 
let s:project_root = finddir('.git/..', expand('%:p:h').';')
let s:local_vimrc = join([s:project_root, '.vimrc'], '/')

if filereadable(s:local_vimrc)
exec "source " . s:local_vimrc
endif

"remaping Alt key becaouse of gnome terminal
let c='a'
while c <= 'z'
exec "set <A-".c.">=\e".c
exec "imap \e".c." <A-".c.">"
let c = nr2char(1+char2nr(c))
endw
""end remap
set timeout ttimeoutlen=30
" moving lines up or down M is ALT
nnoremap <M-DOWN> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==
inoremap <M-DOWN> <Esc>:m .+1<CR>==gi
inoremap <M-Up> <Esc>:m .-2<CR>==gi
vnoremap <M-DOWN> :m '>+1<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv
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
set hlsearch incsearch
" folds html tags
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" AUTOCOMPLETITION
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"KEY omnifuncMAPPINGS
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal commentstring={/*\ %s\ */}
" mapping for emmet  
" let g:user_emmet_leader_key=','
let mapleader = " " " Leader is the space key
let g:mapleader = " "
runtime macros/matchit.vim
nnoremap <Space> viw
vnoremap <leader>y "+y
vnoremap <leader>p "0p
"color scheme
map <leader><leader> <Plug>(easymotion)<cr>
set background=dark
" copy paste remaps
" paste from 0 register
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

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" easier write
nmap <leader>w :w!<cr>
" easier quit
nmap <leader>q :q<cr>
" silence search highlighting
nnoremap <leader>hh :nohlsearch<Bar>:echo<CR>
"This unsets the "last search pattern" register by hitting return
"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
"select all
nnoremap <leader>a ggVG
" delete all empty lines
nnoremap xd :g/^\s*$/d<CR>
"Useful because `d` overwrites the <quote> register

" open files
nnoremap đ :Files <CR>
nnoremap š :GFiles <CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :BLines<CR>
" kill arrow keys
noremap <silent> <Up>    <Nop>
noremap <silent> <Down>  <Nop>
noremap <silent> <Left>  <Nop>
noremap <silent> <Right> <Nop>
" moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


nmap <M-LEFT> :tabprevious<cr>
nmap <M-RIGHT> :tabnext<cr>
" java files gf
:set includeexpr=substitute(v:fname,'\\.','/','g')
"nmap <F12> :e#<CR>
set scrolloff=3 " keep three lines between the cursor and the edge of the screen


let g:vimspector_enable_mappings = 'HUMAN'
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
" functions
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
" PLUGINS
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
Plug 'puremourning/vimspector'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:gruvbox_termcolors='256'
colorscheme gruvbox
" vs code bullshit
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
" vs code END bullshit
" Find out current buffer's size and output it.
"
" set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:lsp_settings = {
\ 'eclipse-jdt-ls': {
\     'initialization_options': {
\         'bundles': [
\             '/home/amirkos/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.36.0/com.microsoft.java.debug.plugin-0.36.0.jar'
\         ]
\     }
\ }
\ }
`
