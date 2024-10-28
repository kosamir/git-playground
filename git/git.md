# BRANCHING

### CREATE A NEW BRANCH:  
`git checkout -b feature_branch_name`  

- Edit, add and commit your files.  
- Push your branch to the remote repository:  

`git push -u origin origin/feature_branch_name`  

### RENAME BRANCH
`git branch -m old-branch_name new-branch_name`

#### DELETE BRANCH
`git branch -d branch_name`  
`git branch -D branch_name`  

- The -d option stands for --delete, which would delete the local branch, only if you have already pushed and merged it with your remote branches.  
- The -D option stands for --delete --force, which deletes the branch regardless of its push and merge status, so be careful using this one!  
  
#### DELETE BRANCH ON REMOTE  
`git push <remote_name> --delete <branch_name>`  
`git reset --hard` - deletes all local changes and resets all  

# TAG
`git tag -a <TAG_NAME>`  
`git push origin <TAG_NAME>`  


# STASHING  

### STASH  
`git stash -u` - stash with included untracked changes  
`git stash -a` - stash untracked and ignored  
`git stash push -a -m "named_stash"` - stash all with name `named_stash`  


### STASH APPLY  
`git stash apply` - retrieve changes from the stash and apply them to your branch  
`git stash apply stash@{2}` - apply 2nd change from git stash  
`git stash apply stash^{/named_stash}` - apply named stash  

### STASH DROP  
`git stash drop <name>`  - drop name stash

### STASH LIST  
`git statsh list` - list stash

### STASH CLEAR  
`git stash clear` - clear all stash  
  
# MERGE  
`git checkout master`  
`git checkout -b new-branch`  
  
...develop some code...  
  
`git add .`  
`git commit –m "Some commit message"`  
`git checkout master`  

#### without new commit message  
`git merge new-branch`    
  
#### with new commit message  
`git merge -no-ff new-branch -m "merging master into new-branch"`    
  
### UNDO PUSHED MERGE  

`git checkout develop`  

develop some code..

`git commit -m "developing some code"`  

push changes on remote  

`git push origin develop`

checkout master branch: `git checkout master`  

NOW merge master into develop   `git merge develop`  

push to remote `git push origin master`

master branch has now all changes from develop branch  

REVERTING MERGE COMMIT  

`git checkout master`  

`git log`

find hash of merge commit you wish to UNDO  

`git revert -m 1 <merge-commit> `

<pre>
    With `-m 1` we tell git to revert to the first parent of the mergecommit on the master branch. 
    With `-m 2` would specify to revert to the first parent on the develop branch where the merge came from initially.
</pre>  

Now commit the revert and push changes to the remote repo and you are done.

# GIT COMMANDS  
status git-a : `git status` | `git whatchanged`    
list all remotes: `git remote -v`    
add remote: `git remote add my_awesome_new_remote_repo git@git.assembla.com:portfolio/space.space_name.git`    
count num of commits on current branch: `git log --pretty=oneline | wc -l`
  
novi branch: `git branch [new _branch]`    
mjenjanje branch-a: `git checkout [new_branch]`    
mjenjanje brancha s seljenjem promijenjenih fajli u novi branch:  `git checkout -b [new_branch]`    
stage file: `git add [ime fajle]`     
stage all file from current directory downwards rekursive: `git add .`    
  
  
comitaj sve stageane fajlove: `git commit -m "commit message"`    
push new branch on remote: `git push origin new_branch`    
brisanje grane na remote-u: `git push <remote_name> --delete <branch_name>`     
  
undoing changes:  `git revert [id_commita]`    

# CLEAR ALL GIT HISTORY
<pre>
    git checkout --orphan tmp-master # create a temporary branch
    git add -A  # Add all files and commit them
    git commit -m 'Add files'
    git branch -D master # Deletes the master branch
    git branch -m master # Rename the current branch to master
    git push -f origin master # Force push master branch to Git server 
</pre>
  
# REWRITING HISTORY OF GIT I.E SOFT RESET
- move head 20 commits in the past
`git reset --soft HEAD@{20}` 
- stage all 20 files
`git add .`
- commit all files wiht message
`git commit -m "this is new commit message"`
- push to remote with force to overwrite history
`git push --force`
- check the git log
`git log --online`
- tihs is debilana

- we see that commits have been merged in one commit
- IMPORTANT DO NOT DO THAT ON BRANCH THAT HAS BEEN PUSHED ON REMOTE AND SOMEBODY MAY HAVE CHECK IT OUT

# REBASE  
  
- https://www.javatpoint.com/git-rebase  
