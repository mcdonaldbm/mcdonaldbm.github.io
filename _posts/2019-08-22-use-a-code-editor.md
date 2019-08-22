---
layout: post
title:  "Use a Code Editor"
date:   2019-08-22
categories: Powershell automation
tags: powershell, itpro, automation, ebook
---

Don't get me wrong, there's a time and a place for Notepad++.  There was a point in time where I preached how amazing the editor was for all purposes, even for PowerShell!  That time is over.  As our code increases in complexity, we need a code editor that can keep up with the workload.  With Notepad++ and other basic text editors, we have a much harder time doing any code troubleshooting or any debugging on the fly.  Yes, there are linters available (a "linter" is an add-on which helps look for basic coding sytnax errors) but beyond that there's not very much it can help us with.

A simple switch in our editor can have an exponential impact on our code output, and it's for this reason that I recommend using Visual Studio Code with the PowerShell extension.  This is a minimum-effort change that we can make that will help us with every aspect of our scripting.  By using Visual Studio Code and the PowerShell extension, you'll be able to take advantage of the linting functionality, the autocomplete features, and you'll even be able to use the integrated terminal to run, stop, and debug your code on the fly.

Let's dive in to how to install Visual Studio Code and the PowerShell extension, then I'll show you a few ways you can use it.

## Installing Visual Studio Code

The steps to install Visual Studio Code are pretty simple.

* Download Visual Studio Code [here](https://code.visualstudio.com/download)
* Double click the installer to get started
* Select install options (explained below)
![Visual Studio Code Installation Options](/images/use-a-code-editor/vscode_install.JPG)
* Finalize Installation

Now let's back up and check out those options again real quick.

* Create a Desktop Icon

This is the most self explanatory option here - whether or not you want to be able to launch Visual Studio Code from your desktop.

* Add "Open with Code" action to Windows Explorer file context menu.

When you right click on a file, this option will allow you to select "Open with Code" and immediately begin editing a file.

* Add "Open with Code" action to Windows Explorer directory context menu.

When you right click on a _folder_, this option will allow you to select "Open with Code" and choose a file you want to edit.

* Register Code as an editor for supported file types.

This option will allow you to automatically open certain files with Visual Studio Code, such as ".txt", ".csv", ".ps1", and more.

* Add to PATH (requires shell restart)

Finally, this option will allow you to reference Visual Studio Code from within a PowerShell terminal.  For instance, if you were currently in the directory "C:\Temp" it would allow you to type the following command in order to open Visual Studio Code in that directory.

```PowerShell
C:\Temp> code .
```

## Installing the Visual Studio Code PowerShell extension

In order to install the extension, we'll open Visual Studio Code and press the keys "Control+SHIFT+X" or click on the building blocks icon in the left navigation pane.  This will pull up the extensions browser so we can check out all the different extensions that are available to us in Visual Studio Code.  The next steps are super simple.

* Search "PowerShell"
* Select the PowerShell Extension
* Click "Install"
* Click "Reload"

And we're done!

## Using Visual Studio Code

Now that we have Visual Studio Code and the PowerShell extension installed, let's explore some ways we can use it.

### Configuring Your PowerShell Version

The first thing we should do when using PowerShell and Visual Studio Code together is make sure that we're using the correct version of PowerShell.  To do this, we'll open the command pallet by pressing `CTRL + SHIFT + P` on Windows/Linux, or `CMND + SHIFT + P` on Mac.  The command pallet is how we can quickly access all of our configuration items and options for Visual Studio Code and send commands to it.  Here, we'll search for the term "Session" which will allow us to select `"PowerShell: Show Session Menu"` by pressing `Enter`, then we can select our version of PowerShell by navigating with the arrow keys and pressing `Enter` again on our desired version.

### Debugging PowerShell

Once you have some code that you want to debug, you'll want to start by navigating your terminal to the working directory of your code.  There, you can press `F5` to start debugging.  By selecting a line of code and pressing `F9` you can set breakpoints in your code.  If the basics aren't enough for you, you can also set more advanced debugging options by opening the debugging configuration with `CTRL + SHIFT + D` on Windows/Linux, or `CMND + SHIFT + D` on Mac.

## Useful Links

Want to keep learning how to best use Visual Studio Code for your PowerShell development?  Check out the links we've compiled on the subject.

* [TechSnips](https://techsnips.io/tags/visual-studio-code/)
* [Adam the Automator Blog](https://adamtheautomator.com)
* [Bryce's Blog](https://www.brycemcdonald.net)
* [Official Microsoft Docs](https://code.visualstudio.com/docs)