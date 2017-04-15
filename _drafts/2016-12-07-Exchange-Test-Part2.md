---
layout: post
title:  "Large Exchange Test Environment (Part 2)"
date:   2016-12-13
categories: Powershell automation exchange
tags: powershell, itpro, automation, exchange, remoting
---

Recently I was tasked with a really fun problem that I thought would be fun to blog about.  This'll be a multipart blog since I'll cover each bit of this task in depth

### The Problem

Essentially, I have to create a fake exchange environment full of dummy users to test a plugin.  Fortunately for me, I don't have to build the test environment from the ground up since my IT group already had something created.  Unfortunately for me, that means I can't run rampant through the environment. I won't be able to do anything like this, this time around...  ![I'm gonna wreck it!](/images/exchangetest1.gif)

In my case, I needed more than 350 THOUSAND users (ideally 500k+) and a ton of distribution lists.  This sounded like a perfect opportunity to write a series of Powershell scripts to solve the task at hand.

### The Steps

Laying out my steps to complete the project, I would need to do the following

* Using Powershell Remoting, be able to control the remote computer
* **Create the list of users and distribution lists I need to create in the exchange environment**
* Actually create the entries in the GAL
* Run all tests the project was created for
* Clean up the test environment
	
### CSV Creation In Powershell

So the next step in the process is to create a cSV full of junk users that we can query.  A few google searches showed nothing in regards to large CSV's of bogus users that I could import, so I figured this was another job that Powershell could help us tackle.

CSV creation is a bit of a beast in Powershell, particularly when it comes to formatting your data to be displayed properly (this is also something I regularly struggle with because I'm simply not good at it).

For this task, I debated for a little while on whether I wanted to create a script or a function to complete this.  I wouldn't be doing this very many times, but I did want an easy way to generate a good number of CSV's and potentially re-use this solution later on.  I ended up settling on a function solely because I may want to re-use this solution or go back and improve it at a later date, though for the purpose of generating a csv this could be completed just as easily as a script.

