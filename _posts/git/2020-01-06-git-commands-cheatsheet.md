---
title: "Git commands cheatsheet"
date: 2020-01-06
categories: [MISC, GIT]
tags: [git]  
---

GitHub is one of the popular code repository and also used as version control tool, git provides various commands to perform operations like pushing code to remote repo, pulling code \[can be from somebody else or from the central repo\] and many other tasks.

Here we will be listing out most commonly used git commands.

### Git username or email setup -

```
//Global setup
git config --global user.name "YourUserName"
git config --global user.email "name@email.com"

//to set the username locally
git config user.name "AnyUserName" 

//to get the user name
git config user.name  //will give you the user name associated currently

//to reset user name and email
git config --global --unset user.name
git config --global --unset user.email
git config --global --unset user.password
```

Note : 

If you are MAC user then you can open KeyChain Access Application from finder and then look for your account listed there. Just click on it and update your password. Now give a try and things will fall in place.

If you are on Windows 10 with Git Remove/update related Credentials stored in Windows Credentials - >>Control Panel\\All Control Panel Items\\Credential Manager

If you are using multiple github accounts, then best option is to use [github desktop](https://desktop.github.com/) \[available for mac and windows OS\], install and clone a repo or browse for an existing repo, this will ask username and password to authenticate separately for each repo.

### To clone the code

```
git clone --recurse-submodules <path of remote repo.git>
git checkout <name of branch> //checkout to a particular branch 
git status //to know if anything changes locally or which branch you are on
```

### To pull the latest code

**git pull**

Apply the remote repository changes to local repository.

`git pull = git fetch + git merge`

```
git pull origin <branchName> //pull specific branch
```

**git fetch**

Informs the local repository that there are new changes available in remote repository with out applying the changes / merge changes to local repository.

### To push local project to git for first time

Let's say we have created a repo on github, on local drive add some files and in command prompt, navigate to local project directory

```
git init
git add .
git status
git commit -m "message"
git remote add origin <remote git path.git>
git remote -v
git push -u origin master

//Note - above will ask you username and password as we have unset the credentials
```

### To push local changes to git

Let's say you have a new local branch to push to repo

Make sure your git remote -v provides git@github.com:userName/repoName, else you need to set the url explicitly

```
git remote set-url origin git@github.com:userName/repoName.git

git remote -v //verify if the git url properly set

git push --set-upstream origin newBranchName

```

Note -

To cancel the local git repo which has been created by `git init`

`rm -rf .git`

git add . will stage the changes, but If you want to reset / remove the git add a specific file or all files you added, basically un-stage all files

```
git reset <fileName>
```

To unstage all files -

```
git reset
```

### To undo changes

`git checkout [filename_with_path]` //To undo any local changes

### git stash commands

```
git stash save "some message" 
//discard all your uncommitted [staged & unstaged] changes and saves for later use
//save "some message" is optional

git stash -u
//-u (or --include-untracked) tells git stash to also stash your untracked files.

git stash -a
// -a (or --all) is used to include changes to ignored files 

git stash list //lists all stashes
//e.g
stash@{0}: <some message>
stash@{1}: <some message>
stash@{2}: <some message>
    
git stash drop //with no parameter, it deletes the top stash in the list
git stash drop stash@{n} //n is no. shown in list

git stash clear //remove stash list

git stash pop //to apply stash from recent index i.e - 1st or 0
git stash pop stash@{n}
//Pop applies your stash to working copy and removes the changes from your stash

git stash apply
git stash apply stash@(n)
//apply applies your stash to working copy but keeps for apply the same stashed changes to multiple branches.
```

### Branch delete

```
//To delete the local branch use one of the following:
git branch -d branch_name
git branch -D branch_name
//Note: The -d option is an alias for --delete, which only deletes the branch if it has already been fully merged in its upstream branch.
//-D, which is an alias for --delete --force, which deletes the branch "irrespective of its merged status."

git push origin --delete <branch_name>
//To delete a branch from remote Git repository

//Note - if you are getting error while deleting a branch, may be due to the branch is not available or someone deleted already, you can always run below command to refresh branch listing
git fetch -p
```

### Branch commands

```
git branch -a //List all branches
git branch //displays the current branch

git branch <NewbranchName> //to create a branch

git checkout <branchName> //to switch to a different branch
git checkout -b <NewBranchName> //to create and switch to new branch
git clone --single-branch -b <branchName> <git path> //to clone specific branch

git push <remote_name> -d <branch_name> //to delete remote branch
```

### To know which git repo is associated currently

`git remote -v`

### .gitignore

Ignore files and folders to push to remote repo

```
touch .gitignore //create a file

//mention files and folders that you do not want to push to remote repo
//----.gitignore------
log.txt
/folderName
```

For more ways to ignore the files or file extensions, refer [https://www.atlassian.com/git/tutorials/saving-changes/gitignore](https://www.atlassian.com/git/tutorials/saving-changes/gitignore)

### To remove or change the remote url -

In case you want to push your existing repo from one github account to another

`git remote set-url origin git://new.url.here`

To remove the current remote git

`git remote remove origin`
