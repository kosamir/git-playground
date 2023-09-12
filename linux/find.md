# FIND

`find . -type f -name "*.log" | xargs rm -f`

### Simple `find|xargs` approach      
Find files named core in or below the directory /tmp and delete them.

                  $ find /tmp -name core -type f -print | xargs /bin/rm -f
Note that this will work incorrectly if there are any filenames containing newlines, single or double quotes, or spaces.

### Safer `find -print0 | xargs -0` approach
Find files named core in or below the directory /tmp and delete them, processing filenames in such a way that file or directory  names  containing single or double quotes, spaces or newlines are correctly handled.

                  $ find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f

The -name test comes before the -type test in order to avoid having to call stat(2) on every file.
Note that there is still a race between the time find traverses the hierarchy printing the matching filenames, and the time the process executed by xargs works with that file.

### Executing a command for each file
Run file on every file in or below the current directory.

                  $ find . -type f -exec file '{}' \;

Notice that the braces are enclosed in single quote marks to protect them from interpretation as shell script punctuation.  The semicolon is similarly protected by the use of a backslash, though single quotes could have been used in that case also.In many cases, one might prefer the `-exec ... +` or better the `-execdir ... +` syntax for performance and security reasons.

### Traversing the filesystem just once - for 2 different actions
Traverse the filesystem just once, listing set-user-ID files and directories into /root/suid.txt and large files into /root/big.txt.

                      $ find / \
                          \( -perm -4000 -fprintf /root/suid.txt '%#m %u %p\n' \) , \
                          \( -size +100M -fprintf /root/big.txt '%-10s %p\n' \)

This  example  uses  the line-continuation character '\' on the first two lines to instruct the shell to continue reading the command on the next line.

### Searching files by age
Search for files in your home directory which have been modified in the last twenty-four hours.

                     `$ find $HOME -mtime 0`

This command works this way because the time since each file was last modified is divided by 24 hours and any remainder is discarded.That means that to match -mtime 0, a file will have to have a modification in the past which is less than 24 hours ago.

### Searching files by permissions
Search for files which are executable but not readable.

                     `$ find /sbin /usr/sbin -executable \! -readable -print`

Search for files which have read and write permission for their owner, and group, but which other users can read but not write to.

                     `$ find . -perm 664`

Files which meet these criteria but have other permissions bits set (for example if someone can execute the file) will not be matched.

Search for files which have read and write permission for their owner and group, and which other users can read, without regard to the presence of any extra permission bits (for example the executable bit).

                     `$ find . -perm -664`

This will match a file which has mode 0777, for example.

Search for files which are writable by somebody (their owner, or their group, or anybody else).
                     `$ find . -perm /222`

Search for files which are writable by either their owner or their group.

                      $ find . -perm /220
                      $ find . -perm /u+w,g+w
                      $ find . -perm /u=w,g=w

All three of these commands do the same thing, but the first one uses the octal representation of the file mode, and the other two  use  the symbolic form.  The files don't have to be writable by both the owner and group to be matched; either will do.

Search for files which are writable by both their owner and their group.

                      $ find . -perm -220
                      $ find . -perm -g+w,u+w

Both these commands do the same thing.

A more elaborate search on permissions.

                      $ find . -perm -444 -perm /222 \! -perm /111
                      $ find . -perm -a+r -perm /a+w \! -perm /a+x

These  two commands both search for files that are readable for everybody (-perm -444 or -perm -a+r), have at least one write bit set (-perm/222 or -perm /a+w) but are not executable for anybody (! -perm /111 or ! -perm /a+x respectively).

### Pruning - omitting files and subdirectories
Copy the contents of /source-dir to /dest-dir, but omit files and directories named .snapshot (and anything in them).  It also  omits  files or directories whose name ends in '~', but not their contents.

                      $ cd /source-dir
                      $ find . -name .snapshot -prune -o \( \! -name '*~' -print0 \) \
                          | cpio -pmd0 /dest-dir

The  construct  -prune -o \( ... -print0 \) is quite common.  The idea here is that the expression before -prune matches things which are to be pruned.  However, the -prune action itself returns true, so the following -o ensures that the right hand side is evaluated only for those directories  which  didn't  get pruned (the contents of the pruned directories are not even visited, so their contents are irrelevant).  The expression on the right hand side of the -o is in parentheses only for clarity.  It emphasises that the -print0 action takes place only  for things  that  didn't have -prune applied to them.  Because the default `and` condition between tests binds more tightly than -o, this is the default anyway, but the parentheses help to show what is going on.

Given the following directory of projects and their associated SCM administrative directories, perform an efficient search for the projects'              roots:

                      $ find repo/ \
                          \( -exec test -d '{}/.svn' \; \
                          -or -exec test -d '{}/.git' \; \
                          -or -exec test -d '{}/CVS' \; \
                          \) -print -prune

              Sample output:

                      repo/project1/CVS
                      repo/gnu/project2/.svn
                      repo/gnu/project3/.svn
                      repo/gnu/project3/src/.svn
                      repo/project4/.git

In  this  example,  -prune  prevents  unnecessary  descent  into directories that have already been discovered (for example we do not search project3/src because we already found project3/.svn), but ensures sibling directories (project2 and project3) are found.

### Other useful examples
Search for several file types.

                        `$ find /tmp -type f,d,l`

Search for files, directories, and symbolic links in the directory /tmp passing these types as a comma-separated list (GNU extension), which is otherwise equivalent to the longer, yet more portable:

                        `$ find /tmp \( -type f -o -type d -o -type l \)`

Search for files with the particular name needle and stop immediately when we find the first one.

                        `$ find / -name needle -print -quit`

Demonstrate the interpretation of the %f and %h format directives of the -printf action for some corner-cases.  Here is an example including some output.

                  $ find . .. / /tmp /tmp/TRACE compile compile/64/tests/find -maxdepth 0 -printf '[%h][%f]\n'
                  [.][.]
                  [.][..]
                  [][/]
                  [][tmp]
                  [/tmp][TRACE]
                  [.][compile]
                  [compile/64/tests][find]

### EXIT STATUS
`find` exits with status <b>0</b> if all files are processed successfully, <b>greater</b> than 0 if errors occur.  
This is deliberately a very  broad  description, but if the return value is non-zero, you should not rely on the correctness of the results of find.

When  some  error  occurs, find may stop immediately, without completing all the actions specified.  For example, some starting points may not have been examined or some pending program invocations for -exec ... {} + or -execdir ... {} + may not have been performed.

