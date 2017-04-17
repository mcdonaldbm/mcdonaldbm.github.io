---
layout: post
title:  "Powershell Summit 2017 Recap"
date:   2017-04-15
categories: Powershell automation exchange summit
tags: powershell, itpro, automation, summit
---

I'd really like to start this post off by giving a HUGE thank you to the Powershell.org team.  They're incredibly inspirational with how much time and effort that they pour into the community, and because of that I've renewed my resolve to get back to blogging and delivering as much content as I possibly can.  I wanted to give a quick and dirty rundown of the sessions I attended and what I was able to take away.

### Sunday - PreConference

#### Introducing the Powershell Github Repository

Sunday opened up with an amazing talk by Adam Driscoll.  As we all know, Powershell got open-sourced recently.  What we all *don't* know is how to contribute to further Powershell development.  In his talk he walked us through how to contribute to the Powershell repo, and took it one step further by walking over the contribution guidelines.  Everything must meet a certain quality standard if it stands a chance of being implemented into the next version of Powershell.

My takeaways from this first talk were very simple.  I need to get a LOT better at unit testing my code, and writing my code with the tried and true Test Driven Development methodology.  You'll notice this becoming a recurring theme - and I'm starting to appreciate it as well.

#### Unit Testing and Pester A to Z

Adam Bertram was supposed to lead this talk, but he unfortunately was unable to.  Thankfully, Don Jones - co-author of the Pester book - led the talk and walked what seemed to be the entire conference through why Unit testing is important and why we all ought to be doing it.  I'm glad I wasn't the only one who didn't raise their hand when asked "How many of you currently use Pester for Unit Testing?".

