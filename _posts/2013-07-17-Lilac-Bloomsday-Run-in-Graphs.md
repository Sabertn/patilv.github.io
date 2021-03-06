---
layout: post
title:  "Lilac Bloomsday Run in Graphs"
description: "Bloomsday"
tags: [areachart, barchart, dotplot, ggplot2, linechart, R, Sports]
comments: true
share: true
---

[The Lilac Bloomsday Run](http://bloomsdayrun.org/) is a 7.46 miles (12 kms) race held annually in Spokane, Washington. The run was started in 1977 by [Don Kardong](http://www.distancerunning.com/inductees/2005/kardong.html) and it saw 51,613 people register for it in 2013. In this post, I use R to collect data from their website, clean and organize them, and present some information about the run and its history using graphs generated using ggplot2. The markdown file with the code and output [can be found here](https://dl.dropboxusercontent.com/u/56796392/Bloomsday/BloomsdayMarkdownDocument.html). The code by itself, along with the raw data files to [replicate everything can be found on github](https://github.com/patilv/Bloomsdayrun). A pdf document with all pages from their website relevant for these graphs can [be found here.](https://dl.dropboxusercontent.com/u/56796392/Bloomsday/DatafromBloomsdaySite-AllGraphsInfo.pdf)

## 2013 Geographic representation of participants


[![](http://2.bp.blogspot.com/-yzq_5eToieA/UecUqX0DYqI/AAAAAAAACXM/HTUVDS7mvM0/s400/2013Geography.png)](http://2.bp.blogspot.com/-yzq_5eToieA/UecUqX0DYqI/AAAAAAAACXM/HTUVDS7mvM0/s1600/2013Geography.png)


* People from Spokane participate in it with full spirit. There is international representation as well.

## Gender Composition over Years

[![](http://2.bp.blogspot.com/-UphjrXFhxb4/UecXIMEuz0I/AAAAAAAACXc/pLWDY_up6ZA/s400/Gender+Composition.png)](http://2.bp.blogspot.com/-UphjrXFhxb4/UecXIMEuz0I/AAAAAAAACXc/pLWDY_up6ZA/s1600/Gender+Composition.png)


* It is no longer male dominated. There is a higher proportion of female finishers.

## Presidents/Directors of the Run over Years

In alphabetical order by first name


[![](http://1.bp.blogspot.com/-8qiLTbHR_ao/UecYWK4g4BI/AAAAAAAACXs/LfztIGJuesY/s400/DirectorAlpha.png)](http://1.bp.blogspot.com/-8qiLTbHR_ao/UecYWK4g4BI/AAAAAAAACXs/LfztIGJuesY/s1600/DirectorAlpha.png)

In order of number of times Presidents/Directors served


[![](http://3.bp.blogspot.com/-_67634CgdMM/UecYYUrsqeI/AAAAAAAACX0/9ngxEEgnxW4/s400/DirectorNumtimes.png)](http://3.bp.blogspot.com/-_67634CgdMM/UecYYUrsqeI/AAAAAAAACX0/9ngxEEgnxW4/s1600/DirectorNumtimes.png)


## Number of People Registered and Finished in the General Category


[![](http://3.bp.blogspot.com/-VwTV8H0FfUQ/UecayQtGt6I/AAAAAAAACYU/F2wfuiA430E/s400/RegVsFinGen.png)](http://3.bp.blogspot.com/-VwTV8H0FfUQ/UecayQtGt6I/AAAAAAAACYU/F2wfuiA430E/s1600/RegVsFinGen.png)

## General Category Winners, All Years


[![](http://1.bp.blogspot.com/-cI1kXMg4dww/UecbzCNRggI/AAAAAAAACYk/YY_2n32pVME/s400/gencatwinners.png)](http://1.bp.blogspot.com/-cI1kXMg4dww/UecbzCNRggI/AAAAAAAACYk/YY_2n32pVME/s1600/gencatwinners.png)

## Wheelchair Winners, All Years


[![](http://1.bp.blogspot.com/-IY9DRHSSolk/Uecck9pyrEI/AAAAAAAACYs/fy_-YjNDV38/s400/wheelchairwin.png)](http://1.bp.blogspot.com/-IY9DRHSSolk/Uecck9pyrEI/AAAAAAAACYs/fy_-YjNDV38/s1600/wheelchairwin.png)

## Winners in All Categories, All Years


[![](http://2.bp.blogspot.com/-rUPGerE3vp0/Uecu9PYNj2I/AAAAAAAACZs/wnNrakl9hP0/s400/WinAllCat.png)](http://2.bp.blogspot.com/-rUPGerE3vp0/Uecu9PYNj2I/AAAAAAAACZs/wnNrakl9hP0/s1600/WinAllCat.png)

## The Perennials - Finish times of Runners Who have Finished Bloomsday Run Every Year Since It Began


[![](http://2.bp.blogspot.com/-THtRMhtqm-4/UecfopKSx0I/AAAAAAAACZE/gvN2SI5hSbc/s400/Perennials.png)](http://2.bp.blogspot.com/-THtRMhtqm-4/UecfopKSx0I/AAAAAAAACZE/gvN2SI5hSbc/s1600/Perennials.png)

* It is the spirit of participating and finishing that counts.

## Top Performers in Each Age Group, Since 1983


[![](http://3.bp.blogspot.com/-BQORWSiGGH0/Uecg9T2ylvI/AAAAAAAACZU/BZ98VgnQAoo/s400/AgeCatPerformers.png)](http://3.bp.blogspot.com/-BQORWSiGGH0/Uecg9T2ylvI/AAAAAAAACZU/BZ98VgnQAoo/s1600/AgeCatPerformers.png)
