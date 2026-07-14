---
title: "Docker - what, why & docker terms"
date: 2021-12-29
categories: 
  - "docker"
  - "seleniumc"
  - "seleniumpython"
  - "seleniumtesting"
---

**Docker** is an open-source containerisation platform. 

It enables to package applications into containers, standardised executable components combining application source code with the operating system (OS) libraries and dependencies required to run that code in any environment.

Containerisation is an alternative to virtualisation.

Virtual machines like Vmware or virtual box are heavier and big in size as they hold the complete operating system with UI components and other utility applications as well, where as docker can have only OS libraries and dependencies to run any application.

https://youtu.be/enge3599voo

**Why to use docker?**

- Efficient use of system resources

Containers are inherently smaller in capacity than a VM and require less start-up time, allowing far more containers to run on the same compute capacity as a single VM.

- Enables faster delivery cycles

Can test any piece of software on any specified environments early, so we can decide to revert back the build or move further.

- Easily configurable for testing applications across multiple environments

Can test automation tests across multiple browsers with platforms with docker instead of depending on actual machines.

**Some docker terms -**

**Docker Images**

_Docker images_ contain executable application source code as well as all the tools, libraries, and dependencies that the application code needs to run as a container. 

**Docker commands** 

Commands to manage docker like download, start, stop, get details of currently running docker images etc.

**DockerFile**

Simple text file containing command-line interface (CLI) instructions for how to build docker container image. 

_DockerFile_ automates the process of Docker image creation.

**Docker hub**

Public repository of docker images.

Users can share their own images & also can download predefined base images.

**Docker daemon**

Docker daemon is a service running on your operating system.

We can use docker commands to create and manage Docker images.

**Docker compose**

Docker Compose is a tool for running multi-container applications on Docker defined using the YAML file, 

A Compose file is used to define how the one or more containers that make up your application are configured. 

docker compose up - create and start your application with a single command

**VNC viewer**

A utility tool to have a visual representation of exactly what's going on inside Docker which makes it easier to debug.
