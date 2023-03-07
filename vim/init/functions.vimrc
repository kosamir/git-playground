command -nargs=1 Sch noautocmd vimgrep /<args>/gj `git ls-files` | cw
