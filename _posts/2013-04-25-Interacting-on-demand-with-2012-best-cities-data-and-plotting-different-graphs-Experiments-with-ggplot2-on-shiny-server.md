---
layout: post
title: "Interacting, on demand, with 2012 best cities data and plotting different graphs-Experiments with ggplot2 on shiny server"
description: "2012 best cities"
tags: [R, ggplot2, shiny]
comments: true
share: true
---

Data from slides on [Bloomberg businessweek's site.](http://images.businessweek.com/slideshows/2012-09-26/americas-50-best-cities)

In this post, I show how one can interact with a dataset and generate graphs on the fly (technically, I've predetermined which graphs to create, but it should not be difficult to build a menu of possible graphs). This required setting up the shiny server running on Ubuntu. This current server is being hosted by Gonzaga. Big thanks to Bob Toshack for help in trying to get the server public. Work in progress. In the meanwhile, I am using the services provided by RStudio for hosting this. Thanks a ton, RStudio, for this opportunity and the wonderful set of tools you have. And I am getting tired of this best cities dataset. So, the last few apps using that. Please click on the pictures below to go to the site and play with it. Remember to come back to go to the next set of interactive graphs.**[Update: The site has been embedded below. There is no longer a need to leave this site.]**

1.Generating bar plots and/or dot plots of any variable you choose (from the preloaded data).

<iframe width="1200" height="1000" src="//glimmer.rstudio.com/vivekpatil/bestcities/" frameborder="0"> </iframe>

2.Comparing distributions of two different variables (can be extended to more than 2 variables) using their bar graphs (can use other graphs as well).

<iframe width="1200" height="1000" src="//glimmer.rstudio.com/vivekpatil/bestcities2vars
" frameborder="0"> </iframe>

3.Exploring the relationship between two different variables for cities of different ranks.Scatter plots of rank of cities, by two variables.
  
<iframe width="1200" height="600" src="//glimmer.rstudio.com/vivekpatil/bestcities2varscatter" frameborder="0"> </iframe>

4.Extending the above scatter plot to simultaneously see two scatter plots and four variables.
 
<iframe width="1200" height="1000" src="//glimmer.rstudio.com/vivekpatil/bestcities4varscatter" frameborder="0"> </iframe>
