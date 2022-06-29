```
let g:ale_hover_to_floating_preview=1  
let g:ale_floating_preview=1  
let g:ale_set_balloons=1  
augroup ReactFiletypes  
autocmd!  
autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact  
autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact  
augroup END  
nnoremap <C-g> :ALEHover<CR>  
" let g:ale_fixers = {  
" \   'javascript': ['eslint'],  
" \   'css': ['eslint'],  
" \}  
let g:ale_lint_on_enter=0  
let g:ale_lint_on_text_changed='never'  
" Fix files automatically on save  
let g:ale_fix_on_save = 1  
let g:ale_sign_error = '❌'  
let g:ale_sign_warning = '⚠️'  
let g:ale_javascript_eslint_executable='npx eslint'  
set path=.,src  
set suffixesadd=.js,.jsx  
" load code from nodeModules  
function! LoadMainNodeModule(fname)  
let nodeModules = "./node_modules/"  
let packageJsonPath = nodeModules . a:fname . "/package.json"  
  
if filereadable(packageJsonPath)  
return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main  
else  
return nodeModules . a:fname  
endif  
endfunction  
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
set includeexpr=LoadMainNodeModule(v:fname)  
```
