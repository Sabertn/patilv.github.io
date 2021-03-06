---
layout: page
permalink: /dataviz/index/
title: Data Visualization
comments: true
share: true
---
<center> <h1> MBUS 699/MKTG 489 : Fall 2014 : Gonzaga University </h1></center>

# Textbooks

1.  Few, Stephen (2012). Show Me the Numbers, 2nd Ed. Analytics Press: Burlingame, CA.
2.  Tufte, Edward (2001). The Visual Display of Quantitative Information. Graphics Press LLC: Cheshire: CT
3.  Stanton, Jeffrey and Robert De Graaf (2013). Introduction to Data Science (Version 3)  [Download here.](http://1drv.ms/1AOHzQo). [Code and text copy of book from here.]()
4.	Wickham, Hadley(2009). ggplot2: Elegant Graphics for Data Analysis. Springer:New York
5.	Xie, Yihui (2014). Dynamic Documents with R and Knitr. Taylor and Francis Group: Boca Raton, FL.
6.	Zhao, Yanchang (2013). R and Data Mining: Examples and Case Studies. San Diego: CA, Elsevier. [Download here.](http://cran.r-project.org/doc/contrib/Zhao_R_and_data_mining.pdf) [Code can be downloaded here.](http://www.rdatamining.com/books/rdm/code)




# Software and Hardware

R, R-Studio and other required packages should be setup on individual student's laptop. Every student must have access to a laptop, which s/he must bring to every class.


# Topics in Course (Discussion of few topics will be spread across multiple weeks)

1.  Introduction to Data visualization and R 
2.	Perception of visual information and Graph Types
3.	Design of data graphics
4.	R environment and RMarkdown 
5.	ggplot2 
6.	Interactive visualizations : ggvis, rCharts and googleVis
7.	Visualizations using maps 
8.	Visualization of textual information
9.	Network Visualizations using Gephi
10.	Interactivity using shiny apps

Course Resources
========================================================
Useful Links (A more comprehensive listing can be found on [my website's R-resources section](http://patilv.github.io/r-resources/)

* [R Markdown](http://rmarkdown.rstudio.com/)
* [knitr](http://yihui.name/knitr/)
* [ggplot2](http://ggplot2.org/)
* [ggvis](http://ggvis.rstudio.com/)
* [rCharts](http://rcharts.io/)
* [googleVis](http://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html)
* [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)
* [Gephi](https://gephi.github.io/)
* [shiny](http://shiny.rstudio.com/)

Select Readings
====================================================

#### Perception and Graph Types

1. [Healey: Perception in Visualization](http://www.csc.ncsu.edu/faculty/healey/PP/index.html)
2. [FusionCharts' Principles of Data Visualization](http://www.fusioncharts.com/whitepapers/downloads/Principles-of-Data-Visualization.pdf)
3. [Few: Effectively Communicating Numbers - Selecting the Best Means and Manner of Display](http://www.perceptualedge.com/articles/Whitepapers/Communicating_Numbers.pdf)

#### Design Issues

4. [How to graph badly: Notes from John Boyd's class on Scientific Visualization and Information Architecture](http://www-personal.umich.edu/~jpboyd/sciviz_1_graphbadly.pdf)
5. [The Gospel According to Tufte: : Notes from John Boyd's class on Scientific Visualization and Information Architecture](http://www-personal.umich.edu/~jpboyd/eng403_chap2_tuftegospel.pdf)
5A. A good resource on how to graph poorly - [By Karl Broman](https://github.com/kbroman/Talk_Graphs)

#### Issues in different graphs

6. [Quantitative versus Categorical](http://www.perceptualedge.com/articles/dmreview/quant_vs_cat_data.pdf): Few
7. [Continuous versus Categorical](http://eagereyes.org/basics/data-continuous-vs-categorical): Kosara
8. [Nathan Yau: Visualizing and comparing distributions](http://flowingdata.com/2012/05/15/how-to-visualize-and-compare-distributions/)
9. [Naomi Robbins: Dot plots: A Useful Alternative to Bar Charts](http://www.b-eye-network.com/view/index.php?cid=2468)
10. [Di Cook: Alternatives to stacked barcharts](http://dicook.github.io/2014/09/25/facetted-barcharts/) 
11. [When Bars Point Down](http://eagereyes.org/journalism/when-bars-point-down): Kosara: eagereyes
12. [Understanding Pie Charts](http://eagereyes.org/techniques/pie-charts): Kosara: eagereyes
13. [Few on box plots: Perceptual Edge](http://www.perceptualedge.com/articles/dmreview/boxes_of_insight.pdf)
14. [Parallel coordinates charts](http://eagereyes.org/techniques/parallel-coordinates): Kosara: eagereyes
15. [Parallel Coordinates charts](http://www.perceptualedge.com/articles/b-eye/parallel_coordinates.pdf)
16. [Few: Line graphs and irregular intervals](http://www.perceptualedge.com/articles/visual_business_intelligence/line_graphs_and_irregular_intervals.pdf)

17. [How Rainbow Color Maps Mislead](http://eagereyes.org/basics/rainbow-color-map): Kosara
18. [You only see colors you can name](http://eagereyes.org/blog/2011/you-only-see-colors-you-can-name): Kosara

19. [Data Visualization Checklist](http://stephanieevergreen.com/wp-content/uploads/2014/05/DataVizChecklist_May2014.pdf): Evergreen and Emery


## Slides

[1. Introduction](http://patilv.github.io/01-Introduction/#1) <br>

To do

  * Sign up for an account on [GitHub](www.github.com) and download the client for it. For [Windows, click here](https://windows.github.com/) and for [Mac, click here.](https://mac.github.com/) 
  * Sign up to receive [r-bloggers emails](www.r-bloggers.com)
  * [Download R](www.r-project.org)
  * [Download R-studio](www.rstudio.com)
  * [Download MikTex/latex installation](http://miktex.org/2.9/setup)
  
Assignment 1: Summarize issues of perception of graphs (Healey and Fusion Charts' links above). <br>


[2. Visual Perception and Variations in Graphs](http://patilv.github.io/02-PerceptionandVariationsinGraphs/#1) <br>

Assignment 2: Summarize Boyd's lecture notes on how to graph badly and on Tufte's gospel (see links above). <br>

[3. Variations in Graphs](http://patilv.github.io/03-VariationsinandDesignofGraphs) <br>

Assignment 3: Prepare a pdf manual of common base R plots from this blog post using Rmarkdown and pandoc. ([Link to blog post](http://patilv.com/Replication-of-few-graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/))


[4. Design of Graphs](http://patilv.github.io/04-DesignofGraphs)

* dplyr tutorial from [Kevin Markham](http://rpubs.com/justmarkham/dplyr-tutorial)
* tidyr tutorial from [RStudio's Blog](http://blog.rstudio.org/2014/07/22/introducing-tidyr/)

[5. Data manipulation using dplyr](http://patilv.com/dplyr)

[6. googleVis](http://patilv.com/googleVis-tutorial)
