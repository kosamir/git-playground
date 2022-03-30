-Create a new branch:
git checkout -b feature_branch_name
=======
### Create a new branch:
`git checkout -b feature_branch_name`
-Edit, add and commit your files.
-Push your branch to the remote repository:
`git push -u origin feature_branch_name`
### brisanje brancheva:
-Create a new branch:
git checkout -b feature_branch_name
-Edit, add and commit your files.
-Push your branch to the remote repository:
git push -u origin feature_branch_name
-------------------------------------------------------------------------------------
brisanje brancheva:
git branch -d branch_name
git branch -D branch_name

The -d option stands for --delete, which would delete the local branch, only if you have already pushed and merged it with your remote branches.
The -D option stands for --delete --force, which deletes the branch regardless of its push and merge status, so be careful using this one!

brisanje branch-a na remoteu
`git push <remote_name> --delete <branch_name>`

## MERGE

`git checkout master`
`git branch new-branch`
`git checkout new-branch`

...develop some code...

`git add .`
`git commit –m "Some commit message"`
`git checkout master`
#### without new commit message
git merge new-branch

#### with new commit message
git merge -no-ff new-branch -m "merging master into new-branch"


# GIT COMMANDS
-- status git-a
`git status` 
`git whatchanged`
-- list all remotes
git remote -v 
-- add remote
git remote add my_awesome_new_remote_repo git@git.assembla.com:portfolio/space.space_name.git

--novi branch:
git branch [new _branch]
--mjenjanje branch-a
git checkout [new_branch]
--mjenjanje brancha s seljenjem promijenjenih fajli u novi branch
`git checkout -b [new_branch]
-- stage file
`git add [ime fajle]`
-- stage all file from current directory downwards rekursive
`git add .` 


- comitaj sve stageane fajlove
git commit -m "commit message"

--push new branch on remote
git push origin new_branch

--brisanje grane na remote-u:
git push <remote_name> --delete <branch_name>


undoing changes
git revert [id_commita]

# REBASE

`git push <remote_name> --delete <branch_name>`


## MERGE

`git checkout master`
`git branch new-branch`
`git checkout new-branch`

...develop some code...

`git add .`
...develop some code...
`git add –A`
`git commit –m "Some commit message"`
`git checkout master`
#### without new commit message
git merge new-branch

#### with new commit message
git merge -no-ff new-branch -m "merging master into new-branch"


# GIT COMMANDS
-- status git-a
`git status` 
`git whatchanged`
-- list all remotes
git remote -v 
-- add remote
git remote add my_awesome_new_remote_repo git@git.assembla.com:portfolio/space.space_name.git

--novi branch:
git branch [new _branch]
--mjenjanje branch-a
git checkout [new_branch]
--mjenjanje brancha s seljenjem promijenjenih fajli u novi branch
`git checkout -b [new_branch]
-- stage file
`git add [ime fajle]`
-- stage all file from current directory downwards rekursive
`git add .` 


- comitaj sve stageane fajlove
git commit -m "commit message"

--push new branch on remote
git push origin new_branch

--brisanje grane na remote-u:
git push <remote_name> --delete <branch_name>


undoing changes
git revert [id_commita]

# REBASE


- https://www.javatpoint.com/git-rebase