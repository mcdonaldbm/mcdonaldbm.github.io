---
layout: post
title:  "Infrastructure Testing with Pester"
date:   2017-04-13
categories: Powershell pester
tags: powershell, itpro, automation, pester, testing, infrastructure
---

I just got back from the Powershell Summit 2017 conference in Seattle, and boy did it get my brain working.  There are lots of talented people in the community and the Summit is the place to meet them all, share ideas, and really wrack your brain trying to squeeze out useful information to help others on the bleeding edge of Powershell development and implementation.

One of the topics that came up very often was Pester.  At a high level, Pester is a testing framework for Powershell to help a developer make sure that their code is doing what they actually want it to do.  Once we apply the principles of Test Driven Development (TDD) to our code - that is, writing our tests to scaffold our code before we actually write the code - we end up with more modularized and more functional code.  This can then be applied to a pipeline to help automate coding releases within an organization.

Ok - now that you have a working knowledge of Pester, we can take a deeper dive into Infrastructure testing, what it means, and how you can use it most effectively in your organization.

### What is Infrastructure Testing

When I work on the operations side, I'm notorious for thinking "If there's no angry red text, then everything ran and executed perfectly."  I high five myself, go out and grab a beer, and call it a day.  Quite obviously, this is not a recommended best practice.  Infrastructure testing is acknowledging that errors can happen without red text, and the earlier we can identify a problem the less of an impact it will have on an organization.  

We can write tests for many things:
- to check if the VM I created had the correct network settings applied
- to make sure the NTFS permissions I ran a script to change actually got moved to what I want them to be
- to check and see if my software deployment is going well

The list goes on of course, but you can see where this becomes a very useful tool.  There are many ways to apply configurations anymore between GPO, DSC, Chef, Puppet, Azure Automations (this list goes on too!) but how do we know they're actually applying the configuration we want without going out and checking it ourselves?  We don't.

### What use is infrastructure testing?

I'm an evangelist for infrastructure testing in operations roles mostly for the automations it can assist with.  When I was troubleshooting a client's installation of software, having them run a simple Invoke-Pester cmdlet let me know they weren't using the right version of .NET seconds after starting the test.  Rather than having to walk this client through my checklist of "what might be going on" we were able to resolve their issue a minute after getting them on the phone.

Additionally, if you're hosting a VM and applying a DSC configuration, you can implement this type of Infrastructure Validation testing as part of your Continuous Integration / Continuous Deployment (CI/CD) pipeline.  That is a very deep topic and I will be discussing it in a later blog post.

### Let's see an example

Since I have the code handy, we'll go back to my example of checking to see if the version of .NET installed on a machine is the correct version.  Thankfully since Pester is a Domain Specific Language (DSL) this is fairly human-readable for Powershell.  For this example, I had written my describe block which I'm calling "Software Tests".  In the full code, I not only go through my context of Prerequisites, but I also query various aspects of the software in question (version number, whether or not all the registry keys are there, whether or not older registry keys exist, etc.).  For this example however, we just wanted to take a look at the version of .NET installed on the computer.  For this, we need to query the registry key in the Uninstall path correlating with Microsoft .NET, since that's where they decided to hide it.

In my testing I found that there were actually two ways of finding the version for .NET, depending on which version of .NET was installed on the machine.  I used the if/else statement to account for both methods of finding the version, applying the appropriate filters and coming back with a single digit, since the version required for the software I was installed simply needed to be greater than "4".

```
Describe 'Software Tests' {
	Context 'Prerequisites' {
		It "is using a good version of .NET" {
		            $NETFramework = Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Where-Object { $_.DisplayName -like '*Microsoft .NET Framework * SDK' }
		            
		            if ($NETFramework)
		            {
		                $NETVersion = (($NETFramework | Sort-Object -Property DisplayVersion -Descending)[0]).DisplayVersion
		            }
		            else
		            {
		                $NETFramework = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse | Get-ItemProperty -name Version, Release -EA 0 | Where { $_.PSChildName -match '^(?!S)\p{L}' } | Select PSChildName, Version, Release
		                $NETVersion = ($NETFramework | sort Version -Descending).Version[0]
		            }
		            $NETVersion | Should BeGreaterThan 4
		        }
	}
}
```

### Wrapup

In this article, I hope you learned a little more about Pester, Infrastructure testing, why you ought to do it, and you even saw an example of how you could use Pester to query for a .NET version on a machine.  The scripts and code in my posts could always be taken a few steps further, but I want you to use this as a launching point to write your own infrastructure tests!

As always, feel free to tweet at me [@_brycemcdonald](https;//twitter.com/_brycemcdonald) if you have any questions or suggestions for this post.  Thanks for reading!
