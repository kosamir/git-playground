

init.vimrc
<pre>
    source $HOME/.vim/init/plug.vimrc      " plugin loader
    source $HOME/.vim/init/general.vimrc   " general settings
    source $HOME/.vim/init/leader.vimrc    " leader key settings
    source $HOME/.vim/init/functions.vimrc " custom functions
    source $HOME/.vim/init/plugins.vimrc   " plugin specific settings
</pre>

`plug.vimrc`

<pre>
    call plug#begin()
    Plug 'scrooloose/nerdtree'
    Plug 'wikitopian/hardmode'  
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'    
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-obsession'
    " Plug 'sheerun/vim-polyglot'
    Plug 'dense-analysis/ale'
    Plug 'easymotion/vim-easymotion'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/0.x'
      \ }
    Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
    " Plug 'mattn/emmet-vim'
    " Plug 'mattn/vim-lsp-settings'
    " Plug 'chiel92/vim-autoformat'
    Plug 'puremourning/vimspector'
    " Plug 'prabirshrestha/async.vim'
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'mlaursen/vim-react-snippets',{'branch':'main'}
    Plug 'thaerkh/vim-workspace'
    Plug 'pseewald/vim-anyfold'
    
    call plug#end()
</pre>

`genereal.vimrc`

<pre>
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
    set notimeout ttimeout ttimeoutlen=200
    " Use <F11> to toggle between 'paste' and 'nopaste'
    set pastetoggle=<F11>
    set backspace=2
    set nobackup nowritebackup
    " set autowrite
    set noautowrite
    set textwidth=185
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
</pre>

`leader.vimrc`

<pre>
    let mapleader = " " " Leader is the space key
    
    au FileType xml setlocal foldmethod=syntax
    " AUTOCOMPLETITION
    " filetype plugin on
    filetype indent on
    syntax on
    
    runtime macros/matchit.vim
    
    nnoremap <Space> viw
    vnoremap <leader>y "+y
    vnoremap <leader>p "0p
    vnoremap <leader>x d"0p
    
    map <leader><leader> <Plug>(easymotion)<cr>
    " copy paste remaps
    " paste from 0 register
    vmap <leader>y "+y
    vmap <leader>d "+d
    nmap <leader>p "+p
    nmap <leader>P "+P
    vmap <leader>p "+p
    vmap <leader>P "+P
    " moving lines up or down M is ALT
    nnoremap <M-DOWN> :m .+1<CR>==
    nnoremap <M-Up> :m .-2<CR>==
    inoremap <M-Up> <Esc>:m .-2<CR>==gi
    inoremap <M-DOWN> <Esc>:m .+1<CR>==gi
    vnoremap <M-DOWN> :m '>+1<CR>gv=gv
    vnoremap <M-Up> :m '<-2<CR>gv=gv
    " search 
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
    " command -nargs=1 Pth echo expand('%:p')
    omap s :normal vs<CR>
    " vimgrep first next occurance
    nnoremap <leader>n :cnext<CR>
    nnoremap <leader>m :cprevious<CR>
    " H to move to the last character in a line
    noremap H ^
    " L to move to the first  character in a line
    noremap L g_
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
    " nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
    " vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
    "select all
    nnoremap <leader>a ggVG
    " delete all empty lines
    nnoremap xd :g/^\s*$/d<CR>
    "Useful because `d` overwrites the <quote> register
    
    " open files
    nnoremap đ :Files <CR>
    nnoremap š :GFiles <CR>
    nnoremap ž :NERDTree <CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>s :BLines<CR>
    " kill arrow keys
    noremap <silent> <Up>    <Nop>
    noremap <silent> <Down>  <Nop>
    noremap <silent> <Left>  <Nop>
    noremap <silent> <Right> <Nop>
    noremap <silent> <C-Left>  <Nop>
    noremap <silent> <C-Right> <Nop>
    " moving between windows
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal commentstring={/*\ %s\ */}
    " AMIRKOS utils
    " escape ) when writing functions
    inoremap aa <Esc>A
    inoremap qq <Esc>2la
    
    nmap <C-LEFT> :tabprevious<cr>
    nmap <C-RIGHT> :tabnext<cr>
    
    let g:mapleader = " "
    let g:vimspector_enable_mappings = 'HUMAN'
    let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'css': ['prettier'],
    \}
    let g:ale_lint_on_enter=0
    let g:ale_lint_on_text_changed='never'
    
    " Fix files automatically on save
    let g:ale_fix_on_save = 1
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'
    let g:ale_javascript_eslint_executable='npx eslint'
    
    let g:gruvbox_termcolors='256'
    
    colorscheme gruvbox
    " enable airline tabline
    let g:airline#extensions#tabline#enabled = 1           
    " remove 'X' at the end of the tabline                                            
    let g:airline#extensions#tabline#show_close_button = 0 
    " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
    let g:airline#extensions#tabline#tabs_label = ''       
    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
    let g:airline#extensions#tabline#buffers_label = ''    
    " disable file paths in the tab                                                    
    let g:airline#extensions#tabline#fnamemod = ':t'       
    " dont show tab numbers on the right                                                           
    let g:airline#extensions#tabline#show_tab_count = 0    
    " dont show buffers in the tabline                                                 
    let g:airline#extensions#tabline#show_buffers = 0      
    " minimum of 2 tabs needed to display the tabline                                  
    let g:airline#extensions#tabline#tab_min_count = 2     
    " disables the buffer name that displays on the right of the tabline               
    let g:airline#extensions#tabline#show_splits = 0       
    " disable tab numbers                                                              
    let g:airline#extensions#tabline#show_tab_nr = 0       
    " disables the weird ornage arrow on the tabline
    let g:airline#extensions#tabline#show_tab_type = 0     
    
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
    let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
    
    let g:airline#extensions#tabline#enabled = 1
    
    let g:coc_global_extensions=[
          \ 'coc-css',
          \ 'coc-pairs',
          \ 'coc-stylelintplus',
          \ 'coc-cssmodules',
          \ 'coc-docker',
          \ 'coc-eslint',
          \ 'coc-json',
          \ 'coc-html',
          \ 'coc-prettier',
          \ 'coc-snippets',
          \ 'coc-tsserver',
          \ 'coc-yaml',
          \ 'coc-vimlsp',
          \ 'coc-webview',
          \ 'coc-markdown-preview-enhanced',
          \ ]
    " source .vimr per project file
    let s:project_root = finddir('.git/..', expand('%:p:h').';')
    let s:local_vimrc = join([s:project_root, '.vimrc'], '/')
    let g:nerdtree_tabs_synchronize_view=0
    hi Folded term=NONE cterm=NONE
    
    if filereadable(s:local_vimrc)
        exec "source " . s:local_vimrc
    endif
