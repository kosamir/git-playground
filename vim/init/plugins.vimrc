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
