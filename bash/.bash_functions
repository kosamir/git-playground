# finds in current directory files with given name then
# greps text in founded files
gfind() {
  find . ! -path "./build" -name "$1" -type f 2>/dev/null|xargs grep -l "$2"
}
# find files in current directory
ffind() { 
    /usr/bin/find . -type f -name "*$1*" 2>/dev/null; 
}
# find directory in current directory
findd() { /usr/bin/find . -type d -name "$1" 2>/dev/null; }

# create .tar.gz 
targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }
# extra .tar.gz
untargz() { tar -zxvf $1; rm -r $1; }

# number of files in directory
numfiles() { 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}
