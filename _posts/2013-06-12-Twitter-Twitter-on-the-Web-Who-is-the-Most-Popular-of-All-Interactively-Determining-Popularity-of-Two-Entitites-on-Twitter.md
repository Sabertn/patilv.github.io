---
layout: post
title: "Twitter Twitter on the Web, Who is the Most Popular of All? Interactively Determining Popularity of Two Entitites on Twitter"
description: "Popularity of entities"
tags: [barchart, boxplot, densityplot, ggplot2, linechart, R, sentiment, Shiny, text mining, twitter, wordcloud]
comments: true
share: true
---
**Code updated based on feedback (see list of changes at the very end)**

Okay, that was a take on the [mirror mirror on the wall quote from Snow White.](https://en.wikipedia.org/wiki/Snow_White) This continues my saga of learning from the superb work done by the R-community and building on their ideas. My [first post on twitter-related analysis](patilv.github.com/Twitter-Twitter-on-the-Web-Who-is-the-Most-Popular-of-All-Interactively-Determining-Popularity-of-Two-Entitites-on-Twitter/) relied on data downloaded at a particular time for interactively analyzing tweets from 5 different universities. In this second post on twitter-related analysis, let's advance that idea this time by retrieving tweets on the fly. As I mentioned in my earlier post, it is possible that twitter might prevent the application from retrieving tweets after a few attempts. So, I'm hoping that it doesn't happen. If you run into trouble, then you, of course, have access to the entire code used for this post. [GitHub link](https://github.com/patilv/Popsenti), should work if I'm doing it remotely correctly; else, [an htm file with the code for the server and user interface files](https://www.dropbox.com/s/9hg8a29p9g1o227/Popularitysentiment.htm) can be downloaded.

In this application, I attempted to build on ideas and functions from a chapter titled "Popularity Contest" from Jeffrey Stanton's book-[Introduction to Data Science](http://jsresearch.net/wiki/projects/teachdatascience) and bring interactivity to many of those functions. Here, a user of the application can compare the popularity (on twitter) of any two people/objects/entities. I again use the [shiny server framework advanced by R-Studio for web-based interactivity.](http://www.rstudio.com/shiny/) This is super cool stuff. Thanks.

# How is popularity being measured?

This is being done in two ways, one, by determining the probability of a new tweet regarding an entity occurring within a certain time period. It could be argued that higher this probability, higher the frequency of discussion of this entity on twitter, suggesting relatively higher popularity.

A second approach involves comparing the proportion of all retrieved tweets for each entity that occurred within a certain time frame. For example, one can ask what proportion of retrieved tweets about entity 1 and entity 2 occurred within 30 seconds of each other?

Fortunately for me, both these functions come from Stanton's book and it took little tweaking to get them working under the shiny server framework. The first function was, in fact, used in my [earlier post as well](patilv.github.com/Twitter-Twitter-on-the-Web-Who-is-the-Most-Popular-of-All-Interactively-Determining-Popularity-of-Two-Entitites-on-Twitter/).  

Lastly, we need to check if all this discussion on twitter about the entities is positive and not negative. As my parents always told me, which I am hoping to pass on to my 3 year old when she's ready to listen to me --- when people talk frequently about us, it better be in a
positive light. It might be better to not be talked about than be unpopular. To do this, I rely on the sentiment analysis approach [Jeffrey Breen uses in his twitter mining application with airlines.](http://jeffreybreen.wordpress.com/2011/07/04/twitter-text-mining-r-slides/) Yet another illustration of this approach can be found at [Gaston Sanchez's excellent twitter mining project.](https://sites.google.com/site/miningtwitter/questions/sentiment) In this, words used in tweets are matched with listing of terms [deemed positive or negative, based on previous research.](http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html) Then a score is generated for each tweet, reflecting number of positive and negative terms used. More information on this approach [can be obtained from Jeffrey Breen's site.](https://github.com/jeffreybreen/twitter-sentiment-analysis-tutorial-201107/tree/master/data/opinion-lexicon-English) We'll use this to get a general sense of the sentiment people are expressing about our entities. We'll also develop word clouds of terms being used in these tweets. 

# What does the application do?

**Inputs 1 and 2**: The application can take inputs for two entities (Entity 1 and Entity 2). (This can, of course, be scaled for more than 2 names.) When you click the application link below,  the default inputs are "#Michael" and "#Mary" for Entity 1 and Entity 2, respectively. Why did I pick Michael and Mary? According to the [Social Security Administration, over the last 100 years (between 1913-2012),](http://www.socialsecurity.gov/OACT/babynames/top5names.html) "Michael" was the most popular name for a male child for 44 years, while "Mary" was the most popular name for a female child for 43 years. So I thought I'd give them a try. You can change those inputs to anything you like.

 
**Input 3**: Number of tweets to retrieve. Although there are several ways of retrieving data through twitter using R (for example,[ ](https://sites.google.com/site/miningtwitter/basics/getting-data)[see here](https://sites.google.com/site/miningtwitter/basics/getting-data)[), ](https://sites.google.com/site/miningtwitter/basics/getting-data) I use the [twitteR package](http://cran.r-project.org/web/packages/twitteR/vignettes/twitteR.pdf). Please also remember that this input only specifies how many tweets to retrieve; how many ultimately get retrieved may be fewer than the number requested. In order to make sure Twitter didn't block this application, I've restricted the max tweets to about 50. This can be increased to anything by just modifying one number in the user input code file. I've kept the minimum number to 5, which can again be modified. 
 
**Input 4**: Time (in seconds). Remember, we will compute the proportion of tweets for both entities that arrived within a particular time period. It is this time period that we are asking the user to input.  

**Application Outputs**
 
Outputs are presented in a series of  7 tabs.
 
**Tab 1**: Gives you information on how many tweets were retrieved and plots the probability of a new tweet arriving a particular time, t for both entities. 
 
**Tab 2**: Gives us three graphs to visualize the distribution of delay times between tweets for both entities.   The first gives [box plots](http://en.wikipedia.org/wiki/Box_plot) and mean of the
distribution of delay times for both entities; the second and third graphs are a [histogram](http://en.wikipedia.org/wiki/Histogram) and a [kernel density function](http://en.wikipedia.org/wiki/Kernel_density_estimation). Box plots would  give information on the minimum, maximum, and 25th, 50th (median), and 75th percentile of the distribution. Overall, lower the delay time between tweets, higher the frequency of tweets, suggesting a higher popularity.

 
**Tab 3**: 3 parts to this.
Part 1 gives us a bar graph of estimated proportion of tweets retrieved for both entities, which had delay times <= the user specified time (see Input 4 above). It also plots the [95% confidence interval](http://en.wikipedia.org/wiki/Confidence_interval)in the estimation of these proportions. If one entity is clearly more popular than the other, we should not find an overlap of the region of these confidence intervals.
Part 2 presents the table used for generated the bar graph of part 1.  
Part 3 presents the results of a poisson test of the two proportions. Here, the idea is that if one entity is clearly more popular than the other, the rates (or proportions computed previously) should be different from each other and their ratio should be statistically different from 1. This test presents some numbers to corroborate what we might find in part 1 of this tab. Check the following numbers: Rate ratio --- should not be 1 if one entity's proportion is sufficiently different from the other entity's. The [95% confidence interval](http://en.wikipedia.org/wiki/Confidence_interval) should not have "1" for one to be more popular than the other. The [p-value would be <=.05 in such cases](http://en.wikipedia.org/wiki/P-value). 
 
**Tab 4**: It is here that we determine whether all the talk on twitter about the entities was positive or negative. We see the distribution of sentiment scores (higher score is better) for retrieved tweets for both entities using box plots. The mean is also computed. To see how well the
algorithm did, few tweets for both entities are shown along with their sentiment score. It may not be perfect, but it gives an idea of the sentiment. Please note that tweets were cleaned prior to the generation of sentiment scores. Cleaning involved removing redundant spaces, getting rid of URLs, taking out retweet headers, hashtags, and reference to other screen names.
 
**Tab 5**: Presents word clouds of terms used in tweets for both entities. They are regular word clouds, which [were described in my earlier post](patilv.github.com/Twitter-Twitter-on-the-Web-Who-is-the-Most-Popular-of-All-Interactively-Determining-Popularity-of-Two-Entitites-on-Twitter/).
Please note that tweets were cleaned prior to the generation of these word clouds. As mentioned in the discussion of tab 4, cleaning involved removing redundant spaces, getting rid of URLs, taking out retweet headers, hashtags, and reference to other screen names. 

 
**Finally, tabs 6 and 7** present the raw tweets retrieved for the two entities and used in the outputs generated in the earlier 5 tabs. 

<iframe width="1200" height="1000" src="//glimmer.rstudio.com/vivekpatil/popularity" frameborder="0"> </iframe>

**Concluding Thoughts**: This has been really fun. When and what next, no clue.

App has been updated. 

* Replaced references to entity 1 and 2 in tables and graphs with their values
* Time slider increases every 30 secs rather than 1 second.
* Modified the function to count number of tweets for the output in tab 1.
* Application address on glimmer changed (....popularity instead of ...Popsenti)