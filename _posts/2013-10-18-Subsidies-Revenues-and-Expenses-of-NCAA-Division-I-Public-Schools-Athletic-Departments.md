---
layout: post
title: "Subsidies, Revenues, and Expenses of NCAA Division I Public Schools Athletic Departments - Visualizations using rCharts and animint generated interactive ggplots"
description: "NCAA"
tags: [barchart, clustering, correlation, datatable, ggplot2, heatmap, parallelplot, R, rCharts, scatterplot, Sports]
comments: true
share: true
---

Two interesting articles in recent issues of *The Atlantic* linked sports to tax-payer dollars. The first few lines of Gregg Easterbrook's
article, titled [How the NFL Fleeces Taxpayers](http://www.theatlantic.com/magazine/archive/2013/10/how-the-nfl-fleeces-taxpayers/309448/), were: "Taxpayers fund the stadiums, antitrust law doesn't apply to broadcast deals, the league enjoys nonprofit status, and Commissioner Roger Goodell makes $30 million a year. It's time to stop the public giveaways to America's richest sports league-and to the feudal lords who own its teams."  Amanda Ripley's article was titled [The Case Against High-School Sports.](http://www.theatlantic.com/magazine/archive/2013/10/the-case-against-high-school-sports/309447/) Its first few lines were: "The United States routinely spends more tax dollars per high-school athlete than per high-school math student-unlike most countries worldwide. And we wonder why we lag in international education rankings?" An USA Today Sports article by Steve Berkowitz, Jodi Upton and Erik Brady addressed a third level of sports- collegiate athletics, and linked it to tax-payer dollars. The article, titled
"[Most NCAA Division I athletic departments take subsidies](http://www.usatoday.com/story/sports/college/2013/05/07/ncaa-finances-subsidies/2142443/)" focused on the issue of providing subsidies to athletic departments of public schools that were self-sufficient (16 out of 228 schools) and
asked if that was necessary. In this post, I use data provided in the USA Today article to further study the expenses, revenues, and subsidies
of the athletic departments of the 228 public schools. 

 All charts used in this post permit interactivity of some sort. These
were created using [rCharts](http://rcharts.io/) and
[animint.](https://github.com/tdhock/animint) These in turn rely on a
set of other libraries such as ggplot2 and polycharts JS. Thanks to Toby
Dylan Hocking, @timelyportfolio and Ramnath Vaidyanathan for their
prompt assistance on charting questions. [Code, data, and other files relevant for a replication of this analysis are available at github.](https://github.com/patilv/ncaagginteractive). 
 
# Data
[Data on total revenues, total expenses, and subsidies for 228 athletic departments of public universities](http://www.usatoday.com/sports/college/schools/finances/)
were provided for the year 2012. An overall rank was also provided to
different athletic departments on their finances. The [methodology and category explanations USA Today used are available here.](http://www.usatoday.com/story/sports/college/2013/05/10/college-athletic-department-revenue-database-methodology/2150123/) 
Data were collected by USA Today in partnership with [Indiana University's National Sports Journalism Center](http://sportsjournalism.org/sports-media-news/usa-today-national-sports-journalism-center-students-team-to-update-ncaa-financial-database/).
In the data analyzed below, Total Revenues for a department include the
subsidies it received. An additional variable, Revenues less Expenses
was calculated, which was nothing but the Total Revenues less Total
Expenses. The complete data have been tabulated below. **The columns can
be sorted based on the value.**
 
 
<iframe width="100%" height="450" align="middle" src="//www.pagist.info/7023937" frameborder="0"> </iframe>
 
 
Now, let's visualize the data using a heat map. **Along the columns are
different schools (you don't see all labels but if you hover over the
rectangle tiles, you should see the school identified).**Values for
expenses, revenues and other variables are scaled to a 0 to 1 scale,
thereby permitting a visualization of all variables in a better manner.
Higher the dollar amount, higher the intensity of red and the scaled
value will be closer to 1. Lower the dollar value, lower the intensity
of the red--- or white if dollar amount is negligible. To verify, you
can hover over the most intense red parts of the Total Subsidy row and
you should find Nevada-Las Vegas with a scaled value of 1. It is because
it gets the highest subsidy.
 
<iframe width="1250" height="450" align="middle" src="//www.pagist.info/7023956" frameborder="0"> </iframe>
  
The heat map clearly shows that most schools receive subsidy to some
degree; the row for Total Revenue indicates that that there are very few
schools that generate very high amounts of revenue and as a result, the
Revenue less Expenses row is generally a shade of faded red for most
schools, save for a handful of those with very high values.
 
# Relationship between Total Subsidy, Total Revenue, Total Expenses and
Revenue Less Expenses
 The correlation matrix given below provides this information. It tells
you how related two variables are to each other. The correlation
coefficient, a measure of the relationship, can vary from -1 through +1.
A negative coefficient indicates indicates a negative relationship (in
red or a shade of red) between the two variables, whereas a positive
coefficient (in blue or a shade of blue) denotes a positive relationship
(higher values of one variable are associated with higher values of the
other variable). **You should be able to hover over the tiles to get
more information.**
 

<iframe width="100%" height="450" align="middle" src="//www.pagist.info/7023971" frameborder="0"> </iframe>
 
There's a perfect positive correlation between Total Revenue and
Total Expenses, and these variables are negatively correlated to the
overall rank (higher the revenue, better the rank [with a lower number
denoting better performance]). No surprises there. Total Subsidy is not
positively related to any other variable.

# Groups/Clusters of Athletic Departments

In order to classify different athletic departments into different
groups, a statistical technique called k-means clustering was used.
Based on few statistical measures, which can be ascertained from the
code provided, it was decided that all 228 departments be grouped into 4
different groups. This grouping is done such that Schools with similar
characteristics (with respect to total subsidy, total revenue, total
expenses and revenue less expenses) are grouped together. **Group 1 had
19 schools, Group 2 had 61 schools, Group 3 had 33 schools and the
remaining 115 schools belonged to Group 4.** Schools are tabulated based
on the 4 groups below.

<iframe width="100%" height="450" align="middle" src="//www.pagist.info/7028781" frameborder="0"> </iframe>

# Characteristics of these groups/clusters

The chart below can be used to determine the profile of each of the 4 groups. You can select
(box around a group number) and click to find few lines highlighted.
This chart gives the mean scores on variables of interest for the 4
groups. Lower the mean score in the group, lesser the dollar amount for
that group. 
 
 
<iframe width="100%" height="450" align="middle" src="//dl.dropboxusercontent.com/u/56796392/ncaa/parallelplot.html" frameborder="0"> </iframe>

 
Group 1 (cluster of 19 schools) has the highest mean Total Revenues
(approximately $111.48 million), highest mean Total Expenses
(approximately $101 million), and highest Revenues less Expenses (over
$10 million). It takes the least amount of subsidy (approximately
$2.85 million). Contrast Group 1 with Group 4, a cluster of 115
schools, the largest among the four groups. Group 4 has the lowest mean
Total Revenue, lowest mean Total Expenses, a subsidy average of
approximately $8.3 million dollars, and the lowest Revenue less Expense
of $17,550. Group 3 schools, a cluster of 33, taken in an average
subsidy amount which is slightly less than Group 4 schools
(approximately $7.9 million) but has the second highest mean levels
with respect to Total Revenues (approximately 70.34 million), Total
Expenses (approximately 69.3 million) , and Revenues less Expenses
(little over $1 million) . Lastly, Group 2 schools, who receive the
highest average subsidy (approximately $16.9 million) have total
revenues of approximately $29 million, expenses of approximately
$28.99 million for a Revenue less Expenses amount of about $37,000.
 
The following set of plots provide the potential to explore
relationships between different variables and subsidies and the 4
different groups further. **You should be able to hover over either the
bars of the bar charts or the points of the scatter plots to get
information of the school being hovered over. You should also be able to
click on a point or bar to see where that school is positioned on the
other charts. The points have been colored based on the membership of
the corresponding school in the 4 different groups.**
 
 
<iframe width="100%" height="1250" align="middle" src="//patilv.github.io/ncaagginteractive/index.html" frameborder="0"> </iframe>

 
# Conclusion

There clearly is a lot of money in NCAA athletics, even though the
athletes themselves are not paid a salary. The analysis shows that
subsidies are provided to most athletic departments of public schools.
Given limited tax-payer dollars and the picture that emerges after
juxtaposing other articles on the use of tax-payer funding for sports, a
question that begs answers is whether tax-payer dollars are going to the
right places.