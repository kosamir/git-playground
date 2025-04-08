# grep  
- find text in files in current dir  
`grep 'text_to_search' .`  
- find text in all files and directories in current dir  
`grep -r 'text_to_search' .`  
  
- find text in all files and directories in current dir using regular expression  
`grep -E -r '*.xlsx' .`  
- find all files that ends with xlsx.   
`grep -l -E -r '*.xlsx`  
  
# piping  
- filter files in current folder that ends with .md  
`ll | grep -l -E -r '*.md'`  
  
- create arhchive of all files that ends with .md  
`find . -name '*.md' | tar -T - -czvf test.tar.gz`  
- list contents of crated archive  
`tar --list -f test.tar.gz`  


