---
title: "Java singleton pattern in Selenium framework"
date: 2021-12-02
categories: 
  - "seleniumtesting"
---

The _singleton pattern_ is a software design pattern that restricts the instantiation of a class to one "single" instance.

Ensures that a class can only have one object, so no other classes can create object

To implement singleton pattern in a class, we need to have

1. Private constructor of the class to restrict object creation outside of the class.
2. Private attribute of the class type that refers to the single object.
3. Public static method
    - To create and access the private attribute
    - Also write logic to restrict from creating more than one object.

https://youtu.be/viIpMPTelf0

If you navigate to our [selenium java framework](https://github.com/sunilpatro1985/SeleniumJavaFramework), here is the snippet of PageDriver.java

Which we already discussed in our previous [post](https://qavalidation.com/2021/09/basetest-to-handle-browsers-share-driver-object-across-project.html/)

```
public class PageDriver {

    private static final ThreadLocal<WebDriver> webDriver = new ThreadLocal<>();
    private static PageDriver instance = null;

    private PageDriver(){

    }

    public static PageDriver getInstance(){
        if(instance == null){
            instance = new PageDriver();
        }
        return instance;
    }

    public WebDriver getDriver(){
        return webDriver.get();
    }

    public void setDriver(WebDriver driver){
        webDriver.set(driver);
    }

    public static WebDriver getCurrentDriver(){
        return getInstance().getDriver();
    }
```

Explanation -

1st point of singleton pattern - Private constructor of the class to restrict object creation outside of the class.

`private PageDriver(){}`

We have created a private constructer, so that no one outside the class can create an object as

PageDriver driverSome = new PageDriverI()

2nd point - Private attribute of the class type that refers to the single object.

`private static PageDriver instance = null;`

This is the only object we will create for this class PageDriver, and outside classes will only use this object.

3rd point - Public static method which will create and access the above private attribute

```
 public static PageDriver getInstance(){
        if(instance == null){
            instance = new PageDriver();
        }
        return instance;
    }
```

Outside classes will now use the PageDriver.getInstance() to access any methods present inside the PageDriver class.

So whenever we need to use the driver object, then we can either use PageDriver.getInstance().getDriver() or PageDriver.getCurrentDriver() instead of PageDriver.getDriver()
