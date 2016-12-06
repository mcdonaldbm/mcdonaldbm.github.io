---
layout: post
title:  "Large Exchange Test Environment (Part 1)"
date:   2016-12-06
categories: Powershell automation exchange
tags: powershell, itpro, automation, exchange, remoting
---

Recently I was tasked with a really fun problem that I thought would be fun to blog about.  This'll be a multipart blog since I'll cover each bit of this task in depth

### The Problem

Essentially, I have to create a fake exchange environment full of dummy users to test a plugin.  Fortunately for me, I don't have to build the test environment from the ground up since my IT group already had something created.  Unfortunately for me, that means I can't run rampant through the environment. I won't be able to do anything like this, this time around...  ![I'm gonna wreck it!](/images/exchangetest1.gif)

In my case, I needed more than 350 THOUSAND users (ideally 500k+) and a ton of distribution lists.  This sounded like a perfect opportunity to write a Powershell script to solve the task at hand.

### The Steps

Laying out my steps to complete the project, I would need to do the following

* **Using Powershell Remoting, be able to control the remote computer**\
* Create the list of users and distribution lists I need to create in the exchange environment\
* Actually create the entries in the GAL\
* Run all tests the project was created for\
* Clean up the test environment\
	

### Powershell Remoting

There are a few subtasks within Powershell Remoting that will need to take place in order for my remote connection to the server to work.

First, I need to be able to get the credentials for the remote computer in a secure manner.  Thankfully, Powershell has a nice built in function for this called "Get-Credential"

In my script, I go ahead and set it equal to a variable so I can call it later.

`$creds = Get-Credential`

That was nice and easy.  Now I need to remote into the Exchange server…  This'll be a little more tricky, since I have a couple of things I need to specify.  Again, I'll set this session to a variable that way I can use it in my script.  I need to set the type of configuration, specify the URL of the remote server, Import my credentials, and have a few other options selected for my session variable to work.  Then, using New-PSSession I create the session object to use in my script.

`$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionURI [URI for Exchange connection] -Credential $creds -Authentication Basic -AllowRedirection`

Now, with the session and credentials set up properly, I can go ahead and enter my remote session to exchange.

`Import-PSSession $session`

Once I'm in my session, Powershell will behave as though I'm on that computer.  Well...  for the most part.

Now that I've connected to the remote computer, we can start getting to work on creating the list of dummy users for the exchange environment, that way we actually have something to retrieve.