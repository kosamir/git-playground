```
set path+=.,/home/amirkos/git/pravila/dicu-be/**,/usr/lib/jvm/openjdk-8/src.zip
let g:ale_java_javac_executable = "javac -cp ~/.m2/repository/org/projectlombok/lombok/1.18.8/lombok-1.18.8.jar"
nnoremap <C-f>  :CocCommand editor.action.formatDocument <CR>
nnoremap <C-b>  :call CocActionAsync('runCommand', 'editor.action.organizeImport') <CR>

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

function! s:show_hover_doc()
call timer_start(2000, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
# scrolling hover window
nnoremap <silent><expr> <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<c-j>"
nnoremap <silent><expr> <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<c-k>"
# OR
nnoremap <silent><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<Down>"
nnoremap <silent><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<Up>"
# scroll autocomplete with j/k
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

```