I had written several infrastructure tests before, and I've always found these were very easy to write because they were all tangible.  Unit tests, on the other hand, seem to be much more incorporeal to me.  Testing logic, testing functions, mocking calls...  I would sit down and try and write a unit test but never know where to begin.  This talk taught me how to think it through.  You don't have to test individual cmdlets (especially not the ones you didn't write!) what you're trying to test is your logic and whether or not it is correct.  That one sentence has entirely changed my future with unit testing.  Huge thanks to Don for that.

### Monday - Single Track

Monday was nice because it is rare that I get to hear about Powershell at an administrative level.  Mostly when I talk about Powershell, it's when I'm trying to convince others on the team that it's the right tool for the job.  The other times are when I'm in user groups or answering questions on forums but then it becomes an echo chamber on how great Powershell is.  From this, I was able to garner a lot of insight into what is going on for the future of Powershell and it is all *very* exciting.

#### State of the Community

Don led this talk as the keynote speaker.  The numbers of users behind Powershell were presented and they were just baffling.  Granted, I've only been using Powershell a little over four years myself, but the community has come so far in those few years.  From everything we would hear for the rest of the day, I was certain that we would only continue to grow the community.  A few other short snippets - Powershell.org is going to start helping folks start up User Groups and create a mentorship program for folks who want to develop what they call "Powershell Saturdays".  PSSaturdays are basically mini conferences held for your local area to encourage collaboration and participation with Powershell.

#### AMA with Jeff Snover

Jeff is obviously a genius, and it showed in his talk.  We got to hear the "how" and "why" behind his decisions with the direction he took Powershell, and where he is going from here.  [Brian Bunke](https://twitter.com/brianbunke) made a great writeup of the entire AMA and posted it to reddit and his [personal blog.](http://www.brianbunke.com/blog/2017/04/11/snover-ama/)

#### State of the Shell (Led by the Powershell Team)

It's one thing for a community to take a product and run with it, but it's another thing entirely for a company to recognize that, listen to the community, and update their business strategies in response to it.  Huge kudos for Microsoft, Azure, and the Powershell team for being able to listen, respond, and adapt to the needs of IT pros everywhere.  I didn't realize this - but in Seattle Microsoft has made their own bus systems to bring their employees to/from work.  For Microsoft to keep a company that big as agile as they are is absolutely astounding.  I can't wait to see what the future has in store for them.

#### Powershell Team Lightning Demos

We were included under the "Friend-DA" here...  but needless to say there are lots of really awesome things coming down the pipe with Powershell 6, VSCode, and more.

### Tuesday - Triple Track with Side Sessions

After a rousing bout of drinking with the guys from the conference, we all pulled it together and headed back in to the conference center for more talks.  Tuesday was great because it was broken out into multiple sessions so you could pick and choose what you wanted your focus to be.  I was staring at my program when I entered the elevator (still a little groggy, I'll be honest).  A couple started talking to me and I gave a couple of half-assed replies to be polite until I looked up.  Sure enough it was the Scripting Guy and the Scripting Wife!  This conference keeps you on your toes, since technical celebrities are everywhere!

#### TDD, Chef, and Pester

Robb Schiefer let this talk and it really started opening my eyes again to the CI/CD pipeline, and how it should be used in production.  For the most part at my current job, I write a lot of proof of concept code or Test/QA type code...  and I never really take it all the way.  With this talk, Robb challenged me to dig deeper and create the production level code, even when my job doesn't necessarily call for it.

#### Side Session - DSC Security

Here I got to listen to Microsoft's very own Zachary Alexander give us a presentation on how he implements DSC configurations based on Microsoft's security templates!  This was incredibly impressive even though his demo wasn't working 100% (RIP Demo) but he was able to take Microsoft's Security baselines in a .json format, convert them to a DSC configuration, then apply them all at the touch of a few cmdlets.  As a Sysadmin/scripting guy who has an emphasis in security this demo was among my favorite for the journey.

#### Side Session - Powershell Saturday

This was a general Q&A with Don on how we can host our own Powershell Saturday.  Powershell.org is going to take a very heavy hand in ensuring that Powershell Saturdays happen all across the nation!  We need to start with a business plan and get in contact with the folks there, but they will help give us the resources we need to get them started.  I'm taking this information and working toward helping locals in Kansas City and Saint Louis make a PSSaturday to be proud of.

#### Manage Azure Web Apps with Visual Studio and Powershell

One of the themes I noticed during the talks is that Azure is going to be a very important part of keeping up with DevOps and Automation to scale.  Tim Warner led this talk and pointed me in the direction of Azure for a work app that we are working on.  With Azure, there are several options for automations, but more importantly I learned about Azure Functions, which lets you run small pieces of code in the cloud.  I'm excited to see this relatively new technology catch on as a critical component of businesses infrastructure.

#### PKI - Not the snoozefest you'd expect

The PKI talk was particularly interesting to me.  As someone who has set up PKI infrastructure and performed a penetration test against it, it is refreshing to see that Missy Januzko is taking on the tough task of creating a DSC script to automate the whole thing.  Manually, a PKI setup is a nightmare.  I'd link a blog post here which would show how to set one up, but it may drive away the few readers I actually get so you'll just have to trust me.  She showed off the work she has done on the PKI aspects of Powershell DSC, then walked us through her setup.  I can only hope that someday I'm as skilled at authoring DSC resources as she is.

### Wednesday - Panels and Discussions

It wouldn't be a technology conference without more drinking.  I was slightly more groggy going into the Wednesday lectures and panels, but they were riveting nonetheless.  Again, with about a gallon of coffee in me I was able to take some notes and pay attention.

#### How Azure Automation Solves Key Powershell Challenges

Led by the Azure Powershell team, we discussed what you can automate with Powershell in Azure.  We discussed all the different options, between functions, workflows, and using DSC with Azure to keep your code and infrastructure scaling the way it needs to.

#### Debugging Powershell and Defensive Scripting Techniques

I had done some debugging with other code before, but I don't think I've taken the time to sit down and officially debug my Powershell code... well...  ever!  In this talk, we discussed ways to step through your code and ways to help your efficiency with debugging.  For the most part, I had only looked at any red text generated and used that to inform my next steps to "debug" my Powershell.  I'm going to be writing a blog post on this in the near future, since a lot of the discussion was very in depth and interesting and VERY useful to the community.

#### What makes a good shared Powershell Module

I've never talked about Powershell documentation as heavily until this.  More than just structure and syntax, we took it further and discussed what should be present in your help files.   The most memorable parts of the discussion were around the SYNOPSIS sections of the Powershell help files.  I'm more than guilty of using the verb-noun structure to define what my function does.  "Verb-Noun is a function that verbs the noun" has come up more than a few times for me.  What ended up being discussed is that a SYNOPSIS should be no longer than a tweet.  Pretty effective talk if you ask me.

#### Community Lightning Demos

I met a gentleman named Mike who is significantly better at tweeting than I am, and if you look in his [twitter feed](https://twitter.com/barbariankb) back to April 12 2017, he tweeted every single lightning demo and the user doing the demo.  Awesome guy, and amazing record keeping!

#### Powershell in the Real World (Panel)

Lots of blogging ideas came out of this session.  We had the opportunity to discuss in a panel style the issues we were dealing with in the real world.  From this, I'll be making the following blog posts in the near future:
- Filtering to the left to increase remote command performance
- How to manage multiple versions of Powershell (i.e. Powershell 2 and 5 in the same environment)
- How to manage a network without PS Remoting (PSExec)
- Writing code to scale
- Secure credential management in Powershell code

### Thursday - Homeward Bound

And that was it...  Thursday was my travel day back to Kansas City.  Lots of work got done on the plane.  A couple blog posts, a few unit tests, and many many many ideas written down.  Thursday was my day to really take the reigns from the rock stars who presented at the conference.  Now it's my turn to start giving back.

As always, feel free to tweet at me [@_brycemcdonald](https;//twitter.com/_brycemcdonald) if you have any questions or suggestions for this post.  Thanks for reading!