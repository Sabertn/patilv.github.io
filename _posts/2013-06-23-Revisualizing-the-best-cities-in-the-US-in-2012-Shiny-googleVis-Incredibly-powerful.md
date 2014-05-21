---
layout: post
title: "Revisualizing the best cities in the US in 2012- Shiny + googleVis = Incredibly powerful"
description: "Best cities revisited"
tags: [googleVis, motionchart, R, Shiny]
comments: true
share: true
---
This is the last time I will talk about visualizing the best cities of 2012 based on [Bloomberg Businessweek's rankings.](http://www.businessweek.com/articles/2012-09-26/san-francisco-is-americas-best-city-in-2012) In an earlier post on this topic, [interactive applications to plot bar graphs and histograms](http://patilv.github.io/Interacting-on-demand-with-2012-best-cities-data-and-plotting-different-graphs-Experiments-with-ggplot2-on-shiny-server) for different characteristics defining different cities were discussed. They used [R Studio's shiny serve](http://www.rstudio.com/shiny/) and [ggplot2](http://ggplot2.org/). The reason I am still clinging on to this data is because of how pathetically painful (you can imagine the pain) it was to find out details about the best city in the original article. [This is not  uncommon. Rankings published by many media outlets suffer from this problem. I hope someone out  there is computing the trade offs between advertising dollars and frustration to customers.] With one city per page, and beginning their discussion with the 50th best city, they actually expected us  to go through about 50 pages to find out more about the best city.

What I did was have this data collected and organized into a spreadsheet by a student. I stripped out the textual description of the city and looked at different ways this could be presented. But something was missing there. It, in my opinion, didn't provide a coherent story. This is my last  attempt at doing so, and I try this using the shiny server and the [googleVis package](http://cran.r-project.org/web/packages/googleVis/googleVis.pdf). Using them, I bring in interactivity in plotting these cities on a map as well as study how any two characteristics are related to cities and their rankings. (Scatter plots, again, but using googleVis.) If you went through the source code, you'd realize that the ratio of functionality to number of lines of code is incredibly high. Very powerful tools. Please click on the following image to play with the application. The source code link is provided in the application.

<iframe width="1200" height="1000" src="//glimmer.rstudio.com/vivekpatil/bb50citiesrank" frameborder="0"> </iframe>
