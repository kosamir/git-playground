# VIM     
### VIM COMMENTARY  
`gcc` - comment out a line    
`gc` - in visual mode comments out selection    
<!-- ovo je jos jedan komentar -->
### VIM SCROLLING
  `zz` Scroll the current line to the center of the window      
  `zt` Scroll the current line to the top of the window      
  `zb` Scroll the current line to the bottom of the window      
  `Ctrl + e` Scroll down without moving cursor
  `Ctrl + y` Scroll up without moving cursor
### VIM GIT 
[FUGITIVE](https://dzx.fr/blog/introduction-to-vim-fugitive/)
### VIM SURROUND    
- Edition magic      
  `ysiw'` - surronund current word with '      
  `ysiW'` - surronund current WORD with '      
  `ci"` - change inside "      
  `cit` - change `neki tekst` u `<div>neki tekst</div>`      
  `ci<` - change inside html tag between `<>` <div style="pointer-events:none">      
  `yi"` - yank inside "    
  `vi"` Select everything inside ". It also works with parenthesis, brackets, tags…      
  `di"` Delete everything inside ". Same as before.      
  `da"` Delete everything inside ", including the surrounding "      
  `CTRL+v` Start visual mode, selecting columns      
   =<next position> Indent      
  `cs"'` Change the surrounding double quotes by simple quotes (surround.vim is required)      
  `/\csearchString` Perform a case insensitive search      
  `/\CsearchString` Perform a case sensitive search      
    
### power of g    
`:[range]g/pattern/cmd`      
- This acts on the specified [range] (default whole file),       
  by executing the Ex command cmd for each line matching pattern       
  (an Ex command is one starting with a colon such as :d for delete).      
  Before executing cmd, "." is set to the current line.      
`:g/pattern/d`- deletes all empty lines      
`:g/pattern/t$`- copy matches to end of the file      
`:g/pattern/m$`- move matches to end of the file      
`qaq:g/pattern/y A`- copy all matchng lines into register A      
`:g/^pattern/s/$/mytext`- add 'mytext' to the end of line that contains pattern text      
`:g/^/m0`- reverse text file      
`:g/pattern/d _` - fast delete all lines matching pattern      
`:2,8co15`  - copy lines 2 through 8 after line 15      
`:4,15t$`   - copy lines 4 through 15 to end of document (t == co)      
`:m0`       - move current line to line 0 (i.e. the top of the document)      
`:.,+3m$-1` - current line through current+3 are moved to the lastLine-1 (i.e. next to last)      
`:g/pattern/normal @q`- Run a macro on matching lines (example assuming a macro recorded as 'q'):      
### Quickfix list  
`:copen` - Open the quickfix list window.
`:ccl` or :cclose - Close the quickfix list window.
`:cnext` or :cn - Go to the next item on the list.
`:cprev` or :cp - Go to the previous item on the list.
`:cfirst` - Go to the first item on the list.
`:clast` - Go to the last item on the list.
`:cc <n>` - Go to the nth item.
### Location List  
`:lopen` - Open the location list window.
`:lcl` or :lclose - Close the location list window.
`:lnext` - Go to the next item on the list.
`:lprev` - Go to the previous item on the list.
`:lfirst` - Go to the first item on the list.
`:llast` - Go to the last item on the list.
`:ll <n>` - Go to the nth item.
### Macro  
`:5,10norm! @a` - Execute the macro stored in register a on lines 5 through 10.  
`:5,$norm! @a` - Execute the macro stored in register a on lines 5 through 10.  
`:%norm! @a` - Execute the macro stored in register a on all lines.  
`:g/pattern/norm! @a` - Execute the macro store in register a on all lines matching pattern.  
`:%norm! @a` - Execute the macro stored in register a on all lines.  
`:g/pattern/norm! @a` - Execute the macro store in register a on all lines matching pattern.  
  
### Tabs    
`gT` Go to the previous tab      
`gt` Go to the next tab      
`:tabfind <TAB>` Find a file with autocompletion and open it in a new tab      
    
### Splitting    
`vsplit` Split vertically      
`split` Split horizontally      
    
### Folds    
`zf'k` fold lines until the k mark      
`zo` open the folded code      
`zc` close the folded code      
`za` toggle the folded code      
    
### Jump to definition  
`gd`- will take you to the local declaration.  
`gD`- will take you to the global declaration.  
`g*`- search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').  
`g#`- same as g* but in backward direction.  
`gg`- goes to the first line in the buffer (or provide a count before the command for a specific line).  
`G` - goes to the last line (or provide a count before the command for a specific line).  
`gf`- will go to the file under the cursor  
`g]`- and other commands will jump to a tag definition (a tag can be a function or variable name, or more).  
  
### CTAGS  
`ctags --languages=java -R ./src` - generate tags file in src folder  
  
### Marks    
```    
'a - 'z		lowercase marks, valid within one file      
'A - 'Z		uppercase marks, also called file marks, valid between files      
'0 - '9		numbered marks, set from .viminfo file      
```    
    
`    
Lowercase marks 'a to 'z are remembered as long as the file remains in the      
buffer list.  If you remove the file from the buffer list, all its marks are      
lost.  If you delete a line that contains a mark, that mark is erased.      
`    
    
`    
Lowercase marks can be used in combination with operators.  For example: "d't"      
deletes the lines from the cursor position to mark 't'.  Hint: Use mark 't' for      
Top, 'b' for Bottom, etc..  Lowercase marks are restored when using undo and      
redo.    
`    
    
`    
Uppercase marks 'A to 'Z include the file name.  You can use them to jump from    
file to file.  You can only use an uppercase mark with an operator if the mark    
is in the current file.  The line number of the mark remains correct, even if    
you insert/delete lines or edit another file for a moment.  When the 'viminfo'    
option is not empty, uppercase marks are kept in the .viminfo file.  See    
|viminfo-file-marks|.    
`    
    
`  
Numbered marks '0 to '9 are quite different.  They can not be set directly.    
They are only present when using a viminfo file |viminfo-file|.  Basically '0    
is the location of the cursor when you last exited Vim, '1 the last but one    
time, etc.  Use the "r" flag in 'viminfo' to specify files for which no    
Numbered mark should be stored.  See |viminfo-file-marks|.    
`  
  
`mk` -  mark the current position as k (any other lowercase letter will do)    
`mK` -  mark the current position as K. Uppercase means that it is a global mark, and it will be available even if you currently have a different file opened.    
`'k` -  jump to the position previously marked as k    
`delmarks A-Z0-9` - delete all marks    

  
### Working with files  
`:Files` - open fzf in current dir and search bellow  
  - `Crtl + t` - opens file in new tab
  - `Ctrl + v` - opens file in new vertical split
  - `Ctrl + x` - opens file in new horizontal split  

`:GFiles` - open Gfiles in current dir and search below  
  - `Crtl + t` - opens file in new tab
  - `Ctrl + v` - opens file in new vertical split
  - `Ctrl + x` - opens file in new horizontal split  

`chdir [full/path/to/wanted/dir]` - changes the search path for fzf or Gfiles  
    
### copy paste remaps    
`vmap <leader>y "+y`    
`vmap <leader>d "+d`    
`nmap <leader>p "+p`    
`nmap <leader>P "+P`    
`vmap <leader>p "+p`    
`vmap <leader>P "+P`    
    
### VIM FZF  
`Ctrl+o [file_name] Ctrl+t` - open file in new tab  
  
### FOLDING HTML 
`.vim/after/ftplugin/html.vim`

```
setlocal foldmethod=syntax
```

`.vim/after/syntax/html/html.vim`

```
syntax region htmlFold
start="<\z(p\|h\d\|i\?frame\|table\|colgroup\|thead\|tfoot\|tbody\|t[dhr]\|pre\|[diou]l\|li\|span\|div\|head\|script\|style\|blockquote\|form\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)"
end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d
```