</pre>

`functions.vimrc`

<pre>
    command -nargs=1 Sch noautocmd vimgrep /<args>/gj `git ls-files` | cw
</pre>

`plugins.vimrc`

<pre>
    let g:mapleader = " "
    let g:vimspector_enable_mappings = 'HUMAN'
    let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'css': ['prettier'],
    \}
    let g:ale_lint_on_enter=0
    let g:ale_lint_on_text_changed='never'
    
    " Fix files automatically on save
    let g:ale_fix_on_save = 1
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'
    let g:ale_javascript_eslint_executable='npx eslint'
    
    let g:gruvbox_termcolors='256'
    
    colorscheme gruvbox
    " enable airline tabline
    let g:airline#extensions#tabline#enabled = 1           
    " remove 'X' at the end of the tabline                                            
    let g:airline#extensions#tabline#show_close_button = 0 
    " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
    let g:airline#extensions#tabline#tabs_label = ''       
    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
    let g:airline#extensions#tabline#buffers_label = ''    
    " disable file paths in the tab                                                    
    let g:airline#extensions#tabline#fnamemod = ':t'       
    " dont show tab numbers on the right                                                           
    let g:airline#extensions#tabline#show_tab_count = 0    
    " dont show buffers in the tabline                                                 
    let g:airline#extensions#tabline#show_buffers = 0      
    " minimum of 2 tabs needed to display the tabline                                  
    let g:airline#extensions#tabline#tab_min_count = 2     
    " disables the buffer name that displays on the right of the tabline               
    let g:airline#extensions#tabline#show_splits = 0       
    " disable tab numbers                                                              
    let g:airline#extensions#tabline#show_tab_nr = 0       
    " disables the weird ornage arrow on the tabline
    let g:airline#extensions#tabline#show_tab_type = 0     
    
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
    let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
    
    let g:airline#extensions#tabline#enabled = 1
    
    let g:coc_global_extensions=[
          \ 'coc-css',
          \ 'coc-pairs',
          \ 'coc-stylelintplus',
          \ 'coc-cssmodules',
          \ 'coc-docker',
          \ 'coc-eslint',
          \ 'coc-json',
          \ 'coc-html',
          \ 'coc-prettier',
          \ 'coc-snippets',
          \ 'coc-tsserver',
          \ 'coc-yaml',
          \ 'coc-vimlsp',
          \ 'coc-webview',
          \ 'coc-markdown-preview-enhanced',
          \ ]
    " source .vimr per project file
    let s:project_root = finddir('.git/..', expand('%:p:h').';')
    let s:local_vimrc = join([s:project_root, '.vimrc'], '/')
    let g:nerdtree_tabs_synchronize_view=0
    hi Folded term=NONE cterm=NONE
    
    if filereadable(s:local_vimrc)
        exec "source " . s:local_vimrc
    endif
</pre>

