---
title: "Setup environmental variables or PATH in Windows & Mac OS"
categories:
  - Selenium
tags:
  - QA
  #- Post Formats
#link: https://github.com
---

To get direct access to software exes or runner files on the command prompt or terminal, we set environmental variables or set the path of the software exe into PATH variable so that we need not to provide complete path.

Mac OS – Terminal

Windows OS – Command Prompt

### Windows OS

**There are 2 types of env variables**

*   User variables
*   System variables

User variable is specific to current user logged in only.

System variable is accessible to all users on the computer.

**To set the variables –** 

Navigate to

**Control Panel > System and Security > System > Advanced system settings**

![](https://qavalidation.com/wp-content/uploads/2020/07/AdvancedSystemSetting_win10.jpg)

then you will get modal window to set the Env variables

![](https://qavalidation.com/wp-content/uploads/2020/07/EnvVariables.jpg)

Click on New

add the variable name and value

click on OK to save the variable.

![](https://qavalidation.com/wp-content/uploads/2020/07/Setting_Env_Variable_win10.jpg)

**To edit a variable value,** from the list of variables, click on any row > Edit… to update the changes.

### Mac OS –

If you are on Catalina or Big Sur, then you can navigate to `Users` folder (currently logged in user)

Show hidden files / folders by key press `Command + Shift + >`

Find and open .zprofile file in text or sublime text editor (preferred one)

You can append the path of any application with PATH variable with an `export` keyword & save the file.

Example –

`export PATH=$PATH:$JAVA_HOME/bin`

Note – You can append multiple paths using colon (:)

![](https://qavalidation.com/wp-content/uploads/2020/07/updateEnv_variable_zprofile_qavbox-1024x270.jpg)

Note – Sometimes if the environment variables not set properly after adding or saving, then once restart the machine and re verify.

Hope this helps!

Experience & exploration about software QA tools & techniques. Maintaining & writing blog posts on qavalidation.com! Publishing video tutorials on youtube.com/qavbox
