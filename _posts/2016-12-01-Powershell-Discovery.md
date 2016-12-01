---
layout: post
title:  "Powershell Discovery with Get-Command and Get-Help"
date:   2016-12-01
categories: Powershell automation
tags: powershell
---

*This is an old post I made in February of 2016.  Since converting to wordpress from time to time I'll be pulling my old posts over and put them here*

If you're learning Powershell for the first time, or if you're in the middle of an emergency and are trying to crunch a fix together by yesterday, let me introduce you to your best friends!

There's not a single Powershell post out there that doesn't start with "Get-Command" and "Get-Help".  These two commandlets are arguably more useful than anything else Powershell has to offer the user and masters of them can do anything they want, since they will give you the ability to discover what you can do, as long as you know what you want to do.  I'm going to go ahead and assume that you're not new to scripting and system administration - there are plenty of better resources out there for that.

Get-Help and Get-Command are similar commands, but they will yield different results.  Both can be used to find information about Cmdlets among other help information, but Get-Help will return info on four different categories (Alias, Cmdlet, Provider, and HelpFile), whereas Get-Command returns information on six (Alias, Application, Function, Cmdlet, ExternalScript, and Filter).  It's important to keep these differences in mind as you search, since it will save you a bit of typing and reading by getting it right the first time.

### Get-Command

So let's get started punching some commands into Powershell!  First off, to list all commands available to you, you can simply type: Get-Command.  For a prettier list that will wait for you, you can choose to sort alphabetically by command type and name, by typing the following:

`PS C:\> Get-Command | sort commandtype,name | more`


But for now, let's stick with the basic "Get-Command".  You'll end up with something like the below picture, and feel free to press Ctrl+C as the text flies past...  it can go on for a while.

![Screen Shot 2016-02-23 at 10.44.20 AM](/images/poshdiscovery/powershell1.png)

With Get-Command (as well as Get-Help, which we will cover soon) one of the best ways to search is with wild cards.  Rather than scrolling through the entire list to look for a command we need, try putting a wild card before and after something close to what you need and you will find that it greatly narrows the results.  Look at what happens when we limit the results to any command that has "*PSSn* in it.

![Screen Shot 2016-02-23 at 10.50.47 AM](/images/poshdiscovery/powershell2.png)

It narrows the results to anything with PSSnapin as the noun.  Speaking of nouns...  Remember how Powershell has a verb-noun structure to it?  We can search using Get-Command and narrow it based on noun and verb.  We would get the same result as above if we used the command:

`PS C:\> Get-Command -Noun PSSnapin`

and we can also search for commands filtered by verb (though this will return a longer list) by typing something along the lines of:

`PS C:\> Get-Command -Verb Add`

### Get-Help

Now that we're able to discover the types of commands that are available to us, the next step is to find out exactly what they can do.  This is where Get-Help comes in.  For the Linux/Unix folks out there, you'll find these are very similar to the "man pages" for everything Powershell related (in fact, you can even evoke Get-Help by typing "man ___" the same way you would in your favorite distro).

As we mentioned earlier, we can still search with wildcards, and look at the difference between Get-Command and Get-Help in the following screenshot as we search again for *PSSn*:

![Screen Shot 2016-02-23 at 11.12.57 AM](/images/poshdiscovery/powershell3.png)

Now, rather than showing you the definition, or the parameters that you can use with each command, it gives you a brief description so you can know what each command does, as well as shows you that there's a help file describing the Powershell snap-ins.

Once we've identified a Cmdlet, HelpFile, Alias, or Provider that we would like more information on, we can use Get-Help to show us much more detail about that item.  For our example, let's use the Windows utility "dir" (which is really an Alias for Get-ChildItem):

![Screen Shot 2016-02-23 at 11.19.19 AM](/images/poshdiscovery/powershell4.png)

As you can see, by typing in "Get-Help dir", Powershell tells us that it is actually the function Get-ChildItem, gives us a description, and provides a list of parameters which we can use in combination with that function in order to get exactly what we want.

For those who are learning Powershell for the first time, the "Related Links" section will provide some interesting reading, as you'll easily be able to discover more functions and commands which are similar to the one you are currently reading about.

I'll be the first to admit that it's incredibly difficult to keep all the functions and all of their parameters straight - and thankfully Powershell is prepared for that.  If you add a "-full" to any Get-Help command, it will expand and provide you with examples and full descriptions of what each of the parameters is capable of.

I've copied in a snippet of what Powershell will return regarding parameters using the -full flag, but I encourage you to try running the following command on your own:

`PS C:\> Get-Help dir -full`

![Screen Shot 2016-02-23 at 11.30.11 AM](/images/poshdiscovery/powershell5.png)

And lastly, if you're running Powershell on your local machine and you're getting tired of the blue-on-white prompt, feel free to throw in a "-online" to whichever function you are using Get-Help on, and it will take you to the Microsoft Technet page for it, which may contain more up-to-date information.

This isn't the only way to use Get-Help, and I strongly encourage you to read around more and play with Powershell on your own to find which ways work best for you.  When I'm using Powershell, my pinky is practically glued to the Tab button to scroll through different options and to autocomplete the words I'm trying to type.  If you have any tips/tricks that helped you find how to learn Powershell from within the client, feel free to post a comment below!