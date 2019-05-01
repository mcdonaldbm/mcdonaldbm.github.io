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