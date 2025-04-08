# XARGS     
[ https://www.everythingcli.org/find-exec-vs-find-xargs/ ]( https://www.everythingcli.org/find-exec-vs-find-xargs/ )

`xargs [OPTIONS] [COMMAND [initial-arguments]]`  

The default param separator is blank space  
- setting custom delimiter  
`echo  "file1;file2;file3" | xargs -d \; -t touch`  

passing num of arguments to xargs 4 arguments  
`echo "1 2 3 4 5 6 7 8 9" | xargs -n4`  

creating multiple directories  
`echo "dir1 dir2 dir3" | xargs mkdir`  

creating multiple directories and setting permisions  
`echo "dir1 dir2 dir3" | xargs -I % -sh -c  mkdir %; chmod 600 %`  


changing file permisions  
<pre>
    touch file{1..10}.pdf
    ll
    find *.pdf | xargs chmod 600
    ll
</pre>

finding errors in log  
`find /var/log -type f -name "*.log" | xargs grep "error"`  
find with xargs is lot faster than exec  
<pre>
    # find -exec \;
    find . -name \*.php -type f -exec grep -Hn '$test' {} \;
    
    # find -exec \+
    find . -name \*.php -type f -exec grep -Hn '$test' {} \+
    
    # find | xargs -n1
    find . -name \*.php -type f -print0 | xargs -0 -n1 grep -Hn '$test'
    
    # find | xargs
    find . -name \*.php -type f -print0 | xargs -0 grep -Hn '$test'
</pre>
