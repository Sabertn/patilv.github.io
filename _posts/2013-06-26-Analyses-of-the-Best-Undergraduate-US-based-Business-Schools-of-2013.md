---
layout: post
title: "Analyses of the Best Undergraduate (US-based) Business Schools of 2013"
description: "Best business schools"
tags: [R, googleVis, shiny, ggplot2]
comments: true
share: true
---
**Link to the code for the analysis program is given at the very end.**

I teach in a business school and am always fascinated by rankings published by different outlets. As much as one would like to think that they are meaningless, they seem to influence how many [business schools actively try to manage their reputation](http://www.palgrave-journals.com/crr/journal/v3/n4/abs/1540123a.html). One such ranking of undergraduate business schools was recently published by [Bloomberg Businessweek](http://www.businessweek.com/). I thought I'll take a closer look at the numbers and try to present my analyses using only graphs and charts. The Businessweek article  presented [table(s) on their website.](http://www.businessweek.com/articles/2013-03-20/best-undergraduate-business-schools-2013) I have recreated that table below. (You can click on any column header to sort the table based on that column.) 


<iframe width="100%" height="400" src="//dl.dropboxusercontent.com/u/56796392/bschool/bschooltable.html" frameborder="0"> </iframe>

For this analysis, we ignore the 2012 Rank column. A description of the variables and the methodology is provided in the article [here](http://www.businessweek.com/articles/2013-03-20/best-undergraduate-business-schools-2013) and [here](http://www.businessweek.com/articles/2013-03-20/faq-how-we-ranked-the-schools). 124 schools have been ranked. One thing to note is the following. The 2013 rank is based on an index number they computed, with 100 being the highest (for the first ranked school, Notre Dame) and 20.35 being the lowest score, for California-Riverside, which was ranked 124. So, when it comes to a rank of a school, lower is better; for index numbers, higher the better. Something to keep in mind for understanding results.
 

# How many schools are ranked in different States?
Below is the US map color coded based on number of schools in different States. Since Washington DC is small to be on the larger map, that region gets its own smaller map. (You may have to scroll to the right.)

<iframe width="100%" height="500" src="//dl.dropboxusercontent.com/u/56796392/bschool/Numschoolsbystate.html" frameborder="0"> </iframe>

**Observations**

1. Ohio has the highest number of schools represented in this ranking.
2. There are few states, which are not represented in the ranking.

# Distribution of Index Numbers by State

Remember, a school with a higher index number was better ranked. Here, we look at how index numbers were distributed across different states. To do this, we use boxplots, which show the minimum, maximum, 25th percentile, 50th percentile (median), and the 75th percentile of the distribution. The blue dots in the middle of the box are the mean index scores.
 
<img src="http://2.bp.blogspot.com/-oxt707x4xeo/Ucstvy4c2vI/AAAAAAAACUA/4D7KWV0C-24/s640/StatesBoxplot.png" alt="">

**Observations**

1. Average scores are increasing from Vermont to Indiana.
2. Spread of the distribution (to some extent, measured by how long each box is) appears to vary across different states (for states with only one school, it is just a single point, but for states with multiple
schools, the spread indicates the higher variance in the index scores across schools in that state.
 
# Distribution of Index Numbers by Type of School, Teaching Quality Grade, Facilities and Services Grade, and Job Placement Grade

<img src="http://1.bp.blogspot.com/-R4hklgaM4-8/Ucsv88t3qPI/AAAAAAAACUQ/5vthDP7TlWs/s640/Catvarsboxplots.png" alt="">

**Observations**

1. As one should expect, job placement grade and teaching quality grade matter. Facilities and services grade also has an effect.
2. Private schools appear to have a higher index number than public schools.
 
# Relationships between Different Ranks, Index Numbers, a whole host of other variables

Here, we will look at a correlation analysis. (I've clubbed rank-ordered variables with ratio-scaled ones, but come on.) Below, is a graph with correlation coefficients color coded based on their value. Positive coefficients have been coded in blue and negative ones in red. Intensity of colors indicate the value. 

<img src="http://3.bp.blogspot.com/-JHyXlJS0Poc/Ucsynshz6VI/AAAAAAAACUo/n4QXkuosgyQ/s400/CorrMatrix.png" alt="">

**Observations**

1. 2013 Rank is, as expected, positively correlated with how schools are ranked by students and employers (not too dark a blue, is it?), MBA feeder school and Academic quality rank
2. 2013 Rank is perfectly negatively related to Index Number (because of the way it is computed).
3. Index Number is marginally positively correlated with Annual Tuition (not a good thing, is it?), but has a positive relationship with median starting salary of students. The latter relationship is a good thing.
4. Index number is negatively related to student faculty ratio, which is also a good thing, right? How does this play into the MOOCs thing?
5. And yes, the average SAT scores are strongly related to the index number.
 
# Schools positioned on any set of two variables

Now, this gets interesting. Since there are many combinations possible and everyone has their own pet set of issues, the following interactive chart will let you play around until .... forever, if you are really ticked about these issues. This chart can be played around with in the following ways.

1. The two small tabs on the top right show either bubble charts or bar graphs, depending on what's selected.
2. The horizontal and vertical axes can be changed to other variables by clicking at existing axis labels (the arrow mark)
3. You can hover over the dots to know the school and value of the variables being examined.
4. Color is used to identify whether a school is a public school Green) or a private one (Blue).
5. Size of dot is based on the index number- LARGER size is a better ranked school with a higher index number.
 
Observations: I will let you make them. Have fun.

<iframe width="100%" height="600" src="//dl.dropboxusercontent.com/u/56796392/bschool/scatterplots.html" frameborder="0"> </iframe>
 

[The R code for this analysis can be accessed by clicking this link.](https://github.com/patilv/bschools)
