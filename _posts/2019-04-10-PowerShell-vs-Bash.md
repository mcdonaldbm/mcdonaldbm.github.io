---
layout: post
title:  "PowerShell vs Bash"
date:   2019-04-10
categories: Powershell automation exchange
tags: powershell, itpro, automation, exchange, remoting
---

*stands on soapbox*

Today, I came across a tweet, and in true elder millennial fashion, I got triggered.  The tweet was this one (name and handle obfuscated):

![Twitter Quote about the "superiority" of bash](/images/powershell_vs_bash.jpg)

The reason it's triggering to me is not only because it dogs on PowerShell (I've made a healthy career on it, Praise Snover), but it's also comparing apples and oranges.  If I were a carpenter, it would be like saying "Look, a hammer is great and all but it would be better if it was a screwdriver".  Administrators are often told to "choose one side of the fence" which only hinders their ability.  The fact is, PowerShell and bash are two different tools with different (albeit, similar) purposes.  In this article I'm going to give you a fact, an observation, and an opinion about the difference between PowerShell and Bash.

## Fact: Technical Differences between PowerShell and Bash

For those completely unfamiliar with the subject, bash is the command shell and scripting language for the majority of Linux systems whereas PowerShell is the command shell and scripting language for the majority of Windows systems.  A lot of people boil this argument down to a simple "Linux vs. Windows", but today we're going to talk about the scripting languages themselves.

I know that I could get critiqued heavily for what I'm about to say, but the simple truth is that there's only one major difference between bash and PowerShell.  Bash treats outputs as strings, whereas PowerShell treats output as objects.  Philosophically, bash says that because you, as an administrator, are all powerful, you are responsible for the quality of what you input to bash, and that will directly impact the quality of the output from bash.  PowerShell, on the other hand, determines a bit of the output for you.  By structuring output as objects, you're able to store and manipulate the objects with different methods and properties.

One way to think about this is that with bash, your commands and outputs represent one part of a whole.  Piece enough parts together and you can build something impressive.  This is akin to using one piece of your script to build an engine, the other some axles, and a third your wheels.  At the end of the day you'll have a car when it's combined.  PowerShell, on the other hand, responds to your command with the whole car and you have to work backward to get an individual component.

I know there is a lot more to the differences, but in a nutshell that should get you up to speed.

## Observation: Career Trajectories

There are a couple of things that I've noticed over the years in the industry.  First, there are what I lovingly call "left-click engineers".  These are the folks who don't know any scripting languages, let alone the big two of PowerShell and bash.  More often than not, these are the type that get passed over for promotions, get overlooked when it comes to performance based compensation, and will probably be automated or let go within the next few years.

Next, there are people who were told to keep to one side of the fence.  I actually feel really sad for these folks, because whether or not their boss knows it, they're killing their employee's career prospects.  I can't think of a single shop that I've consulted for, worked for, or had a drink with that was a homogenous Linux or Windows shop.  There are simply too many things that require multiple OS's and therefore multiple scripting languages.  Thankfully PowerShell is now available on Linux, and there's a Linux subsystem for Windows, but it's not a direct translation either direction.  You could maybe even argue that orchestration is replacing a direct need for either language, but I also haven't met a shop that is a 100% orchestrated environment either.  The fact is scripting languages are going to be around and are going to be necessary for a hot minute.

Finally, there are people who can work in either type of environment using PowerShell or bash.  These are the kinds of folks employers find desirable because they can be assigned to any task and won't dog on the other team members for being a Linux or Windows admin.  This is similar to the whole PC vs. Mac debate 15 years ago where Windows people thought they were better for reasons a, b, and c, while at the same time Mac users thought they were superior for reasons x, y, or z.  Fun fact: I code PowerShell on my MacBook Pro and I *love it*.  I've written bash scripts on my Windows machine to plug into Jenkins with *zero complaints*.

## Opinion: Be Bilingual

There's no point in only knowing one "language" (that is if you even consider either of these utilities a full-fledged language).  In fact, there are enough functional equivalents between PowerShell and bash that Windows is even shipping with some bash commands.  Back in the day, you'd have to hack your `PATH` in order to get `ls` to be treated like `dir` on a Windows command line.  Now, you can go to PowerShell, type `ls`, and get the response you expect.  Today, you have so many cross-platform scripts and utilities that the difference is shrinking, but the code bases are still polarized. Certain shops will only have used bash to create their scripts, whereas other shops will have only used PowerShell.  I've recently walked into a shop without a single PowerShell script - everything was written in bash or even perl.  It took some time, but now we have a pretty even split among our scripts in a near 50/50 split of Windows and Linux. In order to step into an environment and be confident that you have the ability to tackle the tasks at hand, know both.

I hope you've learned something useful.

*steps down from soapbox*

_Can't get enough of me?  Be sure to follow me on Twitter_ [@_brycemcdonald](https://twitter.com/_brycemcdonald).

_Did you know I'm available for hire?  Contact me for details via twitter, email, or on the [NorthCode Solutions](http://www.northcodesolutions.com) website._