---
title: "Getting started with Appium and WebdriverIO for mobile app testing"
#last_modified_at: 2016-03-09T16:20:02-05:00
categories:
  - Blog
  - Appium
tags:
  - Post Formats
  - readability
  - standard
  - Appium
---

**WebdriverIO** is an advanced automation framework for web and mobile application.

It’s basically a wrapper on top of selenium (WebDriver protocol with nodeJS) for web automation and wrapper on top of appium for mobile application.

As per the appium client, Appium suggests to use webdriverio for appium with javascript/typescript instead of deprecated appium javascript client wd.

WebDriverIO is termed as wdio.

TypeScript is termed as TS.

### wdio Installation –
Refer webdriverIO for browser testing to install wdio dependencies and creating a basic project.

### Appium prerequisites –
Please refer to below links and follow the steps to install appium server, appium inspector, android setup and ios setup.

### Appium philosophy and it’s architecture
Guide to Appium 2.x server installation and changes [Latest]
New Appium inspector & it’s usage (latest)
Setup android and launch simulator for Appium (latest)
Setup Xcode, IOS and launch simulator for Appium (updated)

### Project customisations –

Open the project in Visual Studio Code.

Project structure will be as below –


Change the package.json script section to –

```
“scripts”: {
“wdio:android”: “wdio run wdio.android.conf.ts”,
“wdio:ios”: “wdio run wdio.ios.conf.ts”
}
```

Change package.json dependencies to –

We need to add appium-service dependency to run the appium.
```
“devDependencies”: {
“@wdio/cli”: “^x.xx.x”,
“@wdio/jasmine-framework”: “^x.xx.x”,
“@wdio/local-runner”: “^x.xx.x”,
“@wdio/spec-reporter”: “^x.xx.x”,
“@wdio/appium-service”:”^x.xx.x”,
“@wdio/selenium-standalone-service”: “^x.xx.x”,
“ts-node”: “^10.9.1”,
“typescript”: “^4.8.3”
},
```

x.xx.x is current latest 7.24.0

Open the command prompt / **COMMAND + `** to open the terminal – and type below to install the dependencies

    npm install

Pull out tsconfig.json and wdio.conf.ts from ‘test’ directory to project root directory for best use.

Change following lines –

*wdio.conf.ts*

Find the tsNodeOpts sections and change to below project key –

    tsNodeOpts: {
    transpileOnly: true,
    project: ‘tsconfig.json’
    }

Add appium capabilities into wdio.conf.js

Add a new folder inside project as “apps” which will hold the app under test.

We are using saucelabs sample rn app for testing.

If you are using different mobile application, then the appPackage, appWaitActivity & app will be changed.

Copy the default conf.ts and paste with name wdio.android.conf.ts and update as below.

Just override the capabilities section with below content.




For ios – instead of appPackage and appWaitActivity, we will use appium:bundleId

Copy the default conf.ts and paste with name wdio.ios.conf.ts and update as below.

Just override the capabilities section with below content.




Add appium test
Create a folder as “appTest” and subfolder “specs”

*androidTest.ts*




*iOSTest.ts*




**Running test**
Launch the android simulator for android tests and ios simulators for ios tests.

To run the test, open terminal from VSCode and type for android test (make sure you have android simulator or real device is ready)

    npm run wdio:android

To run the test, open terminal from VSCode and type for ios test (make sure you have ios simulator is ready with app installed)

    npm run wdio:ios

This will launch the app from simulator > click on menu > login > close the app
