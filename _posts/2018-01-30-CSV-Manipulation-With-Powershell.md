---
layout: post
title:  "CSV Manipulation with Powershell"
date:   2018-01-30
categories: Powershell automation exchange
tags: powershell, itpro, automation, sql, csv
---

Recently I was given a pretty fun task.  I had to import a CSV into an ETL tool to change a whole bunch of values in a database.  Normally when I say "a whole bunch" I mean something along the lines of a few thousand or a few hundred, right?  Well...  In this case, I'm talking 5.5 million database records.  Before we get too far ahead of ourselves, lets get some background on this task.

## What's ETL anyway?

ETL stands for "Extract, Transform, Load" and is a pretty common database term.  I'm definitely not the best at database management or manipulation, but in essence what this process does is pulls out the records you're looking to change, changes those records, and then shoves them back into the database.  There are lots of options for doing this, but for me I am using [Pentaho's Data Integration tool, Spoon](http://www.pentaho.com/product/data-integration) on an Oracle SQL database.

### Extract

For the extract portion of the command, I'm taking a SQL query selecting all of a record with the "date" field in a particular format, and exporting it to a CSV.  Easy peasy.

### Transform

For this step, I'm taking one of the date fields in a record, and modifying it to fit a MM/DD/YYYY format, where it was originally in a DD/MM/YYYY format.  Not a difficult change, but definitely one that needs to happen.

### Load

This is where I started running into problems.  Using Spoon, I didn't have a problem extracting or performing the transform steps.  I did have an issue with the amount of available memory in Java, though, after trying to load all 5.5 million records.  Options here?  Well, I could use a different tool for the load process, I could try and script something with powershell and make sure I did all the steps just right, or I could crack the CSV open and split it into a few smaller parts.  Of all my options, I thought that sounded the easiest.

## Using CSV's with Powershell

Powershell gives us a few options for handling CSV's.  Because of it's object-oriented nature, we can use a few simple cmdlets specificially made for CSV's which allow us to treat them like objects.  `Import-CSV` and `Export-CSV` will handle most of the work for us in handling the object itself, but we'll still need to know what we're doing with it once it's in object form.

I've included my script below, and you can feel free to use it.  I find the script is pretty self explanatory, but in short it will take a CSV, count the lines, then based on how many CSV's you want to export, it will do the math on how many rows need to go in each and export them.

Unfortunately with the Import and Export of the objects, if the file size gets too large it can cause some memory issues and I'm going to work on those in a future version of the script.  For now, though, it should be able to chunk through a 5.5 million row CSV without too many issues.

```
function Split-CSV
{
    [CmdletBinding()]
    Param
    (
        # Path to CSV
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $Path,

        # Number of CSV's to export, exports an even number of rows in each CSV
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        $NumExported
    )
    
    $csvPath = Get-ChildItem $Path

    # Get number of lines in CSV
    # Using this instead of Import-CSV | Measure-Object.  Much faster to read from stream than object
    [int]$LinesInFile = 0
    $reader = New-Object IO.StreamReader "$csvPath"
    while ($reader.ReadLine() -ne $null)
        {
        $LinesInFile++
    }
    $reader.Dispose()

    # Get number of lines per exported CSV
    $rowsper = [Math]::Round($LinesInFile/$NumExported)

    # Get path's parent to use for CSV export
    $parent = (Get-Item $csvPath).DirectoryName
    $basename = (Get-Item $csvPath).BaseName

    # Set initial values before the for loop that creates the export CSV's
    $counter = 0
    $startrow = 0

    $csv = Import-CSV $csvPath

    for ($i=0; $i -lt $NumExported; $i++) {
        $csv | Select-Object -Skip $startrow -First $rowsper | Export-CSV "$parent\$basename$counter.csv" -NoTypeInformation
        $startrow = $startrow + $rowsper
        $counter++
    }
}
```

As always any comments/complaints are always accepted via my social media - have a good day!