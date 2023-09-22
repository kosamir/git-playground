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
