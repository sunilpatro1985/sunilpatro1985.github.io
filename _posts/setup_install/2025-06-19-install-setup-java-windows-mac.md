---
title: "Install and setup Java on Windows and Mac OS"
categories:
  - SELENIUM
  - JAVA
tags: [setupInstall, maven, java]  
  #- Post Formats
#link: https://github.com
---

If we want to write java programme or use any Java based application, we need to install and setup JDK.

Why JDK required? – in simple words,  JDK \[Java development kit\] required to write any java program & JRE is required to run the java program.

You can use below guide to setup JDK for both Windows or Mac OS.

**In MacOS** – Most of time, you will get the Java preinstalled out of box, in case it’s not installed or you want to upgrade, please refer below guide

To make sure if Java installed or not, Open Mac terminal and type

`java -version`

You will get the Java version as result output.

If Java is not installed, then you can download Java from here

[https://www.oracle.com/java/technologies/downloads/#java11](https://www.oracle.com/java/technologies/downloads/#java11)

Note – you need to create an account to download the JDK

![](https://qavalidation.com/wp-content/uploads/2022/03/Java_Downloads_Oracle_Mac_qavbox-1024x303.jpg)

![](https://qavalidation.com/wp-content/uploads/2022/03/Java_Downloads_Oracle_win_qavbox-1024x289.jpg)

**Environmental setup for Java** –

**For Mac OS,**

When you install the JDK dmg file, it will be installed under MacHD > /Library/Java/JavaVirtualMachines/jdk-11.0.10.jdk

Now navigate to Users folder and show hidden files (`Command + Shift + >`)

Find and open .zprofile (for Catalina / Big Sur OS) file in notepad or sublime text editor, and add the lines as

`export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.10.jdk/Contents/Home   export PATH=$PATH:$JAVA_HOME/bin`

To verify if Java is installed, open terminal and type

`java -version`

You will get the Java version as result output.

**For windows OS,**

JDK will be installed under path – C:\\Program Files\\Java\\jdk-X.X.X

Open Environmental setup and under the User variable section, add the JDK path into the PATH variable.

`Variable = PATH`  
`Value = C:\Program Files\Java\jdk-X.X.X\bin`

Note – refer [Setup env variable for windows or Mac OS]({% post_url setup_install/2025-06-19-setup-env-variables-windowsos-mac %}) to know how to add environment variables.

To verify if Java is installed, open cmd and type

`java -version`

You will get the Java version as result output.

Note – sometimes if the java version is not proper, then try restart your machine and verify java version in command prompt or terminal.

Hope this helps!

Experience & exploration about software QA tools & techniques. Maintaining & writing blog posts on qavalidation.com! Publishing video tutorials on youtube.com/qavbox
