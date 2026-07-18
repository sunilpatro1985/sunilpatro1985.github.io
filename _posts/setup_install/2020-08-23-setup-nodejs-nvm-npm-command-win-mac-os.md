---
title: "Setup Node.js flexible way with NVM [Windows / Mac OS]"
date: 2020-08-23
categories: 
  - "PLAYWRIGHT"
  - "TYPESCRIPT"
  - "NODEJS"
tags: [setupInstall, node]  
---

#### What is node.js

Node.js is the backbone of modern web development, powering everything from local build tools to massive enterprise servers.   

It is used to develop I/O intensive web applications mostly angular JS application.

Node.js is open source, completely free.

#### What is npm \[Node package manager\]

npm is an online repository for the publishing of open-source Node.js projects.

npm makes it easy for JavaScript developers to share the code and update.  
  
Note : npm is distributed with [Node.js](https://nodejs.org/)– which means that when you download Node.js, you automatically get npm installed on your computer.

#### Install node.js

Navigate to [https://nodejs.org/en/download/](https://nodejs.org/en/download/) \[download specific to your platform\]

#### Verify if node.js / npm is installed?

in Windows OS - Open **command prompt**

in Mac OS - Open **terminal**

and enter

`node -v`

or

`npm -v`

As a result output, you will get the version of nodejs or npm command.

There is a better way to install NodeJs using NVM command, let's see the benefit of NVM and how to do the setup /usage.

---

## Why Use NVM Instead of a Standard Installer?

If you download the official installer from the Node.js website, it installs a single global version of Node.js. This approach has major drawbacks:

* **Version Conflicts:** If Project A needs Node 18 and Project B needs Node 22, you cannot run both smoothly on the same machine, and manually installing and uninstalling Node.js versions to switch between projects is a nightmare. That is where **NVM** (Node Version Manager) comes in.
* **Permission Issues:** Global installations via standard packages often require `sudo` permissions on Unix systems, leading to security and file permission issues with `npm install -g`.
* **Inflexible Testing:** Upgrading or downgrading Node.js versions becomes a tedious process of wiping folders and running installers.

**NVM solves all of this.** It installs Node.js versions inside your user directory, bypassing `sudo` requirements, and lets you switch between versions in a single terminal command.

---

### Setup NodeJS using NVM (Node Version Manager)

In this comprehensive guide, you will learn how to install NVM, use it to manage multiple Node.js versions, and explore the most common use cases for optimizing your development workflow.

## Step 1: Installing NVM (Node Version Manager)

### For macOS and Linux

To install or update NVM, run the official cURL or Wget install script in your terminal:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
```

*or using wget:*

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
```

#### Update Your Shell Configuration

The script clones the nvm repository to `~/.nvm` and attempts to add the source lines to your profile file (`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`).

If your terminal does not recognize `nvm` after restarting it, manually append the following lines to your profile configuration file (e.g., `~/.zshrc` or `~/.bashrc`):

```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && echo "$HOME/.nvm" || echo "$XDG_CONFIG_HOME/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

```

Apply the changes:

```bash
source ~/.zshrc  # or source ~/.bashrc

```

### For Windows

NVM itself does not support Windows natively, but an excellent alternative called **nvm-windows** provides an identical experience.

1. Go to the [nvm-windows releases page](https://github.com/coreybutler/nvm-windows/releases).
2. Download the **`nvm-setup.exe`** file.
3. Run the installer and follow the wizard.
4. Open a new Command Prompt or PowerShell window.

---

## Step 2: Verifying the Installation

To verify that NVM has been installed successfully, open your terminal and check its version:

```bash
nvm --version

```

*Expected output:* `0.39.7` (or similar depending on your installed version).

---

## Step 3: Installing Node.js Using NVM

Now that NVM is ready, installing Node.js is incredibly easy.

### 1. Install the Latest LTS (Long-Term Support) Version

The LTS version is recommended for most users and production projects as it ensures stability.

```bash
nvm install --lts

```

### 2. Install a Specific Version

If your project requires a specific version (e.g., Node.js 18.16.0), you can request it explicitly:

```bash
nvm install 18.16.0

```

### 3. Install the Latest Cutting-Edge Version

To test the newest features available in Node:

```bash
nvm install node

```

---

## Step 4: Listing and Checking Your Installed Node Versions

To check which version of Node.js is currently active in your terminal environment:

```bash
node -v

```

To view a list of all Node.js versions installed locally on your system through NVM:

```bash
nvm ls

```

To browse all available Node.js versions available for remote download:

```bash
nvm ls-remote  # On Windows, use: nvm list available

```

---

## Step 5: How to Switch Node Versions (`nvm use`)

Once you have multiple versions installed, switching between them takes less than a second.

To switch your current shell session to use a specific version:

```bash
nvm use 18.16.0

```

To switch back to the latest installed LTS release:

```bash
nvm use --lts

```

> **Note:** The `nvm use` command only switches the Node version for your **current terminal window**. Opening a new terminal tab will fall back to your system's default version.

### Setting a Default Global Node Version

To permanently set a default version of Node.js across all new terminal windows and sessions, use the alias feature:

```bash
nvm alias default 20.11.0

```

---

## Step 6: Updating Your Node.js Version

Node.js updates frequently. When a new version drops, updating with NVM is perfectly seamless because it keeps your old installations intact until you choose to delete them.

### Method 1: Clean Install of a New Version

To update to a newer version of Node (e.g., moving to Node 22), simply run:

```bash
nvm install 22

```

### Method 2: Update Node and Migrate Global Packages

When you upgrade Node versions, you normally lose all globally installed npm packages (like `yarn`, `nodemon`, or `typescript`). NVM lets you upgrade and copy those packages over from your previous version automatically using the `--reinstall-packages-from` flag:

```bash
nvm install 22.0.0 --reinstall-packages-from=20.11.0

```

This tells NVM to install Node 22.0.0 and automatically migrate all global npm packages previously installed under Node 20.11.0.

### Cleaning Up Old Versions

Once you have verified the new version works correctly, you can free up disk space by uninstalling your older, unused versions:

```bash
nvm uninstall 16.20.0

```

---

## Top NVM Use Cases for Developers

### 1. Project-Specific Node Environments (`.nvmrc`)

Instead of remembering which project uses what Node version, you can create an `.nvmrc` file in the root directory of your project.

Inside the `.nvmrc` file, specify the version number:

```text
18.16.0

```

Now, whenever you or a team member clone the repository and open a terminal inside that folder, you just need to run:

```bash
nvm use

```

NVM will automatically read the `.nvmrc` file and switch to the exact version required.

### 2. Sandbox Testing and Troubleshooting

Upgrading your application's Node engine can introduce breaking changes due to deprecated dependencies. NVM allows you to create a safe sandbox workspace. You can switch to a brand new Node version, test if your test suites pass, and if things break, instantly toggle back (`nvm use <old-version>`) without interrupting your development flow.

### 3. Continuous Integration and Deployment Consistency

Using specific versions with NVM ensures that your local environment matches your CI/CD pipelines (e.g., GitHub Actions, AWS CodeBuild, Vercel) down to the exact patch version, eliminating the dreaded *"It works on my machine!"* bug.

### 4. Bypassing `sudo` Permission Errors

When installing global CLI packages with a standard Node installer (`npm install -g serverless`), you often hit `EACCES` permission errors that prompt you to use `sudo`. Because NVM isolates your Node runtimes inside your user profile directory (`~/.nvm`), you never need administrative privileges to execute global `npm` downloads.

---

## Conclusion

NVM is an absolute necessity for web developers. It saves countless hours of environment configuration, removes version-locking headaches, and lets you seamlessly jump across modern stacks and legacy codebases.

