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
git push <remote_name> --delete <branch_name>

## MERGE

git checkout master
git branch new-branch
git checkout new-branch
# ...develop some code...
git add –A
 git commit –m "Some commit message"
git checkout master
git merge new-branch
