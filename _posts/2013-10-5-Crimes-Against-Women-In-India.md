---
layout: post
title: "Crimes Against Women In India using rCharts, googleVis, and shiny"
description: "Crimes against women in India"
tags: [areachart, choropleth, clustering, correlation, crime, googleVis, heatmap, India, linechart, parallelplot, R, rCharts, scatterplot, Shiny]
comments: true
share: true
---

Recent crimes against women, specifically the [2012 gang rape in New Delhi](http://en.wikipedia.org/wiki/2012_Delhi_gang_rape) of a 23 year
old lady, have pushed this issue as a substantially significant one for
Indians to deal with. In this post, I try to address 8 different
questions regarding crime against women in India. 

(1) How have numbers in different types of crimes and percentage of different crimes changed
over the past few years for the country as a whole and for individual
States/Union Territories? This is answered using data available for 12
years (2001-2012). For rest of the questions, I focus on data from 2012.
(2) At the States/Union territories level, how are different types of
crimes related to each other, in terms of their correlations? 
(3) Which States/UTs have a higher incidence of different types of crimes? 
(4) How can different States/UTs be classified based on the nature and extent of
crime occurring in them? 

In question 5 through 7, I ask questions 2 through 4 again, but for different cities. 
Question 8 - Can the States, Union Territories, and Cities be mapped along with their incidence
levels of different crimes in 2012?
 
**Tools Used:** Analysis has been done using R and visualizations have
been developed using rCharts and googleVis. Interactivity has also been
facilitated by the shiny server environment, thanks to RStudio. Other R
libraries used include reshape2, plyr, and scales. Special thanks to
Ramnath Vaidyanathan and @timelyportfolio for their super quick
assistance with rCharts. Acknowledgements are due to developers of the
numerous JS libraries and D3 viz folks. Extraordinary set of tools. [All datasets used for this post and the code for generating charts and shiny applications are available at github.](https://github.com/patilv/IndiaCrime)

**Please Note:** Since all of these charts rely on web-based
technologies for appropriate rendering, the quality of the output
(assuming it does) may be different depending on the computing system
being used. If you are interested in static graphs, please let me
know.
 
**Data:** The [National Crime Records Bureau](http://ncrb.nic.in/) of
the Ministry of Home Affairs maintains statistics of different types of
crimes occurring in the country. These generally tend to be
underreported for different purposes. See [here](http://www.thehindu.com/news/national/india-officially-undercounts-all-crimes-including-rape/article5121114.ece?homepage=true) and [here](http://thinkprogress.org/security/2013/01/11/1435191/report-rape-often-a-political-tool-in-india/)
). But, in the absence of any other source of such data, I have used data
from their website. Two primary datasets are being used. [One provides annual statistics for 12 years (2001-2012) by State and Union Territory for incidence of different types of crimes](http://ncrb.nic.in/CD-CII2012/Additional_Tables_CII_2012/Additional%20table%202012/CAWomen-CH-2001-2012.xls). A [second dataset had to be created by converting a pdf document to a spreadsheet](http://ncrb.nic.in/CD-CII2012/cii-2012/Table%205.2.pdf). These were 2012 data on the same set of crimes, but for cities. The types of crimes on which data was provided include the following 11
crimes - Rape, KidnappingAndAbduction, DowryDeaths,
AssaultWithIntentToOutrageModesty, InsultToModesty,
CrueltyByHusbandOrHisRelatives, ImportationOfGirlsFromForeignCountry,
ImmoralTrafficPAct, DowryProhibitionAct,
IndecentRepresentationOfWomenPAct, CommissionOfSatiPreventionAct. The
variable names have been slightly edited for the purpose of the
analysis. Please visit the provided links for more information on these
variables.

**Question 1:** How have numbers in different types of crimes and
percentage of different crimes changed over the past few years for the
country as a whole as well as for individual States/Union Territories?


**Part 1 Question 1 - For the country:** The following interactive
chart can help answer this question. **You can interact with it in the
following ways**. (a) Hovering over the chart should identify values.
(b) Click on the legend circles and those lines disappear/reappear. This
way, you can look at the trends associated with each crime and the total
number of crimes. (c) The y-axis of the lower graph can be used as a
slider to magnify (click it with your mouse and holding that position of
the mouse, pull it to the right) sections of the plot.


<iframe width="100%" height="475" src="//pagist.info/52d8f7990e550a85cb16" frameborder="0"> </iframe>


**Few observations:** Total crimes and Rape have been on a rise from
2003 onwards --- 2003 had the lowest levels for these. Cruelty by
husband or his relative has increased every year since 2001 and so has
kidnapping and abduction (at a much higher pace). From 6851 dowry deaths
in 2001, there have been over 8000 dowry deaths every year since 2007.
 
The next chart provides additional information related to this
question. For every year, it tells us how much percent a particular
crime constituted of the total crimes for that year. If you clicked on
the **"Expanded"** version of the chart and hover over it, you should
get this information.You can also click on any of the legend dots for a
better perspective.
 

<iframe width="100%" height="625" src="//pagist.info/96e7ff794d15384abfbc" frameborder="0"> </iframe>

**Few observations:** Cruelty by husband or his relative has
increased from 34.19% of total crimes in 2001 to 43.61% of total crimes
in 2012, Kidnapping and Abduction has gone up from 10.18% to 15.66% from
2001 through 2012. The proportion of other crimes has remained
relatively similar or has declined slightly. Of course, as the previous
chart indicated, the absolute number of total crimes has gone up.
 
**Part 2 Question 1:** This interactive application let's you visualize
how different States and Union Territories (using the drop-down menu
to select) have fared over the 12 years. (Don't forget, this is just
the first of 8 questions)
 
<iframe width="100%" height="1250" src="//glimmer.rstudio.com/vivekpatil/TotCrime" frameborder="0">  </iframe>
 
 **Question 2.** In 2012, at the States/Union territories level, how are
different types of crimes related to each other, in terms of their
correlations?
  
There were no instances of CommissionOfSatiPreventionAct.in 2012 for
the country. Hence, that variable is dropped for analyses involving
2012. The correlation matrix given below provides this information. It
tells you how related two crimes are to each other. The correlation
coefficient, a measure of the relationship, can vary from -1 through +1.
A negative coefficient indicates indicates a negative relationship (in
red or a shade of red) between the two variables, whereas a positive
coefficient indicates that there is a good chance of finding both crimes
together.

<iframe width="100%" height="475" src="//htmlpreview.github.io/?https://github.com/patilv/IndiaCrime/blob/master/corrmatplotstate.html" frameborder="0"> </iframe>
 
**Few observations:** Rape appears to be positively related to cruelty
by husband or his relative, dowry deaths, and kidnapping and abduction.
Kidnapping and abduction also has a positive relationship with dowry
deaths. There was only one negative relationship.

**Question 3:** In 2012, which States/UTs had a higher incidence of
different types of crimes?
 
The heatmap below provides a clue to answering this question.**Along
the columns are different crimes (you don't see all labels but if you
hover over the rectangle tiles, you should see the crime identified) and
along the rows are different States and Union Territories.**Values for
individual crimes are scaled to a 0 to 1 scale, thereby permitting a
visualization of all variables in a better manner. Higher the value for
a crime, higher the intensity of red and the scaled value will be closer
to 1. Lower the value for a crime, lower the intensity of the red--- or
white if crime level is negligible.
 
<iframe width="100%" height="625" src="//htmlpreview.github.io/?https://github.com/patilv/IndiaCrime/blob/master/heatmapstate.html" frameborder="0"> </iframe>
  
**Few observations:** There clearly are few states which appear to
have red tiles for many crimes (e.g. West Bengal and Andhra Pradesh) but
there are some states with no red tiles as well (e.g., Mizoram,
Meghalaya and Manipur). We will look at this in more detail in the next
question.

**Question 4:** In 2012, how can different States/UTs be classified
based on the nature and extent of crime occurring in them?
 
We tackle this question using two charts. For this, I used a
statistical technique called k-means cluster analysis.What this did was
to classify different States and UTs into different groups (I specified
a 5 group solution, in order to help interpretation, although one could
theoretically have chosen a different number.) This grouping is done
such that States and Union territories with similar characteristics
(with respect to crime numbers) are grouped together.The first chart
below tells us which States and UTs belonged to the 5 groups and the
second chart following that gives information on the characteristics of
these groups.
 

<iframe width="100%" height="400" src="//htmlpreview.github.io/?https://github.com/patilv/IndiaCrime/blob/master/stategpplot.html" frameborder="0"> </iframe>
  

**Characteristics of these groups.** The chart below can be used to
determine the profile of each of the 5 groups. You can select (box
around a group number) and click to find few lines highlighted. This
chart gives the mean incidence scores on all crime variables for members
in the 5 groups. Lower the mean score in the group, lesser that crime
occurring in that group. Please note that the original variable labels
were truncated in this graph. The original variable labels are: Rape,
KidnappingAndAbduction, DowryDeaths, AssaultWithIntentToOutrageModesty,
InsultToModesty, CrueltyByHusbandOrHisRelatives,
ImportationOfGirlsFromForeignCountry, ImmoralTrafficPAct,
DowryProhibitionAct, and IndecentRepresentationOfWomenPAct.


<iframe width="100%" height="480" src="//dl.dropboxusercontent.com/u/56796392/Indiacrimedatanew/PARALLELSTATE.html" frameborder="0"> </iframe>
  
**Few Observations: Group 1:** (Assam, Bihar, Gujarat, Uttar Pradesh)
Highest incidence of Kidnapping and Abduction and Dowry Deaths. **Group
2:** (Karnataka, Kerala, Madhya Pradesh, Maharashtra, Orissa) High
incidence of Rape, Highest in Assault of Modesty and Importation of
foreigners. **Group 3:** (Andhra Pradesh, Rajasthan, West Bengal)
Highest incidence of Rape, Insult to Modesty, Cruelty by husband or his
relative, Immoral Traffic PAct, Dowry Prohibition Act and Indecent
Representation of Women P.Act. **Group 5** (Chhattisgarh, Delhi (UT),
Haryana, Jammu and Kashmir, Jharkhand, Punjab and Tamil
Nadu) - relatively low (compared to groups 1, 2, and 3) but not the
least levels (compared to group 4).  **Clearly, Group 4 States and UTs
have the lowest incidence of crimes.** These include Andaman and Nicobar
Islands, Arunachal Pradesh, Chandigarh (UT), Dadra and Nagar Haveli,
Daman and Diu, Goa, Himachal Pradesh, Lakshadweep, Manipur, Meghalaya,
Mizoram, Nagaland, Pondicherry, Sikkim, and Tripura.

**CITY LEVEL ANALYSES**

**Question 5.** In 2012, at the Cities level, how are different types
of crimes related to each other, in terms of their correlations?
 
As previously mentioned, the correlation matrix tells us how related
two crimes are to each other. The correlation coefficient, a measure of
the relationship, can vary from -1 through +1. A negative coefficient
indicates indicates a negative relationship (in red or a shade of red)
between the two variables, whereas a positive coefficient indicates that
there is a goodchance of finding both crimes together.

<iframe width="100%" height="475" src="//htmlpreview.github.io/?https://github.com/patilv/IndiaCrime/blob/master/corrmatplotcities.html" frameborder="0"> </iframe>


**Few Observations:** At the cities level, Rape is positively related
to Kidnapping and Abduction, Dowry deaths, and Cruelty of husband or his
relatives. Dowry deaths were also positively related to kidnapping and
abduction, cruelty of husband or his relatives and assault with intent
to outrage modesty.

**Question 6:** In 2012, which Cities had a higher incidence of
different types of crimes?

The heatmap below provides a clue to answering this question. **Along
the columns are different crimes (you don't see all labels but if you
hover over the rectangle tiles, you should see the crime
identified)** and along the rows are different Cities. Values for
individual crimes are scaled to a 0 to 1 scale. Higher the value for a
crime, higher the intensity of red and the scaled value will be closer
to 1. Lower the value for a crime, lower the intensity of the red - or
white if crime level is negligible.
 
<iframe width="100%" height="625" src="//htmlpreview.github.io/?https://github.com/patilv/IndiaCrime/blob/master/heatmapcity.html" frameborder="0"> </iframe>


**An Observation:** Delhi and Bangalore seem to have a large number
of red columns. This will be explored further in the next question.
 
**Question 7:** In 2012, how can different Cities be classified based
on the nature and extent of crime occurring in them?
 
As we did in the context of States and UTs, we use k-means cluster
analysis to classify different cities into different groups (Yet again,
I specified a 5 group solution for interpretation purposes, although one
could theoretically have chosen a different number.) This grouping is
done such that cities with similar characteristics (with respect to
crime numbers) are grouped together.The first chart below tells us
which cities belonged to the 5 groups and the second chart following
that gives information on the characteristics of these groups.

<iframe width="100%" height="400" src="//htmlpreview.github.io/?https://github.com/patilv/IndiaCrime/blob/master/citiesgpplot.html" frameborder="0"> </iframe>


**WOW:** Delhi is in a league of its own, a lone member in a group.

**Characteristics of these groups.** The chart below can be used to
determine the profile of each of the 5 groups. You can select (box
around a group number) and click to find few lines highlighted. This
chart gives the mean incidence scores on all crime variables for members
in the 5 groups. Lower the mean score in the group, lesser that crime
occurring in that group. Please note that the original variable labels
were truncated in this graph. The original variable labels are: Rape,
KidnappingAndAbduction, DowryDeaths, AssaultWithIntentToOutrageModesty,
InsultToModesty, CrueltyByHusbandOrHisRelatives,
ImportationOfGirlsFromForeignCountry, ImmoralTrafficPAct,
DowryProhibitionAct, and IndecentRepresentationOfWomenPAct
 
 
<iframe width="1300" height="480" src="//dl.dropboxusercontent.com/u/56796392/Indiacrimedatanew/PARALLELCITY.html" frameborder="0"> </iframe>

**Few Observations: Group 1** - Only Delhi- has the highest number of
Rapes, Kidnapping and Abductions, Dowry Deaths, Assault with intent to
outrage modesty, and Cruelty by husband and his relatives. **Group
5,** which includes Bangalore, Kolkata, and Mumbai, have relatively high
incidences of assault with intent to outrage modesty and the highest
levels on insult to modesty, importation of girls from foreign country,
immoral traffic P. act, and dowry prohibition act. **Group 3**, which
includes Ahmedabad, Hyderabad, Jaipur, and Vijayawada, has relatively
higher number of insult to modesty and cruelty by husband and his
relatives. It has the highest incidents with respect to indecent
representation of women p.act. **Group 2- has the fewest number of
crimes among all groups,** and therefore likely to be the safest in this
set of cities. These include cities such as Allahabad, Amritsar,
Aurangabad andChandigarh (for a complete list, please see the previous
chart). **After Group 2, Group 4 appears to be the safest.** This group
includes cities like Agra, Asansol, Bhopal, and Chennai (for a complete
list, please see the previous chart).

**Question 8:** Can the States, Union Territories, and Cities be
mapped along with their incidence levels of different crimes?

**Yes. Please interact with the application below and toggle between the two
tabs for information regarding Cities or States and Union
Territories.**

<iframe width="1300" height="1250" src="//glimmer.rstudio.com/vivekpatil/indiacrimeshiny" frameborder="0"> </iframe>
