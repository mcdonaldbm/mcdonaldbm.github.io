---
layout: post
title:  "Simple Logging Function"
date:   2016-12-05
categories: Powershell automation
tags: powershell, itpro, automation
---

So I was looking around for a very very simple function to verify where I was seeing errors in one of my scripts, and I couldn't find anything that looked and felt the way I wanted...  So I decided to write my own!

Other logging functions I saw were very complex, or very in-depth, and I just needed something that would allow me to put a log file wherever I wanted on the target computer, and then let myself write custom messages in my scripts to find out what exactly was going on.  For instance, when I was trying to force close outlook on a computer and Outlook wasn't closing, I just needed to know that THAT was the area of the script that was failing.  Same goes for when I was trying to remove a registry key.  If that key didn't exist, I needed to know that!  My function can be used fairly easily.  There are 3 different parameters you can give it.  Essentially I wanted something that could quickly and within 50 or so lines replace Write-Debug in my scripts and output to a file that I could view later.

So, quite simply, you can use my log writer like the below code:

`Write-Log -message "This is what I want my message to say" -LogLevel 'Warn'`

This will give a warning message of "This is what I want my message to say" in the default path of C:\log\my.log (this can be changed in the function or specified via the -LogPath parameter.

I'll post my simple logging code here, but you can also grab it from my [github.](http://github.com/mcdonaldbm/PS_Write-Log)

~~~~
function Write-Log {
    [CmdletBinding()]
    Param {
        [Parameter(Mandatory=$true,
            ValueFromPipielineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [Alias("LogContent")]
        [string]$message,
        # content of log

        [Parameter(Mandatory=$false)]
        [string]$LogPath = $MyInvocation.PSScriptRoot+"\Removal.log"

        [Parameter(Mandatory=$false)]
        [ValidateSet("Error","Warn","Info")]
        [string]$LogLevel="Info"
        # type of log entry
    }
    if (!$Logpath){
        New-Item $Logpath -Force -ItemType File
    }
    switch ($LogLevel) {
        'Error' (
            Write-Error $message
            $LevelText = 'ERROR:'
            }
        'Warn' {
            Write-Warning $message
            $LevelText = 'WARNING:'
            }
        'Info' {
            Write-Verbose $message
            $LevelText = 'INFO:'
            }
        }
    # Format Date
    $FormattedDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    # Write log entry
    "$FormattedDate $LevelText $Message" | Out-File -FilePath $LogPath -Append  
}
~~~~