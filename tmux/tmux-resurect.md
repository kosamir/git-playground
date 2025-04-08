# Restoring vim and neovim sessions

- save vim/neovim sessions. I recommend
  [tpope/vim-obsession](https://github.com/tpope/vim-obsession) (as almost every
  plugin, it works for both vim and neovim).
- in `.tmux.conf`:

        # for vim
        set -g @resurrect-strategy-vim 'session'
        # for neovim
        set -g @resurrect-strategy-nvim 'session'

`tmux-resurrect` will now restore vim and neovim sessions if `Session.vim` file
is present.  

### Restore sessions  
- `tmux`
- `Ctrl+a Ctrl+s` - save tmux session
- `Ctrl+a Ctrl+r` - restore last saved session
- `Ctrl+a s` - list all saved sessions

### Session manipulation
- `:` enter command mode inside tmux
- `ls` - list tmux sessions
- `Ctrl+A + $` - rename current session
- `:new-session -s session_name` - create new session 

### tmux config

`~/.tmux.conf`

### send the prefix

Default prefix: `^b`
Default prefix: `^a`

### Getting help

* Read the man page: `man tmux`
* List all key bindings: `tmux list-keys | less`

### Sessions

* List running sessions: `tmux list-sessions`
* New named session: `tmux new -s NAME`
* Switch sessions: `tmux switch -t NAME`
* Attach to a session: `tmux attach -t NAME`
* Detach current session: `^b d`
* Rename current session: `^b $`
* Saving sessions and restoring sessions a reboot:<br> 

I don't think this is a standard tmux feature. Here are some projects to check out that provide this functionality: [tmuxinator](https://github.com/tmuxinator/tmuxinator), [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect), or [plain old bash scripts](http://pogidude.com/2014/bash-script-to-restore-tmux-session-after-reboot/)

### Windows

* Create a new window: `^b c`
* List windows: `^b w`
* Rename a window: `^b ,`
* Close a window: `^b &`

### Panes
* Split pane vertical (opens new pane to the right): `^b %`
* Split pane horizontal (opens new pane below): `^b "`
* Switch between panes: `^b up|down|left|right` - up, down, left, right are the arrow keys
* Swap panes: `^b {` or `^b }`
* Resize pane: `^b :resize-pane -U|D|L|R NUM` - Up, Down, Left, Right, NUM cells
* Kill pane: `^b x`

### Scrolling in panes
* Enter scroll mode: `^b [`
* Quit scroll mode: `q`
* Scroll in scroll mode: `j` (down), `k` (up), or page up/down

### copy/paste
* Enter copy mode: `^b [`
* Begin selection: `space`
* End selection (and copy text): `enter`
* Paste test: `^b ]`
> If you're using the vim binary provided by MacVim.app then you'll need to set `@resurrect-processes`, for example:
> ```
> set -g @resurrect-processes '~Vim -> vim'
> ```
