---
layout: post
title:  "Visualizing the Forbes-CCAP University Rankings using ggplot2, rCharts, googleVis, and the shiny server"
description: "forbes rankings"
tags: [datatable, education, ggplot2, googleVis, motionchart, R, rCharts, scatterplot, Shiny]
comments: true
share: true
---

President Obama is pushing for higher education reform and the development of a rating system for Universities is a critical component of it. These ratings are likely to be based on several measures, such as
graduation rates, earnings of graduates, and affordability of education. Discussions of these plans can be found in leading national news outlets. See [here](http://www.washingtonpost.com/blogs/wonkblog/wp/2013/08/22/everything-you-need-to-know-about-obamas-higher-ed-plan/),
[here](http://www.nytimes.com/2013/08/23/us/politics/obama-vows-to-shame-colleges-into-keeping-costs-down.html?_r=0), [here](http://www.cbsnews.com/8301-250_162-57599611/obama-hits-the-road-to-push-for-education-reforms/),
and [here](http://techcrunch.com/2013/08/22/why-obamas-radical-education-plan-could-finally-disrupt-higher-education/) to go through some discussions regarding these plans.

In July, [Forbes](http://www.forbes.com/), in partnership with the [Center for College Affordability and Productivity](http://centerforcollegeaffordability.org/) (CCAP) produced
a ranking of 650 schools in the country. [Caroline Howard's article in Forbes](http://www.forbes.com/sites/carolinehoward/2013/07/24/ranking-americas-top-colleges-2013/) indicated
that this ranking system emphasized *outputs*of colleges (e.g., graduation rates) rather than *inputs* (e.g., SAT scores of incoming students), which is similar to what President Obama is pushing for. In
this post, I take a look at Forbes' rankings of schools using interactive visualizations. These would suggest that several challenges lie ahead for any meaningful reform.

Tools used for generating these visualizations include R, ggplot2, googleVis, rCharts, and a shiny-server application. The relevant code and data files **[can be found here on
github.](https://github.com/patilv/collegeranks)** I would appreciate your contacting me if you find any errors in the code or have any comments on this project. 



**Forbes-CCAP Rankings**

Data for this post were collected from two different documents from CCAP's site. Document 1 provided a list of [America's 100 Best College Buys](http://centerforcollegeaffordability.org/uploads/2013_Best_Values.pdf) and
document 2 - [Component Rankings](http://centerforcollegeaffordability.org/uploads/2013_Component_Rankings.pdf)- provided the complete listing of all 650 schools, their overall rank,
and other ranking criteria. Details of the methodology used by the ranking system can be found [here at](http://www.forbes.com/sites/carolinehoward/2013/07/24/ranking-americas-top-colleges-2013/) Forbes
and [here at](http://centerforcollegeaffordability.org/uploads/2013_Methodology.pdf) CCAP's site. Links to their discussions of results can be found [here](http://centerforcollegeaffordability.org/rankings/2013-rankings) at
CCAP's site and [here at](http://www.forbes.com/top-colleges/) Forbes'.
These rankings are based on variables such as post-graduate success,
student debt,  graduation rate, and student satisfaction, among others.
There were two summary rankings produced --- one was an overall rank,
and the second was a ranking of universities providing the best value.
650 schools were ranked in the overall rank system and among them, 100
were ranked as providing the best value.

**Procedure Followed**

1. Convert both pdf files (Component Rankings and Best College buys) to
excel formats (using[Able2Extract](http://www.investintech.com/prod_a2e.htm))
2. Merge both files into one datafile.
3. Combine the State with the name of the university into one column --- there were few universities with the same name, but were from different states.
4. For many components in the assigned component rankings, universities
getting a rank between 600 and 650 were assigned a generic rank of
"600-650" by Forbes-CCAP. It was decided to assign a rank of 625 to all
such schools for those specific components.
5. Please remember that a lower value of rank indicates that the school
is rated higher on that attribute.

The table below provides information used for subsequent analysis. The
table can be sorted by any column.
 
<iframe height="900" width="100%" src="//bl.ocks.org/patilv/raw/6358635/" frameborder="0"> </iframe>

**Where are the 100 best value schools in the country?**

* Color of dots: Rank, from 1 through 100
* Size of dots: Total Score (which determines the Overall rank... higher
score denotes lower rank number, which indicates a better overall
school)... Please note that the overall ranking method and the ranking
for best value are different.

**(You can hover over the dots to find the name of the school.)**

<iframe width="100%" height="450" src="//htmlpreview.github.io/?https://github.com/patilv/collegeranks/blob/master/bestvalschoolgeolocation.html" frameborder="0"> </iframe>

 
**Relationship between Best Value Rankings and Overall Rankings of Schools**
**(Please click on the image below to enlarge it.)**

[![](http://3.bp.blogspot.com/-vizqAJwP2CI/UhjvupwydrI/AAAAAAAACeg/XbJ-Df-wlWo/s640/bestvalue.png)](http://3.bp.blogspot.com/-vizqAJwP2CI/UhjvupwydrI/AAAAAAAACeg/XbJ-Df-wlWo/s1600/bestvalue.png)

The above graph shows overall ranks for all 100 universities identified
as providing the best value. Universities have been listed in the order
of their best value rank (better ranked below to lesser ranked above).
What one would notice is that there are only about 7 universities whose
overall rank is better than or similar to their best value rank. The
overall rank of most of the best value universities are over 100 and a
few are over 500.


This is also confirmed in the interactive graph given below, which shows
that the overall ranks for the 100 best value universities range from 7
through 599. It is also the case that of the 100 schools, only 3 are
private and the remaining 97 are public schools. 
**(You can hover over the dots to identify the school.)**

<iframe width="100%" height="450" src="//bl.ocks.org/patilv/raw/6358673" frameborder="0"> </iframe>

   
**How are different criteria related to each other?**
 
 Given the large number of criteria the Forbes-CCAP rankings provide
data on, it is perhaps more appropriate to let you interact with the
data to see how different variables are related to each other. The
interactive application below will let you do that.
 
 
<iframe width="100%" height="600" src="//glimmer.rstudio.com/vivekpatil/collratingshiny" frameborder="0"> </iframe>


Clearly, few variables have a positive relationship. For example,
universities with a better overall rank appear to also have better ranks
in terms of Federal.Student.Debt, Actual.Retention.Rate.Rank,
Student.Awards and Payscale.Salary.Rank. However, not all variables
show that kind of a relationship. For example, please see the
relationship between Rate.my.Professor rank and Payscale.Salary.Rank or
between Rate.my.Professor rank and American.Leaders.Rank. Interestingly,
private schools appear to have an edge over public schools based on the
Rate.My.Professor rank.
 
**Where does a particular school stack up, versus others?**
 
 The interactive application below provides additional information over
what we just saw. Here, you can select specific schools and figure out
how they do in comparison to select others. This application can be
played around with in the following ways.

1. The two small tabs on the top right show either bubble charts or
bar graphs, depending on what's selected.
2. The horizontal and vertical axes can be changed to other variables
by clicking at existing axis labels (the arrow mark)
3. Please change the Size parameter to "Same size" (top most option) to
ease interpretation.
4. You can hover over the dots to know the school.
5. Coloring can be modified --- but I would leave it at its default
state.
6. Specific schools (one or many) can be selected and changes in their
position with respect to different variables can be monitored . 
 
 
<iframe width="100%" height="600" src="//htmlpreview.github.io/?https://github.com/patilv/collegeranks/blob/master/hellomotion.html" frameborder="0"> </iframe>

**Concluding Remark and Acknowledgements**
 
 It is likely to be a long and arduous road ahead for education reform.
Should it be done, definitely. How? Wiser people need to figure this
out.
 
 Thanks to Ramnath Vaidyanathan, Joe Cheng, and other members of the R
community for their immediate responses to queries and excellent
resources they have created for all to use.
