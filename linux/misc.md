# piping
- filter files in current folder that ends with .md  
`ll | grep -l -E -r '*.md'`  
- create arhchive of all files that ends with .md  
`find . -name '*.md' | tar -T - -czvf test.tar.gz`  
- list contents of crated archive  
`tar --list -f test.tar.gz`  

- move all tar.gz files from current dir to /home/amirkos/  
`mv $(ls | grep -E '*.tar.gz') /home/amirkos/`  

- delete all log files from current dir  
`find . -type f -name "*.log" | xargs rm -f`  

- find all java files and grep those files on text containing 'int a'  
`find . -name '*.java' -exec grep 'int a' '{}' \;`  
