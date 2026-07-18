---
title: How to Manage Multiple GitHub Accounts on One Machine
author: Sunil Patro
date: 2026-07-14 17:00:00 +0530
categories: [DEVOPS, GIT]
tags: [git, gitaccounts]     # TAG names should always be lowercase
render_with_liquid: false
---


Managing multiple GitHub accounts (such as a personal account and a work account) on a single machine can be tricky. If you don't configure it correctly, you'll constantly run into permission errors. 

The most robust way to handle this is by using **SSH keys** and a custom **SSH configuration file**. Here is a step-by-step guide to setting it up seamlessly.

---

## Step 1: Generate Separate SSH Keys

First, open your terminal and generate unique SSH keys for both your personal and work accounts.

### 1. Generate Personal SSH Key

```bash
ssh-keygen -t ed25519 -C "personal@email.com" -f ~/.ssh/id_ed25519_personal

```

When prompted for a passphrase, press `Enter` twice to leave it empty.

Your terminal will confirm that your keys have been saved:

> `Your identification has been saved in /Users/userName/.ssh/id_ed25519_personal`  
> `Your public key has been saved in /Users/userName/.ssh/id_ed25519_personal.pub`

### 2. Copy the Personal Key to GitHub

View your public key using the `cat` command:

```bash
cat ~/.ssh/id_ed25519_personal.pub

```

Copy the output (which starts with `ssh-ed25519...`), then log into your personal GitHub account. Go to **Settings > SSH and GPG keys > New SSH Key**, paste the key, and save it.

### 3. Generate Work SSH Key

Repeat the same process for your professional/work account:

```bash
ssh-keygen -t ed25519 -C "orgemail@work.com" -f ~/.ssh/id_ed25519_work

```

Copy this public key (`cat ~/.ssh/id_ed25519_work.pub`) and add it to your work GitHub organization account.

---

## Step 2: Create a Custom SSH Configuration

To tell your machine which SSH key to use for each account, you need to create or edit your SSH config file.

Open or create `~/.ssh/config`:

```bash
nano ~/.ssh/config

```

Add the following configuration layout. Notice how we use unique aliases for the `Host` lines to separate the accounts:

```text
# Personal GitHub
Host github.com-personal
  HostName github.com
  User git
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_personal

# Work GitHub
Host github.com-work
  HostName github.com
  User git
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_work

```

*Save and exit the editor (in Nano, press `Ctrl+O`, `Enter`, then `Ctrl+X`).*

---

## Step 3: Test the Connections

Before interacting with your repositories, verify that your machine successfully authenticates with GitHub using the custom hosts.

Test your personal connection:

```bash
ssh -T git@github.com-personal

```

The first time you connect, you will see a security warning:

```text
The authenticity of host 'github.com (20.xxx.xx.xx)' can't be established.
ED25519 key fingerprint is SHA256:+................xxxxx........
Are you sure you want to continue connecting (yes/no/[fingerprint])?

```

Type **`yes`** and hit `Enter`. You should get a successful response matching your personal username:

> `Hi username! You've successfully authenticated, but GitHub does not provide shell access.`

Test your work profile using the exact same step:

```bash
ssh -T git@github.com-work

```

---

## Step 4: How to Use Your Repositories

Now that the routing rules are established, you need to slightly tweak how you clone and configure your local git projects.

### Case A: Cloning a New Repository

When cloning via SSH, replace `github.com` in the clone URL with the custom `Host` alias you defined in your config file.

**For a Personal Repo:**

```bash
# Original URL: git@github.com:personal-user/repo.git
git clone git@github.com-personal:personal-user/repo.git

Example - 
git clone git@github.com-personal:sunilpatro1985/Playwright-TS-BoilerPlate-Framework.git

```

**For a Work Repo:**

```bash
# Original URL: git@github.com:work-org/repo.git
git clone git@github.com-work:work-org/repo.git

```

### Case B: Updating an Existing Locally Cloned Repository

If you have already cloned a repository prior to setting up multiple accounts, update its remote URL to route through the new alias config:

```bash
git remote set-url origin git@github.com-personal:personal-user/repo.git

```

### Don't Forget: Configure Local Author Information

To prevent committing to your work repository with your personal email (or vice-versa), always set local configurations inside each repository directory instead of using `git config --global`.

Navigate into your specific project folder and execute:

```bash
git config user.name "Your Name"
git config user.email "personal@email.com" # Or orgemail@work.com for work projects

```

