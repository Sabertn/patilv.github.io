---
layout: post
title: "Part 1 Base R - Replication of few graphs/charts in base R, ggplot2, and rCharts"
description: "education"
tags: [areachart, barchart, boxplot, correlation, densityplot, dotplot, ggplot2, histogram, linechart, R, rCharts, scatterplot]
comments: true
share: true
---
In these 3-part posts , I use a simulated dataset (7 variables -3 factor and 4 numeric - and a sample size of 50) to create graphs/charts using base R, and replicate them using ggplot2, and rCharts. This is not an attempt to create an exhaustive database of graphs/charts of all possible combinations, but it was an exercise to generate some of the common ones (in my view). These include dot plots, histograms, box plots, bar charts, scatter plots, density curves, and line graphs and a few more. I am sure the code can be further optimized  and it could use some finishing touches with many things like legends, axes labels, and color, but at the core, I think it does its job. Thanks to Ramnath Vaidyanathan for having answers to all questions and to the kind rCharts, ggplot2, and R community for the free knowledge base available on the Internet. The code for these pages can be found on github. 

### Part 2 Post (using ggplot2) Can be Found Here
### Part 3 Post (using rCharts) Can be Found Here

# Data
Let us begin by simulating our sample data of 3 factor variables and 4 numeric variables.


{% highlight r %}
## Simulate some data

## 3 Factor Variables
FacVar1=as.factor(rep(c("level1","level2"),25))
FacVar2=as.factor(rep(c("levelA","levelB","levelC"),17)[-51])
FacVar3=as.factor(rep(c("levelI","levelII","levelIII","levelIV"),13)[-c(51:52)])

## 4 Numeric Vars
set.seed(123)
NumVar1=round(rnorm(n=50,mean=1000,sd=50),digits=2) ## Normal distribution
set.seed(123)
NumVar2=round(runif(n=50,min=500,max=1500),digits=2) ## Uniform distribution
set.seed(123)
NumVar3=round(rexp(n=50,rate=.001)) ## Exponential distribution
NumVar4=2001:2050

simData=data.frame(FacVar1,FacVar2,FacVar3,NumVar1,NumVar2,NumVar3,NumVar4)
{% endhighlight %}


# One Variable: Numeric Variable


{% highlight r %}
plot(simData$NumVar1,type="o") ## Index plot
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-21.png) 

{% highlight r %}
hist(simData$NumVar1) ## histogram
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-22.png) 

{% highlight r %}
plot(density(simData$NumVar1)) ## Kernel density plot
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-23.png) 

{% highlight r %}
boxplot(simData$NumVar1) ## box plot
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-24.png) 


## One Variable: Factor Variable


{% highlight r %}
plot(simData$FacVar3) ## bar plot
{% endhighlight %}

![plot of chunk unnamed-chunk-3](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-31.png) 

{% highlight r %}

## pie chart - Not the best graph --- use with caution
counts=table(simData$FacVar3) ## get counts
labs=paste(simData$FacVar3,counts)## create labels
pie(counts,labels=labs) ## plot
{% endhighlight %}

![plot of chunk unnamed-chunk-3](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-32.png) 


# Two Variables: Two Numeric Variables

{% highlight r %}
plot(simData$NumVar1,type="o",ylim=c(0,max(simData$NumVar1,simData$NumVar2)))## index plot with one variable
lines(simData$NumVar2,type="o",lty=2,col="red")## add another variable
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-41.png) 

{% highlight r %}

## Let's draw density plots : https://stat.ethz.ch/pipermail/r-help/2006-August/111865.html
dv1=density(simData$NumVar1) 
dv2=density(simData$NumVar2)
plot(range(dv1$x, dv2$x),range(dv1$y, dv2$y), type = "n", xlab = "NumVar1(red) and NumVar2 (blue)",
     ylab = "Density")
lines(dv1, col = "red")
lines(dv2, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-42.png) 

{% highlight r %}

## scatterplots
plot(simData$NumVar1,simData$NumVar2)
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-43.png) 


## Two Variables: Two Factor Variables

{% highlight r %}
## Mosaic plot
plot(table(simData$FacVar2,simData$FacVar3))
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-51.png) 

{% highlight r %}

## barplots
bartable=table(simData$FacVar2,simData$FacVar3) ## get the cross tab
barplot(bartable,beside=TRUE, legend=levels(unique(simData$FacVar2))) ## plot 
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-52.png) 

{% highlight r %}
barplot(bartable, legend=levels(unique(simData$FacVar2))) ## stacked
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-53.png) 

{% highlight r %}
barplot(prop.table(bartable,2)*100, legend=levels(unique(simData$FacVar2))) ## stacked 100%
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-54.png) 


## Two Variables: One Factor and One Numeric

{% highlight r %}
## Box plots for the numeric var over the levels of the factor var
plot(simData$FacVar1,simData$NumVar1) 
{% endhighlight %}

![plot of chunk unnamed-chunk-6](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-61.png) 

{% highlight r %}

## density plot of numeric var across multiple levels of the factor var
level1=simData[simData$FacVar1=="level1",] 
level2=simData[simData$FacVar1=="level2",]

dv3=density(level1$NumVar1)
dv4=density(level2$NumVar1)

