---
title: "Setup maven java for windows mac OS"
categories:
  - SELENIUM
  - MAVEN
tags: [setupInstall, maven, java]  
  #- Post Formats
#link: https://github.com
---


Setup Maven & Java for Selenium \[Windows & Mac OS\]
====================================================

If you are using Selenium library for Java language binding to write automation tests, then we need to setup Java in windows or Mac OS

**Setup JAVA:**

For windows or Mac OS, you can refer here - [install and setup Java in detail]({% post_url setup_install/2025-06-19-install-setup-java-windows-mac %}).

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

![My Photo](/assets/img/posts/download_apache_maven1.jpg)

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

```bash
MAVEN_HOME = c:\Maven\apache-maven\apache-maven-X.X.X 
Path = %MAVEN_HOME%\bin
```

**For MAC OS**

Add below entries

```bash
export M2_HOME=/Users/[UserName]/apache-maven-3.1.1 
export PATH=$PATH:$M2_HOME/bin
```


Note – refer [Setup env variable for windows or Mac OS]({% post_url /setup_install/2025-06-19-setup-env-variables-windowsos-mac %}) to know how to add environment variables.

**Verify if Maven present:**

Open command prompt \[Windows OS\] or terminal \[Mac OS\] and enter below command

```bash
mvn -version
```  

```Plaintext
Apache maven - X.X.X
Maven Home: [Local Path to apache maven]
...
```


