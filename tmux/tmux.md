### List sessions
`tmux ls`
### Startin new session 
- `tmux new`
- `tmux new -s [session_name]`

### Rename session
`tmux rename-session -t 0 database`

### Usefull commands
- `<C-a> |` - vertical split screen
- `<C-a> |` - vertical split screen
- `<C-a> |` - vertical split screen
- `<C-a> -` - horizontal split screen
- `<C-a> left/right/up/down` - navigating panes
- `<C-d>` - closing panes
- `<C-a> c` - open new window
- `<C-a> p/n` - previous/next window
- `<C-a> [window number]`- where <window-number> is the number in front of the window’s name in your status bar.
- `<C-b> d` - detach your current session use C-b d. You can also use C-b D to have tmux give you a choice which of your sessions you want to detach
- `<C-b> D` - You can also use C-b D to have tmux give you a choice which of your sessions you want to detach
- `C-b z`: make a pane go full screen. Hit C-b z again to shrink it back to its previous size
- `C-b C-<arrow key>`: Resize pane in direction of <arrow key>4
- `C-b ,`: Rename the current window

### Restore sessions
- `tmux`
- `Ctrl+a Ctrl+s` - save tmux session
- `Ctrl+a Ctrl+r` - restore last saved session
- `Ctrl+a s` - list all saved sessions
