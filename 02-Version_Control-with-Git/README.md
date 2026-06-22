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
