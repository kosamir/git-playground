#FD

find markdown files on _docs folder 

`fd -e md /_docs` 


find file with kubernetes prefix on ~/Documents  

`fd '^kubernetes*' ~/Documents`  

###Using fd with xargs  

Count lines number of markdown files on current directory. 

`fd -e md -d 1 | xargs wc -l`

###EXAMPLES

find all hidden files wich starts with `.vim*.tmp` and ends with `.tmp` in current directory  


`fd -H -g '.vim*.tmp' .`

