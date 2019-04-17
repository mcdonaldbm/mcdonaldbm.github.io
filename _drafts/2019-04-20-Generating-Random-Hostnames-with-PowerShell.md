---
layout: post
title:  "Generating Random Hostnames with PowerShell"
date:   2016-12-05
categories: Powershell automation
tags: powershell, itpro, automation
---

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

function Set-WordAsUsed {
    param (
        $usedWord
    )
    Write-Host "Setting word $word as used"
    (Get-Content "$PSScriptRoot\wordlist.txt") -replace $usedWord, "$usedWord `# used by $env:USER on $(Get-Date -format 'yyyy-MM-dd HH:mm:ss')" | Set-Content "$PSScriptRoot\wordlist.txt"
    Write-Host "Make sure to push to git!"
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
        $word | Set-WordAsUsed
    }
    else {
        Write-Host "Could not confirm, hostname not marked as used."
        Write-Host "Did not set $word `# used by $env:USER on $(Get-Date -format 'yyyy-MM-dd HH:mm:ss')"
        break
    }
}
```

_Can't get enough of me?  Be sure to follow me on Twitter_ [@_brycemcdonald](https://twitter.com/_brycemcdonald).

_Did you know I'm available for hire?  Contact me for details via twitter, email, or on the [NorthCode Solutions](http://www.northcodesolutions.com) website._