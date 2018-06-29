---
layout: post
title:  "Configuring AWS CloudWatch with PowerShell"
date:   2018-06-18
categories: Powershell automation
tags: powershell
---

Amazon's CloudWatch is a powerful AWS service which monitors deployed systems, and can respond with alerts or even react by calling another AWS service.  CloudWatch alarm creation is typically done via the AWS Management Console, but today I'm going to show you how to configure an alarm yourself.  When you're talking about automating deployments of entire environments, scripting your CloudWatch alarm's creation becomes necessary especially as the environment increases in complexity and scope.  In this article, we'll discuss how to create CloudWatch alarms with PowerShell.

## Prerequisites

The scope of this article will be limited to configuring CloudWatch.  That being said, we do have a few prerequisites to getting started if you want to follow along:

* AWS PowerShell installed and configured
* AWS Resource to monitor with CloudWatch (EC2 instance, Fargate Cluster, etc.)
* IAM user and SNS topic created
* Identified target to monitor
  * Although these are usually compute resources, you can also monitor items like S3, or Billing

## Creating an Alarm

To create an alarm with PowerShell, we can use the `Write-CWMetricAlarm` cmdlet provided by the AWS PowerShell module.  This will create an alarm (or update it, if the alarm already exists) and associates the alarm with the specified metric.

### [Read the full article on 4SysOps](https://4sysops.com/archives/configuring-cloudwatch-with-powershell/)

_Can't get enough of me?  Be sure to follow me on Twitter_ [@_brycemcdonald](https://twitter.com/_brycemcdonald). _You can also check out my book on PowerShell and AWS [by clicking here](https://leanpub.com/awspowershell)_

_Did you know I'm available for hire?  Contact me for details via twitter, email, or on the [NorthCode Solutions](http://www.northcodesolutions.com) website._