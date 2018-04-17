---
layout: post
title:  "Stellar Exchange Toolkit - The Stellar Exchange Toolkit"
date:   2018-03-12
categories: Powershell automation exchange
tags: automation, exchange
---

Ok, so pardon my pun in the title, but I had the opportunity to review a product for a company called Stellar.  In particular, I'm looking at their [Stellar Exchange Toolkit](https://www.stellarinfo.com/email-tools/exchange-toolkit.php).  It's not often that I look to other tools to perform critical tasks around work, but in this case I made an exception.  There *are* times where you simply can't code something yourself - especially in the Exchange world.  This is where Stellar comes in.

On first launch, I'll admit the software doesn't look like much.  It gives you a few simple buttons, but I think that's part of the simplicity of this tool that I've come to respect.  As everyone knows, I'm a huge fan of automation.  I'm an even bigger fan when someone else writes the automations for me.  Let's take a look at what all this utility can do:

![Screen Shot 2018-03-12 at 04.18.20 PM](/images/stellar/GUI.jpg)

At a high level (and in order from left to right), the toolkit provides the following functions:
    * Corrupt Exchange database recovery
    * Converts mailboxes on the database to PST's
    * Converts OST files to PST's
    * Extracts mailboxes from the Exchange backup, and recovers those mailboxes.
    * Recovers of Exchange passwords


In the Exchange admin world, we've all run into a situation where at *least* one of these options would have saved us a headache and a Monday afternoon.  What's more interesting, though, is that even though the toolkit only provides 5 tools you can use them creatively enough to solve a host of common exchange admin problems.

Let's walk through a simple example of corrupt Exchange recovery using this tool.  We're talking worst-case-scenario all-alarms-ringing no-one-can-access-their-email style of example.

We'll start by finding the .EDB file for our Exchange environment.  Launching the `Stellar Phoenix Mailbox Exchange Recovery` tool, we're brought to this screen which will get us started.  

![Screen Shot 2018-03-12 at 04.35.15 PM](/images/stellar/Select.jpg)

Don't know where your EDB files are?  Don't worry, they've thought of that (just click "Find EDB")

Next, you get to choose between their quick or extensive scanning options.

![Screen Shot 2018-03-12 at 4.38.19 PM](/images/stellar/Scan.jpg)

Generally I'd recommend doing the quick scan if time is of the essence (and Stellar confirms that this will work in *most* cases of edb corruption), but if you have time to spare before everyone gets in the office, go ahead and run the extensive scan.

Once the scan is complete, you'll then be presented with all of the mailboxes that were recovered, and several options for them.  Not ready to recover the mailboxes quite yet?  No worries, you can save the scan that way you can return to the results pane later.

Assuming you are ready to start the recovery process, you're able to select the mailboxes or even individual emails you want to recover and save them in one of the following formats:

* PST
* MSG
* EML
* HTML
* RTF
* PDF
* O365

One thing to keep in mind though, you won't be able to save the attachments in the messages if you choose the HTML, RTF, or PDF formats.

Once you have the files in hand, you can deliver them to the end user and point their Outlook at the new mailbox file.  If end user support isn't your style, Stellar has thought of that, too, and you can export the mailbox file directly to the exchange server.  Next time your end user launches outlook, they should have their fully recovered mailbox available.

That wraps it up!  Stellar's exchange recovery suite wouldn't be necessary in an ideal world, but for when everything goes wrong, it's nice to know there is software out there that can save your bacon.

As always, let me know what you think, if you have any questions, or if you'd like me to explore more of the Stellar suite's options by tweeting at me: [@_brycemcdonald](http://www.twitter.com/_brycemcdonald)