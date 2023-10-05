" searches inside current git repository
command -nargs=1 Sch noautocmd vimgrep /<args>/gj `git ls-files` | cw
" searches inside current git repository word boundary
command -nargs=1 Scw noautocmd vimgrep /\<<args>\>/gj `git ls-files` | cw
" comment inside jsx files
command -nargs=0 Jx setlocal commentstring={/*\ %s\ */}
" comment plain js files
command -nargs=0 Js setlocal commentstring=//\ %s
" comment html files
command -nargs=0 Htmc setlocal commentstring=<!--\ %s\ -->

" redirect marks/registers/buffers to new vim tab
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
