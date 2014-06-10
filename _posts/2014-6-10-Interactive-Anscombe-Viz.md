---
layout: post
title: "Playing with Anscombe's Quartet in an interactive shiny ggvis environment"
description: "interactive Anscombe's"
tags: [R, ggplot2, scatterplot, ggvis, shiny]
comments: true
share: true
---
Anscombe's quartet is a set of four datasets with two variables (x and y) and 11 observations.It has been been used to demonstrate the importance of graphically displaying data. It has appeared not only in books (for example, in the first page of the first chapter of Tufte's seminal work, [Visual Display of Quantitative Information](http://www.edwardtufte.com/tufte/books_vdqi)), but also in scholarly papers (for example, see [Healy and Moody, 2014](http://kieranhealy.org/files/papers/data-visualization.pdf)), and blog posts (for example, [see Hirst](http://blog.ouseful.info/2011/08/30/the-visual-difference-%E2%80%93-r-and-anscombe%E2%80%99s-quartet/)). Here, I use  ggvis in the shiny environment to play with the quartet. The code for the post and the accompanying shiny app can be [found on my github site.](https://github.com/patilv/AnscombeViz) 

I must acknowledge the work of the team at R-Studio, which has provided all of the packages used for this post. 

### Anscombe's Quartet

<style>
iframe[seamless]{
    background-color: transparent;
    border: 0px none transparent;
    padding: 0px;
    overflow: hidden;
}
</style>





{% highlight r %}
library(ggplot2)
library(dplyr)
library(ggvis)
library(knitr)
# library(shiny)
anscombe <- as.data.frame(anscombe)
anscombereorder <- anscombe[, c(1, 5, 2, 6, 3, 7, 4, 8)]
kable(anscombereorder, format = "html", table.attr = "cellpadding=\"7\"", 
    row.names = TRUE)
{% endhighlight %}

<table cellpadding="7">
 <thead>
  <tr>
   <th align="left">   </th>
   <th align="right"> x1 </th>
   <th align="right"> y1 </th>
   <th align="right"> x2 </th>
   <th align="right"> y2 </th>
   <th align="right"> x3 </th>
   <th align="right"> y3 </th>
   <th align="right"> x4 </th>
   <th align="right"> y4 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> 1 </td>
   <td align="right"> 10 </td>
   <td align="right"> 8.04 </td>
   <td align="right"> 10 </td>
   <td align="right"> 9.14 </td>
   <td align="right"> 10 </td>
   <td align="right"> 7.46 </td>
   <td align="right"> 8 </td>
   <td align="right"> 6.58 </td>
  </tr>
  <tr>
   <td align="left"> 2 </td>
   <td align="right"> 8 </td>
   <td align="right"> 6.95 </td>
   <td align="right"> 8 </td>
   <td align="right"> 8.14 </td>
   <td align="right"> 8 </td>
   <td align="right"> 6.77 </td>
   <td align="right"> 8 </td>
   <td align="right"> 5.76 </td>
  </tr>
  <tr>
   <td align="left"> 3 </td>
   <td align="right"> 13 </td>
   <td align="right"> 7.58 </td>
   <td align="right"> 13 </td>
   <td align="right"> 8.74 </td>
   <td align="right"> 13 </td>
   <td align="right"> 12.74 </td>
   <td align="right"> 8 </td>
   <td align="right"> 7.71 </td>
  </tr>
  <tr>
   <td align="left"> 4 </td>
   <td align="right"> 9 </td>
   <td align="right"> 8.81 </td>
   <td align="right"> 9 </td>
   <td align="right"> 8.77 </td>
   <td align="right"> 9 </td>
   <td align="right"> 7.11 </td>
   <td align="right"> 8 </td>
   <td align="right"> 8.84 </td>
  </tr>
  <tr>
   <td align="left"> 5 </td>
   <td align="right"> 11 </td>
   <td align="right"> 8.33 </td>
   <td align="right"> 11 </td>
   <td align="right"> 9.26 </td>
   <td align="right"> 11 </td>
   <td align="right"> 7.81 </td>
   <td align="right"> 8 </td>
   <td align="right"> 8.47 </td>
  </tr>
  <tr>
   <td align="left"> 6 </td>
   <td align="right"> 14 </td>
   <td align="right"> 9.96 </td>
   <td align="right"> 14 </td>
   <td align="right"> 8.10 </td>
   <td align="right"> 14 </td>
   <td align="right"> 8.84 </td>
   <td align="right"> 8 </td>
   <td align="right"> 7.04 </td>
  </tr>
  <tr>
   <td align="left"> 7 </td>
   <td align="right"> 6 </td>
   <td align="right"> 7.24 </td>
   <td align="right"> 6 </td>
   <td align="right"> 6.13 </td>
   <td align="right"> 6 </td>
   <td align="right"> 6.08 </td>
   <td align="right"> 8 </td>
   <td align="right"> 5.25 </td>
  </tr>
  <tr>
   <td align="left"> 8 </td>
   <td align="right"> 4 </td>
   <td align="right"> 4.26 </td>
   <td align="right"> 4 </td>
   <td align="right"> 3.10 </td>
   <td align="right"> 4 </td>
   <td align="right"> 5.39 </td>
   <td align="right"> 19 </td>
   <td align="right"> 12.50 </td>
  </tr>
  <tr>
   <td align="left"> 9 </td>
   <td align="right"> 12 </td>
   <td align="right"> 10.84 </td>
   <td align="right"> 12 </td>
   <td align="right"> 9.13 </td>
   <td align="right"> 12 </td>
   <td align="right"> 8.15 </td>
   <td align="right"> 8 </td>
   <td align="right"> 5.56 </td>
  </tr>
  <tr>
   <td align="left"> 10 </td>
   <td align="right"> 7 </td>
   <td align="right"> 4.82 </td>
   <td align="right"> 7 </td>
   <td align="right"> 7.26 </td>
   <td align="right"> 7 </td>
   <td align="right"> 6.42 </td>
   <td align="right"> 8 </td>
   <td align="right"> 7.91 </td>
  </tr>
  <tr>
   <td align="left"> 11 </td>
   <td align="right"> 5 </td>
   <td align="right"> 5.68 </td>
   <td align="right"> 5 </td>
   <td align="right"> 4.74 </td>
   <td align="right"> 5 </td>
   <td align="right"> 5.73 </td>
   <td align="right"> 8 </td>
   <td align="right"> 6.89 </td>
  </tr>
</tbody>
</table>


The quartet has 4 datasets with two variables x and y. They have been displayed above as being x1 and y1, x2 and y2, x3 and y3, and lastly, x4 and y4. 

### Beauty of the Quartet

Basic statistical characteristics of these datasets are almost identical. See the table below. However, when they are graphed, differences between them are clearly visible.  


{% highlight r %}
anscombelong <- data.frame(x = unlist(anscombe[, 1:4]), y = unlist(anscombe[, 
    5:8]), datasource = rep(1:4, each = 11))
kable(anscombelong %>% group_by(datasource) %>% summarise(`x-mean` = mean(x), 
    `y-mean` = mean(y), `x-variance` = var(x), `y-variance` = var(y), `correlation-xy` = cor(x, 
        y)), table.attr = "cellpadding=\"3\"", format = "html", row.names = FALSE)
{% endhighlight %}

<table cellpadding="3">
 <thead>
  <tr>
   <th align="right"> datasource </th>
   <th align="right"> x-mean </th>
   <th align="right"> y-mean </th>
   <th align="right"> x-variance </th>
   <th align="right"> y-variance </th>
   <th align="right"> correlation-xy </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="right"> 1 </td>
   <td align="right"> 9 </td>
   <td align="right"> 7.501 </td>
   <td align="right"> 11 </td>
   <td align="right"> 4.127 </td>
   <td align="right"> 0.8164 </td>
  </tr>
  <tr>
   <td align="right"> 2 </td>
   <td align="right"> 9 </td>
   <td align="right"> 7.501 </td>
   <td align="right"> 11 </td>
   <td align="right"> 4.128 </td>
   <td align="right"> 0.8162 </td>
  </tr>
  <tr>
   <td align="right"> 3 </td>
   <td align="right"> 9 </td>
   <td align="right"> 7.500 </td>
   <td align="right"> 11 </td>
   <td align="right"> 4.123 </td>
   <td align="right"> 0.8163 </td>
  </tr>
  <tr>
   <td align="right"> 4 </td>
   <td align="right"> 9 </td>
   <td align="right"> 7.501 </td>
   <td align="right"> 11 </td>
   <td align="right"> 4.123 </td>
   <td align="right"> 0.8165 </td>
  </tr>
</tbody>
</table>



The plots...



{% highlight r %}
ggplot(anscombelong, aes(x = x, y = y)) + geom_point() + geom_smooth(method = "lm", 
    se = FALSE) + annotate("text", x = 12, y = 4, label = lm_eqn(lm(y ~ 
    x, anscombelong)), color = "black", parse = TRUE) + ylim(3, 13) + xlim(4, 
    19) + facet_wrap(~datasource) + theme(legend.position = "none") + theme_bw()
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/img/2014-6-10-Interactive-Anscombe-Viz/unnamed-chunk-4.png) 


**The linear regression lines have the same equation.**

Please note that if you are replicating the above graph, you will need a function, whose code I didn't display here (but is available in the R markdown document). This function was used to print the regression line equation along with the graphs. It was copied from the discussion on [StackOverflow](http://stackoverflow.com/questions/7549694/ggplot2-adding-regression-line-equation-and-r2-on-graph) and is available with the code for this Rmarkdown document.

### Interactivity using ggvis in a shiny application

* You can hover over the points to see the specific x- and y-values.
* This animated visualization can flip across the 4 datasets and show how the regression line remains the same. Press the "Start Flipping" link at the top right of this plot.


<iframe frameborder="0" allowtransparency="true" scrolling="no" height="450" width="100%" src="https://patilv.shinyapps.io/AnscombeVizshiny/"></iframe>
