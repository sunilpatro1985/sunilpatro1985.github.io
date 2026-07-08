---
title: "Setup maven java for windows mac OS"
categories:
  - Selenium
tags:
  - QA
  #- Post Formats
#link: https://github.com
---


Setup Maven & Java for Selenium \[Windows & Mac OS\]
====================================================

If you are using Selenium library for Java language binding to write automation tests, then we need to setup Java in windows or Mac OS

**Setup JAVA:**

For windows or Mac OS, you can refer here to [install and setup Java in detail](https://qavalidation.com/2022/03/install-and-setup-java-on-windows-and-mac-os.html/).

Setup Maven
-----------

**What is Maven build:**

As per the [Apache Maven](https://maven.apache.org/), Apache Maven is a software project management and comprehension tool. Based on the concept of a project object model (POM), Maven can manage a project’s build, reporting and documentation from a central piece of information.

Maven simplifies the build process.

Maven automatically downloads and attach required libraries or jar files (need to mention dependencies in pom.xml)

Compiles and generate reports based on execution.

**Download link:**

Navigate to [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)

Scroll down to **Files** section

![](https://qavalidation.com/wp-content/uploads/2016/08/download_Apache_Maven_qavbox-1.jpg)

**For windows OS**

*   On the link, download the `apache-maven-X.X.X-bin.zip` and Extract to a fixed location (note the path, required to setup the environmental variable).

**For MAC OS**

*   By default MAC OS comes with maven, if not
*   on the link, download `apache-maven-X.X.X-bin.tar.gz` and extract

Command to extract –  
`tar -xvf apache-maven-x.x.x-bin.tar.gz`

This normally extracts to current user folder, to know the path, use below command & note the path  
`pwd`

  
  
  

**Environment variable setup for Maven**

**For windows OS**

`MAVEN_HOME = c:\Maven\apache-maven\apache-maven-X.X.X`  
`Path = %MAVEN_HOME%\bin`

**For MAC OS**

Add below entries

```
export M2_HOME=/Users/[UserName]/apache-maven-3.1.1 
export PATH=$PATH:$M2_HOME/bin
```


Note – refer [Setup env variable for windows or Mac OS](https://qavalidation.com/2020/07/how-to-setup-environmental-variables-or-path-in-windows-10.html/) to know how to add environment variables.

**Verify if Maven present:**

Open command prompt \[Windows OS\] or terminal \[Mac OS\] and enter below command

`mvn -version`

![](https://qavalidation.com/wp-content/uploads/2016/08/VerifyMavenCommand.jpg)

Short url – [bit.ly/maveneclipse1](https://bit.ly/maveneclipse1)

If you are done with the Java & Maven setup, then move a step ahead and refer [how to create a maven project](https://qavalidation.com/2016/08/create-maven-test-and-pom-xml-maven-in-eclipse-part-2.html/) in either intelliJ or Ecplise IDE.


#### Author: sunil patro

Experience & exploration about software QA tools & techniques. Maintaining & writing blog posts on qavalidation.com! Publishing video tutorials on youtube.com/qavbox

