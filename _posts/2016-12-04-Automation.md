---
layout: post
title:  "Automation and the IT Balancing Act"
date:   2016-12-04
categories: Powershell automation
tags: powershell, itpro, automation
---

One of the things that drives me working as a System Administrator is the push and pull of my workload with the help of automation, and it's a subject I feel that not many administrators fully understand.

When I got my start in tech, it was as a Geek Squad agent (I could go into detail about being "that kid" who tore everything apart, figured out how to put it together or - better yet - figured out how to splice it together with something else, but I'm talking about making money).  When I viewed a problem, it was always in terms of one break deserves one fix.  I mean, it makes a lot of sense.  Something comes in, and I make it go out.  I worried about it just long enough to make the customer happy and send them on their merry way.  I'd then purge the memory banks, and welcome the next problem.  Not long after I started working there, though, I recognized that I was doing a lot of the same things over and over and over, and that got me thinking - What if I could figure out a way to do less?  That would give me a little more time for poking around on the internet, reading, doing homework, etc.

That's where scripting came in!  I could see it now.  A person would come up with an issue I'd seen a million times, then I'd take it to the back - sure to throw in a remark or two about how hard I'd have to work to make their problem go away.  In reality, I had already done the hard work and the script I wrote months ago was sitting on a flash drive ready to download and install the fix and restart the pertinent services.  Total time spent scripting: Maybe an hour?  Total time spent on what was previously a 5 minute fix: Maybe 3 seconds?  Time saved, money earned, and I'd use both of the aforementioned to clock out early and grab a drink.

Flash forward a few years to me being a desktop admin at a state University.  I wasn't only worried about the one customer, but a department of entry-level office support personnel.  Not only was I stressing about the break/fix issues, but also deployments, department specific apps, and technology instruction.  I didn't lose my love for scripting, though!  I tried to script as much as I could.  There was one instance in particular where a tiny subset of computers, I think 8, needed a few items added as bookmarks to Internet Explorer.  I strapped on my scripting hat and went to work.  My plan was to deploy the script through Group Policy as well, so I'd never even have to go up and touch the machines.  Ah, life was perfect!  All technology - no people - simply the best.....  Until about 4 hours later.  I was still working on the script.  The bookmarks were still not added.  I hadn't even started on the Group Policy to deploy the thing.  I sighed - I took a project that should have lasted maybe 10 minutes if I had just gone up there and done the work, and transformed it into a monster that it didn't deserve to be.  I was probably never going to use the script again, let alone deploy the group policy.  I closed out of my text editor and pressed "Don't Save", swearing I'd never try and script myself out of a one-off, "10 minutes or less" situation ever again.

This got a few of the other IT Managers and I talking.  When is it wise to automate something?  When is it dumb?  Each one of us had personal accounts of when we all had scripted something we shouldn't have, and didn't script something when we needed to. The "common sense" behind automation can elude a lot of us because we are natural tinkerers, that's what got us into our field in the first place.  This instinct can trap us into spending more time trying to get something to work than we can afford.  At the end of the discussion, we generally agreed on the following:

Automation is good when:
	• You have a task you do daily/weekly/monthly/annually.
	• It takes you about as much time to script as it will eventually save you time.
	• It prevents a task from becoming an interruption (antivirus reports, deployment statistics, and the like)

Automation is dumb when:
	• It's something you're only going to need to do once.
	• You can do it in minutes, but it takes hours and hours to script.
	• The technologies involved are about to change (spent bunches of time working to get PHP and MySQL working on a Windows box when we were migrating those web pages to Linux in the next couple of weeks).

A lot of what I cover in my blog - and will continue to cover - is automation, mostly because after years in the field I've learned to get as much (buzzword incoming) return on investment of my time as possible.  It's a skill lots of IT folks lack because they don't look at the big picture, and consider their work done when the clock strikes 5.  Next week I'll be diving into the log analyzer "Splunk" and writing a script as well as a few queries to warn my team of potential compromised accounts breaching our contracts with databases we subscribe to.
