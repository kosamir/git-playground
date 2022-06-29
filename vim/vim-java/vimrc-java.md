```
set path+=/home/amirkos/git/pravila/rizik-servisi/**
let g:ale_java_javac_executable = "javac -cp ~/.m2/repository/org/projectlombok/lombok/1.18.8/lombok-1.18.8.jar"
nnoremap <C-f>  :CocCommand editor.action.formatDocument <CR>
nnoremap <C-b>  :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <C-g>  :call CocAction('doHover')<CR>
filetype plugin indent on " required
syntax on                 " required
autocmd Filetype * AnyFoldActivate               " activate for all filetypes
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

function! s:show_hover_doc()
call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
```