plot(range(dv3$x, dv4$x),range(dv3$y, dv4$y), type = "n", xlab = "NumVar1 at Level1 (red) and NumVar1 at Level2 (blue)",ylab = "Density")
lines(dv3, col = "red")
lines(dv4, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-6](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-62.png) 

{% highlight r %}

## Mean of one numeric var over levels of one factor var
meanagg=aggregate(simData$NumVar1, list(simData$FacVar3), mean)

dotchart(meanagg$x,labels=meanagg$Group.1) ## Dot Chart 
{% endhighlight %}

![plot of chunk unnamed-chunk-6](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-63.png) 

{% highlight r %}
barplot(meanagg$x,names.arg=meanagg$Group.1)## Bar plot 
{% endhighlight %}

![plot of chunk unnamed-chunk-6](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-64.png) 

{% highlight r %}
## Question: Is a bar plot even appropriate when displaying a mean--- a point?
{% endhighlight %}


# Three Variables: Three Factor Variables


{% highlight r %}
par(mfrow=c(1,2))

bar1table=table(level1$FacVar2,level1$FacVar3)
barplot(bar1table,beside=TRUE, main="FacVar1=level1")

bar2table=table(level2$FacVar2,level2$FacVar3)
barplot(bar2table,beside=TRUE, main="FacVar1=level2", legend=levels(unique(level2$FacVar2)))
{% endhighlight %}

![plot of chunk unnamed-chunk-7](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-7.png) 


## Three Variables: One Numeric and Two Factor Variables

{% highlight r %}
par(mfrow=c(1,1))
## boxplot of NumVar1 over an interaction of 6 levels of the combination of FacVar1 and FacVar2
boxplot(NumVar1~interaction(FacVar1,FacVar2),data=simData)
{% endhighlight %}

![plot of chunk unnamed-chunk-8](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-81.png) 

{% highlight r %}

## Mean of 1 Numeric over levels of two factor vars
meanaggg=aggregate(simData$NumVar1, list(simData$FacVar1,simData$FacVar2), mean)
meanaggg=meanaggg[order(meanaggg$Group.1),]
meanaggg$color[meanaggg$Group.2=="levelA"] = "red"
meanaggg$color[meanaggg$Group.2=="levelB"] = "blue"
meanaggg$color[meanaggg$Group.2=="levelC"] = "darkgreen"  

dotchart(meanaggg$x,labels=meanaggg$Group.2, groups=meanaggg$Group.1,color=meanaggg$color) ## dotchart
{% endhighlight %}

![plot of chunk unnamed-chunk-8](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-82.png) 

{% highlight r %}

interaction.plot(meanaggg$Group.2,meanaggg$Group.1,meanaggg$x,type="b", col=c(1:2),pch=c(18,24)) ## interaction plot - line plots of means
{% endhighlight %}

![plot of chunk unnamed-chunk-8](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-83.png) 

{% highlight r %}

## some a bar plot
par(mfrow=c(1,2))

level1=meanaggg[meanaggg$Group.1=="level1",]
level2=meanaggg[meanaggg$Group.1=="level2",]

barplot(level1$x,names.arg=level1$Group.2, main="FacVar1=level1")
barplot(level2$x,names.arg=level2$Group.2, main="FacVar1=level2")
{% endhighlight %}

![plot of chunk unnamed-chunk-8](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-84.png) 


## Three Variables: Two Numeric and One Factor Variables


{% highlight r %}
## Scatter plot with color identifying the factor variable
par(mfrow=c(1,1))
plot(simData$NumVar1,simData$NumVar2, col=simData$FacVar1)
legend("topright",levels(simData$FacVar1),fill=simData$FacVar1)
{% endhighlight %}

![plot of chunk unnamed-chunk-9](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-9.png) 


## Three Variables: Three Numeric Variables 


{% highlight r %}
## NumVar4 is 2001 through 2050... possibly, a time variable - use that as the x-axis
plot(simData$NumVar4,simData$NumVar1,type="o",ylim=c(0,max(simData$NumVar1,simData$NumVar2)))## join dots with lines

lines(simData$NumVar4,simData$NumVar2,type="o",lty=2,col="red")## add another line
{% endhighlight %}

![plot of chunk unnamed-chunk-10](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-101.png) 

{% highlight r %}

## Bubble plot - scatter plot of NumVar1 and NumVar2 with individual observations sized by NumVar3
# http://flowingdata.com/2010/11/23/how-to-make-bubble-charts/
radius <- sqrt( simData$NumVar3/ pi )
symbols(simData$NumVar1,simData$NumVar2,circles=radius, inches=.25,fg="white", bg="red", main="Sized by NumVar3")
{% endhighlight %}

![plot of chunk unnamed-chunk-10](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-102.png) 


# Scatterplot Matrix of all Numeric Vars, colored by a Factor variable

{% highlight r %}
pairs(simData[,4:7], col=simData$FacVar1)
{% endhighlight %}

![plot of chunk unnamed-chunk-11](/img/2013-11-7-Replication_of_few_graphs-charts-in-base-R-ggplot2-and-rCharts-part-1-base-R/unnamed-chunk-11.png) 


# References

Besides the link from flowingdata.com referred to in the context of the bubble plot, additional websites were used as references. 

* [http://www.harding.edu/fmccown/r/](http://www.harding.edu/fmccown/r/)
* [http://www.statmethods.net/](http://www.statmethods.net/)
