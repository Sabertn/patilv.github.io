---
layout: post
title: "Using great circles and ggplot2 to map arrival/departure of 2014 US Open Tennis Players"
description: "US Open"
tags: [R, ggplot2]
comments: true
share: true
---
This was one of the few visualizations I worked on during the 2014 US Open Tennis Championships. Thanks to [Alex Bresler](https://twitter.com/abresler) and [Aragorn Technologies](https://github.com/AragornTech) for the data and opportunity to work with a great group of people. In this one, we'll take a look at player's countries, particularly the potential flight paths to and from New York City. For this, connections between countries and NYC were created using great circles. We will also modify the opacity of connecting arcs based on the number of players traveling from a particular country.   

My first exposure to great circles was from Nathan Yau's excellent tutorial at flowingdata on [How to map connections with great circles](http://flowingdata.com/2011/05/11/how-to-map-connections-with-great-circles/). In it, Nathan shows how to draw connecting lines using ```gcIntermediate()``` from the ```geosphere``` package and uses them to create maps of airline flights for different carriers in the US. Most of my code, however, comes from a blog post at AnthroSpace titled [Great Circles on a recentered worldmap in ggplot](http://web.stanford.edu/~cengel/cgi-bin/anthrospace/great-circles-on-a-recentered-worldmap-in-ggplot). In that post, AnthroSpace recentered the world map and showed data on flights out of Beijing, China. A section of the code from AnthroSpace's post was also used in this post with a beautiful output at [spatial.ly for mapping the world's biggest airlines.](http://spatial.ly/2012/06/mapping-worlds-biggest-airlines/). 

Code and data for this post can be found on my [github site here.](https://github.com/patilv/USOpengreatcircles)

## Data

Data on countries of US Open Players were gathered from the different brackets.


{% highlight r %}
library(ggplot2)
library(ggmap)
library(geosphere)
library(plyr)

mensbracket=read.csv("mensbracket.csv") 
ladiesbracket=read.csv("ladiesbracket.csv")
usopenbracket=rbind(mensbracket,ladiesbracket) # combining the two genders
usopencountry=as.data.frame(table(usopenbracket$country)) # number of players from different countries
colnames(usopencountry)=c("Country","Players") # modifying column names
kable(head(usopencountry))
{% endhighlight %}



|Country   | Players|
|:---------|-------:|
|Argentina |       8|
|Australia |      12|
|Austria   |       5|
|Belgium   |       6|
|Bosnia    |       1|
|Brazil    |       2|

## Latitude and longitude information of different countries

We do this by geocoding the countries using the function from ```ggmap``` which uses google map's API. 


{% highlight r %}
usopencountry=cbind(usopencountry,geocode(as.character(usopencountry$Country)))
kable(head(usopencountry))
{% endhighlight %}



|Country   | Players|    lon|    lat|
|:---------|-------:|------:|------:|
|Argentina |       8| -63.62| -38.42|
|Australia |      12| 133.78| -25.27|
|Austria   |       5|  14.55|  47.52|
|Belgium   |       6|   4.47|  50.50|
|Bosnia    |       1| -73.11| -36.79|
|Brazil    |       2| -51.93| -14.23|

Past experience of mine has suggested that some of the results of geocoding go off the mark. Although we could use this function with precise addresses, at times, we might want to use country names or names of institutions in different locations to geocode. So, some error should be expected. (The exact location of the geocoded spot for the US, for example, is in Kansas.) After manually checking the latitude and longitude information using google maps, information for three countries had to be changed. (For example, Bosnia was shown as being in Chile and the location referring to New Zealand was a marker off the coast in the ocean.) We manually correct this. (I would be interested in a different but accurate approach, if there's one you are aware of.) And, let's not forget geocoding New York City.


{% highlight r %}
usopencountry[5,]$lon=18.383925 # Bosnia
usopencountry[5,]$lat=43.851882 # Bosnia
usopencountry[11,]$lon=33.3974183 # Cyprus
usopencountry[11,]$lat=35.1919937 # Cyprus
usopencountry[45,]$lon=174.885971 # New Zealand
usopencountry[45,]$lat=-40.900557 # New Zealand
nygeocode=geocode(as.character("New York City")) # This was fine
{% endhighlight %}

## On to the great circles.


{% highlight r %}
# Calculating routes 
routes = gcIntermediate(nygeocode, usopencountry[,c('lon', 'lat')], 200, breakAtDateLine=FALSE, addStartEnd=TRUE, sp=TRUE)

# fortifying the routes information to create a dataframe; function from ggplot's github site ... thanks to the comments section in AnthroSpace's post

fortify.SpatialLinesDataFrame = function(model, data, ...) {
  ldply(model@lines, fortify)
}

fortifiedroutes = fortify.SpatialLinesDataFrame(routes) 

# An id for each country
usopencountry$id=as.character(c(1:nrow(usopencountry))) 

# Merge fortified routes with usopencountry information
greatcircles = merge(fortifiedroutes, usopencountry, all.x=T, by="id") 

### Recentering the world map ####

center = 290 # takes positive values - US centered view is 260. This took a bit to figure out to avoid splitting of arcs in the final map.

# shifting coordinates to recenter great circles
greatcircles$long.recenter =  ifelse(greatcircles$long  < center - 180 , greatcircles$long + 360, greatcircles$long) 

# shifting coordinates to recenter worldmap
worldmap = map_data ("world")
worldmap$long.recenter =  ifelse(worldmap$long  < center - 180 , worldmap$long + 360, worldmap$long)

### Function to regroup split lines and polygons
# takes dataframe, column with long and unique group variable, returns df with added column named group.regroup
RegroupElements = function(df, longcol, idcol){  
  g = rep(1, length(df[,longcol]))
  if (diff(range(df[,longcol])) > 300) {          # check if longitude within group differs more than 300 deg, ie if element was split
    d = df[,longcol] > mean(range(df[,longcol])) # we use the mean to help us separate the extreme values
    g[!d] = 1     # some marker for parts that stay in place (we cheat here a little, as we do not take into account concave polygons)
    g[d] = 2      # parts that are moved
  }
  g =  paste(df[, idcol], g, sep=".") # attach to id to create unique group variable for the dataset
  df$group.regroup = g
  df
}

### Function to close regrouped polygons
# takes dataframe, checks if 1st and last longitude value are the same, if not, inserts first as last and reassigns order variable
ClosePolygons = function(df, longcol, ordercol){
  if (df[1,longcol] != df[nrow(df),longcol]) {
    tmp = df[1,]
    df = rbind(df,tmp)
  }
  o = c(1: nrow(df))  # rassign the order variable
  df[,ordercol] = o
  df
}

# regrouping
regroupedgreatcircles = ddply(greatcircles, .(id), RegroupElements, "long.recenter", "id")
regroupedworldmap = ddply(worldmap, .(group), RegroupElements, "long.recenter", "group")

# close polygons
worldmap.closedpolygons = ddply(regroupedworldmap, .(group.regroup), ClosePolygons, "long.recenter", "order")  
{% endhighlight %}

## Final leg, the plot. 

You can mess around with many parameters below. For example, the size of lines, colours of country borders, and a whole host of other things. 


{% highlight r %}
ggplot() +
  geom_polygon(aes(long.recenter,lat,group=group.regroup), size = 0.1, fill="black", colour = "#4D4D4D", data=worldmap.closedpolygons) +
  geom_line(aes(long.recenter,lat.x,group=group.regroup, color=Country, alpha=Players), size=1,data= regroupedgreatcircles)+ 
  theme(panel.grid.minor = element_blank(), panel.grid.major = element_blank(),  axis.ticks = element_blank(), axis.title= element_blank(), 
         axis.text = element_blank(),legend.position = "none")+
  ylim(-60, 90) +theme(panel.background = element_rect(fill = 'black'))+
  coord_equal()+annotate("text",x=max(worldmap.closedpolygons$long.recenter),y=-60,hjust=.9,size=3,
label=paste("Arrival/Departures of US Open Players","your name",sep="\n"),color="white") 
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/img/2014-9-17-USOpenCountries/unnamed-chunk-5.png) 
