---
layout: post
title:  "Search Files with Powershell"
date:   2016-04-15
categories: Powershell automation
tags: powershell, itpro, automation
---

It's not uncommon for me to be editing a document or creating a draft and completely forget where I stored the file.  If you're anything like me, you'll spend minutes, hours, sometimes days racking your brain trying to figure out where that file is.  Thankfully, one of these times I decided to let Powershell do the work for me, rather than aimlessly click through my dropbox.

### The Cmdlets

For starters, we'll use two main cmdlets to find what we're looking for.  Used correctly, they can be a powerful search tool for our storage systems.  The first cmdlet is "Get-ChildItem".

Get-ChildItem has a few paramters we can use to begin our search.
- Path
- Include
- Exclude
- Recurse

The -Path parameter will help us narrow down about where we stored the file we're thinking about.  For instance, if we know that our files are located somewhere in Dropbox, we can specify that from the start.

The -Include variable will let you create a "whitelist" of items that are returned.  Wildcards are allowed in the include parameter, so something like the following: `Get-ChildItem -Path C:\ -Recurse -include *.docx` will return all "docx" Word files on the C drive.

Exclude will not allow certain items to be returned in your search.  Similarly, this can be used to filter our results at the Get-ChildItem level.  If we remember that the file we're looking for does not have "draft" in the name, we can expand on our search to remove all items containing that like so: `Get-ChildItem -Path C:\ -Recurse -include *.docx -exclude *draft*`

The next cmdlet that will be essential for us to search for our files is the "Where-Object" cmdlet.  This will help us filter additional criteria that Get-ChildItem returns but can't filter by.  Where-Object includes many operators which we can use to increase the accuracy of our results.

The particular property that I am interested in is the "LastWriteTime" property.  Many times I'll know about *when* I modified a file rather than the name.  If I know about when, we can tack on another filter and look at the last modified date of the file.  Let's suppose that I know I modified a file in the last week.  Our code now looks like this:

```
$date = Get-Date # This stores todays date in a variable
$date = $date.AddDays(-7) # This modifies the stored date to one week ago
Get-ChildItem -Path C:\ -Recurse -include *.docx -exclude *draft* | Where-Object { $_.LastWriteTime -gt $date }
```

Now that we have a good filter, we are able to make progress in finding the file!

### Best Practices

There's a concept in using cmdlets like Where-Object and Select-Object that is often talked about but rarely discussed in depth.  The general best practice is to "filter to the left" meaning that the fewer items we return in our initial query, the fewer items we will have to filter out in other means. For instance, running our script like this: 

```
Get-ChildItem -Path C:\ -Recurse | Where-Object { $_.LastWriteTime -gt $date -AND $_.Name -like "*.docx" }
```

is going to be much more slow than the code we wrote previously.  This method returns *all* items, then filters them out property by property, looping through everything that was returned.  If we were to push our filters further left - that means by using the filtering properties of Get-ChildItem in the initial return - we are able to vastly improve performance.  Measure-Command will show us the difference in results as shown below:

```
PS C:\Users\Bryce.McDonald> Measure-Command {Get-ChildItem C:\Users\Bryce.McDonald\Documents -Recurse -include *.docx -exclude | Where-Object { $_.LastWriteTime -gt $date } }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 347
Ticks             : 3474863
TotalDays         : 4.02183217592593E-06
TotalHours        : 9.65239722222222E-05
TotalMinutes      : 0.00579143833333333
TotalSeconds      : 0.3474863
TotalMilliseconds : 347.4863
```

So our "Left Filtered" command only took 347 milliseconds, let's see how the right filtered command did:

```
PS C:\Users\Bryce.McDonald> Measure-Command {Get-ChildItem C:\Users\Bryce.McDonald\Documents -Recurse | Where-Object {$_.LastWriteTime -gt $date -and $_.Name -like "*.docx"} }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 465
Ticks             : 4655213
TotalDays         : 5.38797800925926E-06
TotalHours        : 0.000129311472222222
TotalMinutes      : 0.00775868833333333
TotalSeconds      : 0.4655213
TotalMilliseconds : 465.5213
```

The results speak for themselves, and this was a relatively quick and simple query.  Imagine if we had to search through gigabytes and gigabytes of files!

### Putting it all together

Now that we have a well crafted command, we can wrap it all in a function in order to easily call this search in a much easier way to type.  With a few useful optional parameters we can reconstruct the queries we were using previously.  The full code can be found [on my github.](https://github.com/mcdonaldbm/PS_Toolkit/blob/master/Find-Files.ps1)

If you have any questions or comments, please leave them below or contact me on twitter [@_brycemcdonald](http://www.twitter.com/_brycemcdonald)