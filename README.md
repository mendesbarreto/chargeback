# Chargeback Nubank

[![Build Status](https://www.bitrise.io/app/cd342703b82274ad/status.svg?token=mzGBmxzxGbB4C-iDkEkR4g&branch=develop)](https://www.bitrise.io/app/cd342703b82274ad)
[![codecov](https://codecov.io/gh/mendesbarreto/chargeback-nubank/branch/develop/graph/badge.svg?token=ANmHedLdlw)](https://codecov.io/gh/mendesbarreto/chargeback-nubank)


The goal of this exercise is to implement a minimalist chargeback flow (That does not cover all real cases) .

## Project Steup

This project have some dependencies to be installed follow de next steps  

### Carhage Setup

Carthage is intended to be the simplest way to add frameworks to your Cocoa application. 
In my opnion is simpler than Cocoapods, and helps you in the build times using the cached builds.

To install carthage you should run the follow command: 

```shell
brew install carthage
```

After the carthage was installed run the command to generates the frameworks: 

```shell
carthage update --cache-builds --platform ios
```

