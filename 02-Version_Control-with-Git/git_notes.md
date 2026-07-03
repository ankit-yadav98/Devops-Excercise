## Notes for Version Control with Git
<br />

<summary>Git commands</summary>
<br />

To add the remote url to local:<br />
`git remote add origin <url>` <br />

To check if remote is added or not:<br />
`git remote -v`

To remove origin or any other url which is named while adding remote:<br />
`git remote remove origin`

<summary>Concept of Branches</summary>
<br />

Pull and track a remote branch:<br />
`git checkout -b feature/branch --track origin/feature/branch`

Bind an existing local branch to a remote branch (track remote branch):<br />
`git branch -u origin/<remote-branch> <local-branch>`

Detach a existing local branch from a tracked remote branch (stop tracking remote branch):<br />
`git branch --unset-upstream`

Push an track a new local branch:<br />
`git push -u origin <branch-name>`

Push an already tracked branch:<br />
`git push origin <branch-name>`

List all local branches:<br />
`git branch`

List all remote branches:<br />
`git branch -r`

List all branches (local and remote):<br />
`git branch -a`

Update branches (and delete references to no longer existing remote branches):<br />
`git fetch --prune`

*****

<summary>Deleting Branches</summary>
<br />

Delete a local branch:<br />
`git branch -d <branch-name>`

Delete a remote branch:<br />
`git push -d origin <branch-name>`

*****

<summary>Gitignore</summary>
<br />

If you want git to ignore a file or directory, you can add it to .gitignore. But if that file or directory is already tracked by git (i.e. it is already part of a commit and has been pushed to the remote repository), you have to remove it from the git cache and push that change to delete it also on the remote repository.

```sh
git rm --cached .DS_Store
git rm -r --cached .idea
git rm -r --cached node_modules
git push
```

Find out which .gitignore entry is responsible for a certain file being ignored?
`git check-ignore -v <path/to/file>`

******
<summary>Git stash</summary>
<br />

Suppose if we are on branch-B and have made some changes locally and now we want to switch to some other Branch-A then git will throw an error as below:

```sh
error: Your local changes to the following files would be overwritten by checkout:
        app/server.js
Please commit your changes or stash them before you switch branches.
Aborting
```

So, in order to move to other branch-A and work there and want to save the changes which you have made in Branch-B, you can do it by stashing the changes by using below command:
`git stash'

And then you can checkout to other Branch-A and work there. And now if you want to come back to the Branch-B and continue your work here. You will do it as below:<br />
`git checkout Branch-B` <br />
`git stash pop`

And now you can continue your work here.

*******
<summary>Git commit</summary>
<br />

If we want to go to a particular commit. Let's say in order to reproduce a bug or track when the bug was introduced. <br />
`git checkout <hash commit in history>`

To revert back to HEAD, we can use below command <br />
`git checkout <branch_Name>`

Below command used to reset the commit to previous commit where HEAD~1 represents previous commit. HEAD~2 represents previous to previous commit. And so on. <br />
hard is used to tell to remove the commit from the staging area as well i.e. from "git add filename" stage which in truns means that changes will be reverted to previous commit <br />

`git reset --hard HEAD~1` 

Whereas --soft or if we don't give any parameter then it is treated as soft. So, here commit is being removed from git log history and the changes are being staged i.e. files changes are remained and are present in the staging area and we can make the changes to those files. In this changes are not lost i.e. changes are still present in your working direectory whereas in hard reset changes are lost. <br />
`git reset HEAD~1` <br />

So, like after making the soft reset. Now, we want to make some more changes and want to add those in our previous commit i.e. in the previous git log and not a new commit logs i.e. it changes the last commit. <br />
`git commit --amend` <br />

All the above changes are done locally. So, in order to make the changes on the remote repo. We have to push forecully as below: <br />
`git push --force` <br />

Creates a new commit to revert the old commit changes. It reverts the changes by making a new commit i.e. adds in the history logs whereas git reset removes the commit from history log. <br />
`git revert <commit hash> ` <br />

You can list the changed files as well using the --name-only option with the git log command
`git log --name-only ` <br />

