## TIPS 
- ukoliko se radi o multimodule MAVEN projektu 
`
    .vimrc 
`
**MORA** biti prisutan u **SVAKOM** modulu/folderu (koji ima .classpath,.factorypath datoteke)  da bi `coc-java` i svi 
vim plugini funkcionirali

- u folderu `.vim/languages` file `java.vimrc` i onda ga se source iz projekta 
- primjer `.vimrc` u java  projektu

 
    source $HOME/.vim/languages/java.vimrc
    set path+=.,/home/amirkos/git/pravila/dicu-be/**,/usr/lib/jvm/openjdk-8/src.zip
    let g:ale_java_javac_executable = "javac -cp ~/.m2/repository/org/projectlombok/lombok/1.18.8/lombok-1.18.8.jar"

## lombok da bi radio treba ovo dodat u coc-settings.json
- vazno ovo je mjesto gdje se definiraju stvari sve.. i onda jdtls ili neki drugi lang server to poKupi od tuda  

`.vim/coc-settings.json`
    {
        "java.jdt.ls.vmargs": "-javaagent:/usr/local/share/lombok/lombok-1.18.6.jar -Xbootclasspath/a:/usr/local/share/lombok/lombok-1.18.6.jar"
    }

- primjer `$HOME/.vim/languages/java.vimrc`

    nnoremap <C-f>  :CocCommand editor.action.formatDocument <CR>
    nnoremap <C-b>  :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
    
    syntax on                 " required
    autocmd Filetype java AnyFoldActivate               " activate for all filetypes
    set foldlevel=0  " close all folds
    
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
    endif
    endfunction
    
    " show hover automaticaly after 4 seconds has passed
    function! s:show_hover_doc()
    call timer_start(4000, 'ShowDocIfNoDiagnostic')
    endfunction
    
    autocmd CursorHoldI * :call <SID>show_hover_doc()
    autocmd CursorHold * :call <SID>show_hover_doc()
    
    nnoremap <silent><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<Down>"
    nnoremap <silent><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<Up>"
    
    
    inoremap <expr> j ((coc#pum#visible())?(coc#pum#next(0)):("j"))
    inoremap <expr> k ((coc#pum#visible())?(coc#pum#prev(0)):("k"))
    inoremap <expr> <CR> ((coc#pum#visible())?(coc#pum#confirm()):("<CR>"))
    inoremap <expr> <Esc> ((coc#pum#visible())?(coc#pum#cancel()):("<Esc>"))

