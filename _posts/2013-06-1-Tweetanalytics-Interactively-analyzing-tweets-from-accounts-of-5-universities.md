---
layout: post
title: "Tweetanalytics - Interactively analyzing tweets from accounts of 5 universities"
description: "University accounts"
tags: [R, ggplot2, shiny, text mining]
comments: true
share: true
---

This is an attempt at learning and interactively displaying few results using twitter data using text mining. Interactivity is implemented using RStudio's [shiny server](http://www.rstudio.com/shiny/). Their documentation of demo scripts came in very handy. As a non-user of twitter, I had to open an account to get access to tweets. My first major source for information/functions/understanding was to refer to Jeffrey Stanton's free and easy to read book, [Introduction to Data Science](http://jsresearch.net/wiki/projects/teachdatascience). Then, there were several R bloggers who had documented their text-mining projects extensively. Almost all of the tasks shown in this first part come from Gaston Sanchez's excellent [twitter mining project](https://sites.google.com/site/miningtwitter/home).

There are several ways of retrieving data through twitter using R. For an example, [see here](https://sites.google.com/site/miningtwitter/basics/getting-data).  I used the [twitteR package](http://cran.r-project.org/web/packages/twitteR/vignettes/twitteR.pdf), which provides access to the Twitter API from within R. While playing around with this and retrieving few hundred tweets every few seconds, I noticed that twitter had, at one point, blocked my access to tweets. This required me to wait for a bit before I could get data again. So, what I did was to retrieve tweets and store them for my analyses. What this also did for this demo was to speed up the processing of the data by eliminating the data retrieving phase.

## Stage 1 
Retrieve, clean, and store tweets from the official twitter handles of 5 universities, including mine; these universities were Gonzaga University (GonzagaU), Eastern Washington University (EWUEagles), Washington State University (WSUPullman), Seattle University (Seattleu), and University of Washington (UW). Clean tweets were stored in a new column for each university's data file.  Although 500 tweets were requested for each university, the number of tweets that were collected were much fewer than those. These numbers can be obtained from the interactive app below. Cleaning involved removing redundant spaces, getting rid of URLs, taking out retweet headers, hashtags, and reference to other screen names. Note that cleaned tweets were stored separately and they didn't contaminate the original tweets. Data were downloaded on 31 May, 2013.

Code and files for all stages [can be found here.](https://github.com/patilv/tweetanalytics-1) [This is my first time using GitHub. So, if it doesn't work, please check this page for all the code [in a single htm file.](https://www.dropbox.com/s/ahw5uex64jmh1oo/Twitter-1-Retrieving%20and%20cleaning%20tweets.htm)]

## Stage 2
Use stored data to generate basic results - Raw tweets were used for this stage

In this, users can select any two (of five) universities and the tweet data files from these two universities can be used to generate 9 different results in 10 different tabs . 8 of these follow [Gaston Sanchez's work with ice cream](https://sites.google.com/site/miningtwitter/questions/frequencies). These include comparing the two universities based on 1) number of tweets retrieved, 2) characters per tweet, 3) words per tweet, 4) length of words per tweet , 5) number of unique words per tweet, 6) number of hash (#) tags per tweet, 7) number of @ (at) signs per tweet, and 8) number of web links per tweet. The 9th tab combines results for both universities on all 8 previously mentioned variables. Finally, the 10th tab graphically displays the probability of a new tweet from either of these universities arriving within a particular time frame (relying on the data we've gathered). This gives us an idea of which university is a more active tweeter. This uses a function from Jeffrey Stanton's book.

### Stage 2 application (Don't forget Stage 3 below, for discussion of word clouds.)

<iframe width="1200" height="700" src="//glimmer.rstudio.com/vivekpatil/Collegetweetanalytics" frameborder="0"> </iframe>


## Stage 3

[Tag clouds or word clouds](http://en.wikipedia.org/wiki/Tag_cloud) can be useful to visually represent textual data by emphasizing terms used more frequently. In this particular instance, I use the stored data to get an idea of terms used in tweets from different universities using three different word clouds - a regular word cloud for each university selected, and a comparative word cloud (a cloud comparing word frequencies across both universities) and a commonality word cloud (a cloud of words shared by the two universities). My understanding of word clouds and the functions used for coding were greatly influenced by the official documentation for the [word cloud package for R](http://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf), [Jeffrey Stanton's book](http://jsresearch.net/wiki/projects/teachdatascience), and [Gaston Sanchez's discussion](https://sites.google.com/site/miningtwitter/questions/talking-about) on this topic. Of course, I also benefited from a number of other examples from R-bloggers. For these word clouds, cleaned tweets were used.

### Stage 3 application

<iframe width="1200" height="700" src="//glimmer.rstudio.com/vivekpatil/2CollegeWCs" frameborder="0"> </iframe>



Concluding thoughts: This was fun. More later.
