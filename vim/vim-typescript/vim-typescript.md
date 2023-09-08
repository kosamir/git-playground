- primjer `$HOME/.vim/languages/typescript.vimrc` 


<pre>
    augroup ReactFiletypes 
      autocmd! 
      autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
      autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
    augroup END
    let g:ale_hover_to_floating_preview=1
    let g:ale_floating_preview=1
    let g:ale_set_balloons=1
    let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'css': ['eslint'],
    \}
    let g:ale_lint_on_enter=0
    let g:ale_lint_on_text_changed='never'
    " Fix files automatically on save
    " let g:ale_fix_on_save = 1
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'
    " let g:ale_javascript_eslint_executable='npx eslint'
    
    set path=.,src
    set suffixesadd=.js,.jsx,.tsx
    
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    inoremap <expr> j ((coc#pum#visible())?(coc#pum#next(0)):("j"))
    inoremap <expr> k ((coc#pum#visible())?(coc#pum#prev(0)):("k"))
    inoremap <expr> <CR> ((coc#pum#visible())?(coc#pum#confirm()):("<CR>"))
    inoremap <expr> <Esc> ((coc#pum#visible())?(coc#pum#cancel()):("<Esc>"))
    
    syntax on                 " required
    autocmd Filetype typescript AnyFoldActivate               " activate for all filetypes
    set foldlevel=0  " close all folds
    nnoremap <C-g> :ALEHover<CR>
    nnoremap <C-f> :Prettier <CR>
    nnoremap <C-b> :CocCommand tsserver.organizeImports<CR>
</pre>
-------------------------------------------------------------------------------------------------------
- primjer `.vimrc` datoteke po projektu

    <pre>
        source $HOME/.vim/languages/typescript.vimrc
    
        set path+=/home/amirkos/git/pravila/dicu-client/**
        function! LoadMainNodeModule(fname)
            let nodeModules = "./node_modules/"
            let packageJsonPath = nodeModules . a:fname . "/package.json"
        
            if filereadable(packageJsonPath)
                return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
            else
                return nodeModules . a:fname
            endif
        endfunction
        
        set includeexpr=LoadMainNodeModule(v:fname)
    </pre>
