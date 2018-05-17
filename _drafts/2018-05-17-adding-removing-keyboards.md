---
layout: post
title:  "Adding and Removing Keyboard Languages in Windows 10 with Powershell"
date:   2018-05-17
categories: Powershell
tags: powershell
---

## Adding Languages

There are many times in an organization, especially in larger organizations, where it becomes necessary to manage the languages your users have access to via their keyboard.  It's pretty simple to look at the language list, as Powershell has a built in cmdlet for this.

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

If we want to add a language, that is pretty simple.  All we need to do is use the "Add" method to our `$LanguageList` object to add the locale of the keyboard language we want to use.  For instance, if we want to add Lithuanian to the keyboards, we'd add "lt-LT" first to our object

`$LanguageList.Add("lt-LT")`

If we now view the contents of this, it should look like the following:

```Powershell
LanguageTag     : en-US
Autonym         : English (United States)
EnglishName     : English
LocalizedName   : English (United States)
ScriptName      : Latin script
InputMethodTips : {0409:00000409}
Spellchecking   : True
Handwriting     : False

LanguageTag     : lt-LT
Autonym         : lietuvių
EnglishName     : Lithuanian
LocalizedName   : Lithuanian
ScriptName      : Latin script
InputMethodTips : {0427:00010427}
Spellchecking   : True
Handwriting     : False
```

Assuming we're ready to set the language list to include Lithuanian, all we have to do now is run the cmdlet below:

`Set-WinUserLanguageList $LanguageList`

## Removing Languages

Unfortunately, we can't simply remove the "lt-LT" language from our language list with Powershell.  In fact, trying to remove it will return a "False" from Powershell.

```Powershell
PS> $LanguageList.Remove("lt-LT")
False
```

What we can do, however, is call the index position of our $LanguageList variable to choose which language we want to remove.  Inspecting our $LanguageList variable (if you've been following along) we can look at the second index position to find the Lithuanian keyboard language.

```Powershell
PS>$LanguageList[1]


LanguageTag     : lt-LT
Autonym         : lietuvių
EnglishName     : Lithuanian
LocalizedName   : Lithuanian
ScriptName      : Latin script
InputMethodTips : {0427:00010427}
Spellchecking   : True
Handwriting     : False

```

When we combine that with the Remove method, we're able to strip the Lithuanian keyboard from our $LanguageList object.

`$LanguageList.Remove($LanguageList[1]`

And when we look at our object one last time, we will see that only English is listed.  Once we have a list of languages we're happy with, just like before we can use our Set-LanguageList cmdlet to set the keyboards available to us.

`Set-WinUserLanguageList $LanguageList`

And there you have it!  You now know how to add and remove keyboard languages for Windows users.
