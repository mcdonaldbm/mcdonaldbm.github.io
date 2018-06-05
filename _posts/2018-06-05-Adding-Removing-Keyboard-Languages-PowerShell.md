---
layout: post
title:  "Adding and Removing Keyboard Languages with PowerShell"
date:   2018-06-05
categories: PowerShell
tags: powershell, itpro, automation
---

There are many times in an organization, especially in larger international organizations, where it becomes necessary to manage the languages your users have access to via their keyboard.

## Adding Languages

It's pretty simple to look at the language list, as Powershell has a built in cmdlet for this.

`$LanguageList = Get-WinUserLanguageList`

When we view the contents of $LanguageList, we will see the object that is returned, and if U.S. English is your only keyboard language of choice, then your output should look like the following:

```Powershell
LanguageTag     : en-US
Autonym         : English (United States)
EnglishName     : English
LocalizedName   : English (United States)
ScriptName      : Latin script
InputMethodTips : {0409:00000409}
Spellchecking   : True
Handwriting     : False
```

## [Check out the full article on 4SysOps!](https://4sysops.com/archives/adding-and-removing-keyboard-languages-with-powershell/)

_Can't get enough of me?  Be sure to follow me on Twitter_ [@_brycemcdonald](https://twitter.com/_brycemcdonald).

_Did you know I'm available for hire?  Contact me for details via twitter, email, or on the [NorthCode Solutions](http://www.northcodesolutions.com) website._