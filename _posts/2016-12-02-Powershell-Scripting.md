---
layout: post
title:  "Powershell Discovery with Get-Command and Get-Help"
date:   2016-12-01
categories: Powershell automation
tags: powershell, itpro, automation
---

At the University we are a weird mix of centralized and decentralized IT support.  A lot of times this means I don't have all of the access I need in order to find all the information I want, but with a little creativity I can get around the roadblocks that centralized IT has in place.

One of these areas that can be difficult to get around is in regards to Active Directory.  We have a large number of user accounts that belong to people as well as departments, and it can be tricky keeping all of them straight.  For our standard user accounts they are set to expire every year, and a password reset will extend the duration for another year.  For department user accounts, however, this is not the case.  Couple that with the fact that we have a large volume of department accounts and all of the annual renewal requests come to me, I typically automatically renew the account with no regard to whether or not it is actually being used.  That was the behavior of my department for a decade before me, so needless to say we have a mess on our hands, and are in dire need of an account audit.

I'm not a fan of doing things more than once, so scripting this audit to be automated and something my team can repeat every year simply and efficiently is my goal.  Since Powershell has an ActiveDirectory module, it's the obvious choice for use here.  First thing we have to do is import the AD module into Powershell so we can take advantage of the "Get-ADUser" function.  I also usually start with the "Get-Help Get-ADUser" command as well, so I can be refreshed on what all we can do inside AD with Powershell.

`PS C:\> Import-Module ActiveDirectory`
`PS C:\> Get-Help Get-ADUser`

So my first challenge was trying to get my list of department accounts.  In fact, I wouldn't mind getting a list of all accounts that belonged to my apartment.  Thankfully, Get-ADUser has the "-Filter" parameter, which we can use to our advantage.  Before that, though, I need to figure out what the central IT group is calling my department, since it can be typed in many different ways.  Let's try looking up information about myself first:

`PS C:\> Get-ADUser -Identity <myusername> -Properties *`

That ought to do the trick!  Turns out my department name is "Libraries".  I'm also going to make a mental note of all the information that the "-Properties *" flag returned, so I can pull it up later.  Let's see if we can filter results with my department name, and hopefully I can see all of my accounts, and I know that we have about 150 users and 70 department accounts.  Since I don't need all of the information about everyone, let's just return the names of the accounts so I can spot if it's right at all.

`PS C:\> Get-ADUser -Filter 'Department -Like "Libraries"' -Properties Name`

Uh oh...  not good.  6 results.  Out of ~220 that I'm supposed to get.  Looks like we're going to need to widen the search a bit, and this time wildcards will come in handy.  I tried a couple of manual searches with a few of the account names I know with the "-I" flag enabled to specify the account, and it turns out we had a ton of different entries in the "department" field.  Library, Libraries, the name of each specific library, etc.  Narrowing it down to what the department names have in common, I could run the following search (I also wanted it to return the Department property so I could see how many variations of this there are):

`PS C:\> Get-ADUser -Filter 'Department -Like "*librar*"' -Properties Name,Department`

Much better!  Now I got...  uh oh again...  260 results.  But why?  Thankfully I had enabled that "Department" property to be returned, and I could quickly see that a few of the results were from the Law Library, which doesn't fall under my scope.  This got me thinking more.  I really don't need my user accounts, just my resource accounts.  I popped a few of each into the request, again using the -I flag, and I came to discover that our department accounts don't have a phone number listed whereas user accounts did!  As it also turned out, my results didn't return any department account values for the Law Library, so I lucked out there.  With the addition of one more flag "-And" and with a filter for a null value in phone number, I might be able to narrow it down to just my department's accounts.  I turned to brackets and parenthesis to get the filter right, because quotation marks and apostrophes next to each other give me a headache:

`PS C:\> Get-ADUser -Filter {(Department -Like "*librar*") -And (OfficePhone -NotLike "*")} -Properties Name,Department`

Blast - only 50 results this time.  I was spending too much time trying to figure out the precise right way to hammer the filter into something usable, when there was another way around the problem.  The central IT group on campus has a website that lists all of the accounts registered to a department.  To be honest, I have no idea how they get that information, given the variety of different names in AD, but I'll accept that it's there.  I logged into the website, filtered to department accounts, and copied all of the data into a CSV.  Surely I could import this data into Powershell and get what I want.  Time to bust out good ol' Powershell IDE to make it all a little easier to work with.  Now we'd also need to define a variable and pop it into a "foreach" command to return results for all of the accounts (I'll also skip past the debugging section - pulling the account list from the website added random spaces before or after accounts so I countered that with the ".Trim" and the Format-Table returned results the way I wanted them to look):

~~~~
# Make sure Active Directory is available
Import-Module ActiveDirectory
# Define where the list of resource accounts are and add Header so we can call on the data
$csv = Import-Csv C:\departmentaccountlist.csv -Header Name
# For each user in the line, collect properties and put them in a table with their Name, department, and last log on date.
foreach ($line in $csv) {
    Get-ADUser -I $line.Name.Trim() -properties * | Format-Table Name,Department,LastLogonDate
}
~~~~

Much better!  Only one problem though...  It returns a list of about 70 one-line tables, and I'd like to be able to output it to one table, and filter it further based on LastLogonDate.  Since I know the AD module and CSV imports are working, I'm just going to manipulate how information gets processed, by bringing the Format-Table out from behind the brackets, and by assigning a variable to the result of the foreach statement, as seen below:

~~~~
$results = foreach ($line in $csv) {
    Get-ADUser -I $line.Name.Trim() -properties *
    }
$results | Format-Table Name,Department,LastLogonDate
~~~~

And voila!  Now that we have something worth working with, we can switch "Format-Table" with "Select-Object" and pipe that output into "Export-Csv" in order to get a file that we can manipulate further.  The final script looks like the following:

~~~~
# Make sure Active Directory is available
Import-Module ActiveDirectory
# Define where the list of resource accounts are
$csv = Import-Csv c:\resourceaccountlist.csv -Header Name
# Store results of each request in a variable, calling and sorting them before exporting to a csv.
$results = foreach ($line in $csv) {
    Get-ADUser -I $line.Name.Trim() -properties *
    }
$results | Select-Object SamAccountName,Department,LastLogonDate | Export-Csv -path C:\formattedlist.csv
~~~~

It outputs a .csv where I specified, and I can manipulate the .csv even further if I wanted to.  For now, I'm fine sorting by the last logon date - and it looks like I've come up with ~25 accounts that haven't logged in for over a year.  Time to contact those departments and see if I can delete their accounts!  I'll also save this in my departments "scripts" folder, so we can perform this type of audit in the future.
 
As always, if you see an area where you would have done something different, feel free to comment below and let me know how you'd do it - there's always something we can learn from each other.