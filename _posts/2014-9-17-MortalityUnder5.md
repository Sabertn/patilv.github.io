---
layout: post
title: "Mortality Rate of Children Under 5 and Gender Differences"
description: "interactive Anscombe's"
tags: [R, rMaps, India]
comments: true
share: true
---
This post displays two animated choropleths. One for global mortality rates for children under 5 (per 1000 live births) and the second for the difference in global mortality rates for males and female children under 5 (per 1000).

This was put together after my wife sent a link to [this optimistic story on NPR's site.  It was regarding a reduction in mortality rates of children under 5](http://www.npr.org/blogs/goatsandsoda/2014/09/16/348991905/more-birthdays-for-kids-under-five-around-the-world) and it showed animated choropleths for three year's of data, 1972, 1992, and 2012.  I thought it was possible to have more information displayed in the animated choropleths than was made available using ```rMaps```. 

## Data

Data for different countries and variables were collected using the World Development Indicators (WDI) package, which accesses data provided by the World Bank. The R code for these can be found [on my github site.](https://github.com/patilv/Mortalityunder5)

## Mortality rates for children under 5 (per 1000 live births): 1970 through 2013.

1. Reduction in mortality rates are discernable.
2. Regions where data were not available are in black.

<style>
iframe[seamless]{
    background-color: transparent;
    border: 0px none transparent;
    padding: 0px;
    overflow: hidden;
}
</style>

<iframe frameborder="0" allowtransparency="true" scrolling="no" height="550" width="100%" src="http://bl.ocks.org/patilv/raw/410a1de459998f35599a/"></iframe>


## Mortality rate of females MINUS Mortality rate of males (Children under 5, per 1000, 1990 through 2013)

1. Only India has a positive difference (more female children then male children) 
2. Regions where data were not available are in black. 


<iframe frameborder="0" allowtransparency="true" scrolling="no" height="550" width="100%" src="http://bl.ocks.org/patilv/raw/a0311c4a4d8719d487f9/"></iframe>
