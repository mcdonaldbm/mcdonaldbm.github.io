---
layout: post
title:  "Generating Random Hostnames with PowerShell"
date:   2019-05-01
categories: Powershell automation
tags: powershell, itpro, automation
---

So my team and I, we generate a *significant* number of virtual machines in any given time period.  One of the things we usually struggle to do is to name our machines something unique.  For the most part, we don't care exactly what we are creating is named, we just care that the name is unique.  Of course, we have DNS and our netowrking configured in the environment to route traffic to more friendly names, but we still need to name all of our virtual machines.

The way we decided to tackle this, is by generating a random word from a big, long list.  If we could grab a word from this list and mark it as used, we'd be sure to not step on each others toes when selecting our hostnames.  Additionally, we can provision multiple machines with a similar name in different environments by using a prefix such as `prd`, `stg` or `dev`.  This way, we can be sure to relate our virtual machines to each other, as well as have a simple view of which machine belongs where.  This would give us plenty of runway to spin up new machines every day and still not run out of names.  I threw together a simple PowerShell script to be able to take a random word from the list, mark the word as "used", and note who used it and when.  For your convenience, I've shared the script below.  If you're interested in using this script in an environment, I've also uploaded the script and a sample word list to GitHub, which you can find [in this repository](https://github.com/mcdonaldbm/PS_Random_Hostname_Generator).


```PowerShell
#############################################################
#                                                           #
# Random Hostname Generator                                 #
# Written by Bryce McDonald                                 #
# Modified from random-hostname.pl by John Petrucci         #
#                                                           #
# Usage:                                                    #
# PS> .\random-hostname.ps1 -number X                       #
# X = number of hostnames you want returned, default is 1   #
#                                                           #
#############################################################
Param(
    $number="1"
)

#region functions
function Get-AvailableWords {
    $filter = '#'
    $AvailableWords = Get-Content -Path "$PSScriptRoot\wordlist.txt" | Select-String -pattern $filter -NotMatch
    Write-Output $AvailableWords
}

function Get-RandomWordIndex {
    Param(
        $Maximum
    )
    $index = Get-Random -Maximum $Maximum
    if ($index -gt 0) {
        $index = $index - 1
    }
    return $index
}

#endregion

For ($i=0; $i -lt $number; $i++ ){
    $wordlist = Get-AvailableWords
    $index = Get-RandomWordIndex -Maximum $($wordlist.count)
    $word = $wordlist[$index]
    Write-Host "-------------------------"
    Write-Host "You've selected: $word"
    Write-Host "-------------------------"
    $confirmation = Read-Host "Are you sure you'd like to proceed?  This will mark the word as used. [y/n]"
    if ($confirmation -like "y") {
        $fulllist = (Get-Content "$PSScriptRoot\wordlist.txt")
        $wordindex = $fulllist.indexof("$word")
        $fulllist[$wordindex] = "$word `# used by $env:USER on $(Get-Date -format 'yyyy-MM-dd HH:mm:ss')"
        $fulllist | Set-Content "$PSScriptRoot\wordlist.txt"
    }
    else {
        Write-Host "Could not confirm, hostname not marked as used."
        Write-Host "Did not set $word `# used by $env:USER on $(Get-Date -format 'yyyy-MM-dd HH:mm:ss')"
        break
    }
}
```

_Can't get enough of me?  Be sure to follow me on Twitter_ [@_brycemcdonald](https://twitter.com/_brycemcdonald).

_Did you know I have a company available for hire?  Contact me for details via twitter, email, or on the [NorthCode Solutions](http://www.northcodesolutions.com) website._