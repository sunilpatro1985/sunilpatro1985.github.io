---
title: gitignore DS_Store file in a better way
date: 2026-07-14 20:08:12
categories: [MISC, GIT]
tags: [git]     # TAG names should always be lowercase
---


### Step 1: Update your **.gitignore** file

Open the .gitignore file in the root directory of your repository. Add the following lines to make sure Git ignores .DS_Store files anywhere in your project structure:

```bash
.DS_Store
**/.DS_Store
```

### Step 2: Remove already tracked .DS_Store files

If you previously committed .DS_Store files, Git will continue to track changes to them even after adding them to .gitignore. Run this command in your terminal to untrack and remove them from your Git repository without deleting them from your local repo.

```bash
find . -name .DS_Store -print0 | xargs -0 git rm --cached --ignore-unmatch
```

Commit and push the changes.