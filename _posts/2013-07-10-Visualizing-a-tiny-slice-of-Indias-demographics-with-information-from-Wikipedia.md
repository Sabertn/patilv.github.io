---
layout: post
title: "Visualizing a tiny slice of India's demographics with information from Wikipedia"
description: "Best business schools"
tags: [R, googleVis, textmining, ggplot2]
comments: true
share: true
---
This post presents a tiny slice of a complex and diverse India using charts. (Data retrieval from Wikipedia on 9 July, 2013 and the analysis were performed using R; charts were generated using ggplot2, googleVis and wordcloud. More information can be found in the [code used for this analysis at github](https://github.com/patilv/IndiasliceWik)

# Objective
Present information regarding the following visually, using charts.

1. Official languages, sex ratio, percentage (or ratio) of urban to total population and literacy rates across different states and union territories (UTs) of India.
2. Different religions of the country and demographic variables, such as literacy rates and sex ratios.


# Data
Data on variables with respect to states and UTs were downloaded from [this page on Wikipedia](http://en.wikipedia.org/wiki/States_and_union_territories_of_India) (tables related to States and Union Territories of India). Data on different religions and demographic variables were downloaded from [this page on Wikipedia](http://en.wikipedia.org/wiki/Demographics_of_India) (table 2, Census Information for 2001). Since these pages can be changed, a copy of these have been downloaded and a pdf version of both pages can be [found in this document.](https://dl.dropboxusercontent.com/u/56796392/India/WikipediaIndiaPagesforStudy.pdf)

The following tables were arrived at after data were cleaned. (You can click on the header of any column to arrange the table based on that column.)

**States and Union Territories of India (with some demographic information)**

<iframe width="100%" height="480" src="//dl.dropboxusercontent.com/u/56796392/India/stateuttabledisplay.html" frameborder="0"> </iframe>

**Religions in India (with some demographic information)**

<iframe width="100%" height="250" src="//dl.dropboxusercontent.com/u/56796392/India/reltabledisplay.html" frameborder="0"> </iframe>

# Results

Let's focus on the data presented in the first table above.

**Literacy Rate (in %) of different states and UTs (You can hover over the map to get corresponding values)**

<iframe width="100%" height="500" src="//dl.dropboxusercontent.com/u/56796392/India/litratechart.html" frameborder="0"> </iframe>


[![](http://3.bp.blogspot.com/-GIz78GPgGKg/Ud2dmvLc71I/AAAAAAAACVE/XMQheyl4IKM/s400/LiteracyRatedot.png)](http://3.bp.blogspot.com/-GIz78GPgGKg/Ud2dmvLc71I/AAAAAAAACVE/XMQheyl4IKM/s1600/LiteracyRatedot.png)


**Sex Ratio of different states and UTs** (It is a measure of number of females to 1000 males.)
**(You can hover over the map to get corresponding values)**

<iframe width="100%" height="500" src="//dl.dropboxusercontent.com/u/56796392/India/sexratiochart.html" frameborder="0"> </iframe>


[![](http://4.bp.blogspot.com/-kSezSOT4QM0/Ud2gnU0UvgI/AAAAAAAACVU/oDRnHN4sabE/s400/SexRatiodot.png)](http://4.bp.blogspot.com/-kSezSOT4QM0/Ud2gnU0UvgI/AAAAAAAACVU/oDRnHN4sabE/s1600/SexRatiodot.png)

**Urban to Total Population Percent in Different States** (You can hover over the map to get corresponding values)


<iframe width="100%" height="500" src="//dl.dropboxusercontent.com/u/56796392/India/Urbanchart.html" frameborder="0"> </iframe>

[![](http://2.bp.blogspot.com/-nR97BjF7g6I/Ud2i5UXsEWI/AAAAAAAACVk/5hB1Z0WHsL0/s400/Urbanpopdot.png)](http://2.bp.blogspot.com/-nR97BjF7g6I/Ud2i5UXsEWI/AAAAAAAACVk/5hB1Z0WHsL0/s1600/Urbanpopdot.png)

**Number of Official Languages in different States and UTs**


[![](http://2.bp.blogspot.com/-NnS0djTeHME/Ud2lRwLLRsI/AAAAAAAACV0/FvQ3t21vtI4/s400/Numlangsperstate.png)](http://2.bp.blogspot.com/-NnS0djTeHME/Ud2lRwLLRsI/AAAAAAAACV0/FvQ3t21vtI4/s1600/Numlangsperstate.png)

**Which Languages are more popular (are designated as an "Official Language" by different states and UTs)? 

[![](http://1.bp.blogspot.com/-EpxEFQml5IA/Ud2mCXZTAZI/AAAAAAAACWA/umnStLWrfQg/s320/LangsWordCloud.png)](http://1.bp.blogspot.com/-EpxEFQml5IA/Ud2mCXZTAZI/AAAAAAAACWA/umnStLWrfQg/s1600/LangsWordCloud.png)   

[![](http://1.bp.blogspot.com/-U-33kAsn8KI/Ud2mIUb6F0I/AAAAAAAACWI/t8zVUduFx0s/s320/PopularOfficialLangsdot.png)](http://1.bp.blogspot.com/-U-33kAsn8KI/Ud2mIUb6F0I/AAAAAAAACWI/t8zVUduFx0s/s1600/PopularOfficialLangsdot.png)


**Relationship between Sex Ratio, Urban To Total Population Percent, Literacy Rate, and Number of Official Languages**
(For scaling purposes in the graph below, Sex Ratio was divided by 10, making it number of females to 100 males. In response to a comment (see below), it is to be clarified that the states in the graph below were arranged in increasing order of sex ratio (Daman and Diu was lowest and Kerala was highest.)

[![](http://4.bp.blogspot.com/-fd7lCr8Hydc/Ud2nf48JtSI/AAAAAAAACWY/ffXXo6rtEs8/s400/4varsdotline.png)](http://4.bp.blogspot.com/-fd7lCr8Hydc/Ud2nf48JtSI/AAAAAAAACWY/ffXXo6rtEs8/s1600/4varsdotline.png)

**Correlation Matrix**

[![](http://2.bp.blogspot.com/-bxQUzRugzQ0/Ud2nmbMZ-_I/AAAAAAAACWg/ndkKPe1yL3c/s400/CorrMatrix.png)](http://2.bp.blogspot.com/-bxQUzRugzQ0/Ud2nmbMZ-_I/AAAAAAAACWg/ndkKPe1yL3c/s1600/CorrMatrix.png)

The correlation coefficients do not attain significance at an alpha of .05, suggesting that there is no relationship between these variables.

**Religion and Demographics**
Let's take a brief look at data from the religion and demographics table in the two graphs below. For scaling purposes, in both graphs below, Sex Ratio related variables were divided by 10, making these variables number of females to 100 males.

[![](http://4.bp.blogspot.com/-eKRduIzEqdM/Ud2pi1Vz2II/AAAAAAAACWw/1aKBKkHqSlA/s400/ReligionandDemo-1.png)](http://4.bp.blogspot.com/-eKRduIzEqdM/Ud2pi1Vz2II/AAAAAAAACWw/1aKBKkHqSlA/s1600/ReligionandDemo-1.png)

[![](http://3.bp.blogspot.com/-HS5BDj-l6gQ/Ud2p0gsQuyI/AAAAAAAACW4/DutUT5e8zrQ/s400/ReligionandDemo-2.png)](http://3.bp.blogspot.com/-HS5BDj-l6gQ/Ud2p0gsQuyI/AAAAAAAACW4/DutUT5e8zrQ/s1600/ReligionandDemo-2.png)
