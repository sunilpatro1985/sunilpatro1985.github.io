---
title: why we should not use selenium findby
date: 2026-01-16 20:08:12
categories: 
  - "SELENIUM"
  - "FRAMEWORK"
tags: [selenium, framework]  
---

## Reasons to Avoid @FindBy in POM

### Implicit Wait Issues

- @FindBy elements are initialized when the page object is created, which can cause issues if the elements are not present yet (e.g., due to dynamic loading or AJAX).
This can lead to NoSuchElementException if the element isn't immediately available.
Reduced Flexibility

- It is less flexible for dynamic locators. If your locator changes based on test data or runtime conditions, @FindBy is not suitable.
Trouble with Stale Elements

- If the page is refreshed or DOM changes, the elements found with @FindBy can become stale, leading to StaleElementReferenceException.
Harder to Debug

- Errors can be harder to trace because the actual element lookup happens at object initialization, not at method execution.
Not Ideal for Waits and Synchronization

- Explicit waits (like WebDriverWait) are easier to use with direct driver.findElement() calls, allowing better synchronization with dynamic elements.
Performance Concerns

- All elements are initialized at once, which can slow down test startup if you have a lot of elements.

### Alternative Approach

Use driver.findElement(By...) within methods: 
This finds elements only when needed, allowing for dynamic waits and better error handling.

Combine with Explicit Waits: You can write methods that wait for elements before interacting with them.

### Example

**Using @FindBy:**

```bash
@FindBy(id = "loginBtn")  
private WebElement loginButton;
  
public void clickLogin() {  
    loginButton.click();  
}  
```


**Using driver.findElement:**

```bash
public void clickLogin() {  
    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));  
    WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("loginBtn")));  
    loginButton.click();  
}  
```