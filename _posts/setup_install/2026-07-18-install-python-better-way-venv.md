---
title: "How to Set Up Python 3, venv, and Virtual Environments"
date: 2026-07-18 15:25:00 +0530
categories:
  - PYTHON
tags: [setupInstall, python]  
---

Isolating your Python projects prevents dependency conflicts and keeps your global operating system clean. This guide covers how to install Python 3, create a virtual environment (`venv`), use package files, configure Git, and activate it across different operating systems.

## 1. Install Python 3

Before creating environments, ensure you have the correct Python 3 version installed.

### macOS
Install via [Homebrew](https://brew.sh):
```bash
brew install python
```

### Linux (Ubuntu/Debian)
Update your package manager and install Python 3 along with the required `venv` package:
```bash
sudo apt update
sudo apt install python3 python3-venv python3-pip -y
```

### Windows
1. Download the installer from the [official Python website](https://python.org).
2. Run the installer.
3. **Crucial:** Check the box that says **"Add python.exe to PATH"** before clicking Install.

---

## 2. Understanding venv: Built-in or Executable?

A common question is whether `venv` is a separate executable file. 

* **It is a built-in module:** `venv` is not a standalone executable or a third-party software tool. It is part of the Python Standard Library bundled directly with Python 3.3 and higher.
* **How it works:** When you execute the creation command, Python calls this built-in internal module to generate a standalone directory structure with its own isolated binaries and local `site-packages` folder.
* **Linux Exception:** On some Linux distributions (like Ubuntu), the OS packagers strip the library to save space. You must explicitly run `sudo apt install python3-venv` to enable it.

---

## 3. Create the Virtual Environment

Navigate to your project directory and run the built-in `venv` module. This creates a localized folder (typically named `.venv`) containing a copy of the Python executable.

* **macOS / Linux:**
  ```bash
  python3 -m venv .venv
  ```
* **Windows:**
  ```bash
  python -m venv .venv
  ```

---

## 4. Activate the Environment

You must activate the environment in your terminal window before installing packages or running scripts.

### macOS & Linux (Bash/Zsh)
```bash
source .venv/bin/activate
```

### Windows (PowerShell)
```powershell
.\.venv\Scripts\Activate.ps1
```
*(If you get a script execution error, run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process` first).*

### Windows (Command Prompt)
```cmd
.venv\Scripts\activate.bat
```

### Verification
Once activated, your terminal prompt will display a visual prefix:
```bash
(.venv) user@computer:~/my-project\$
```

---

## 5. Manage Project Packages with requirements.txt

In production and collaborative workflows, dependencies are saved inside a `requirements.txt` file instead of committing the entire environment folder to GitHub.

### Create and Edit requirements.txt Explicitly
You do not have to wait until packages are installed to create this file. You can manually create a file named `requirements.txt` in your root folder and type out your packages explicitly using various version structures:

```text
# Install the latest compatible version
requests

# Pin to an exact, specific version
flask==3.0.2

# Accept any version greater than or equal to a specific release
numpy>=1.26.0

# Prevent breaking updates but allow patches
pandas~=2.2.0
```

### Install Packages From a requirements.txt File
Once you have written or added packages to this file explicitly, activate your environment and run the following to install all listed dependencies at once:
```bash
pip install -r requirements.txt
```

### Save Current State Automatically
Alternatively, if you installed packages manually and want to freeze your current project packages into a text file automatically:
```bash
pip freeze > requirements.txt
```

---

## 6. Configure Git with a .gitignore File

You should **never** commit your `.venv` directory to GitHub. It contains thousands of source files specific to your operating system architecture, which bloats your repository and breaks for developers on different operating systems.

Create a file named `.gitignore` in your root project directory and add the following lines to exclude your environment files:

```text
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*\$py.class

# Virtual Environments
.venv/
venv/
ENV/
env/

# IDE files (Optional but recommended)
.vscode/
.idea/
```

---

## 7. Leave the Environment

To exit the virtual environment and return to your system's global Python context, simply run:
```bash
deactivate
```
