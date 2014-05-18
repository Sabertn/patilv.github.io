---
layout: post
title:  "Short tales of two NCAA basketball conferences (Big 12 and West Coast) using graphs"
description: "ncaa sports"
tags: [R, ggplot2, shiny]
comments: true
share: true
---

Having been at the University of Kansas (Kansas Jayhawks) as a student and now working at Gonzaga University (Gonzaga Bulldogs), discussions about college basketball are inescapable. This post uses R, ggmap, ggplot2 and the shiny server to graphically visualize relationships between few basketball related variables for two NCAA basketball conferences - Big 12 and the West Coast conference. Code used to generate graphs in this post and for the shiny server application referred to in the post [can be found here.](https://github.com/patilv/ESPNBball)
 
A visit to espn.com's page at [http://espn.go.com/mens-college-basketball/teams](http://espn.go.com/mens-college-basketball/teams) shows a listing of universities in different conferences. The image below presents one such example. 
 
<img src="http://1.bp.blogspot.com/-CBb9C6F8ymA/UgU0-A28XFI/AAAAAAAACaU/_4NHRU3cq7I/s640/espn1.png" height="388" width="400" alt="">

A click on the "Stats" link for a school will take you to a page like this.

<img src="http://2.bp.blogspot.com/-atCSsDSmohM/UgkfjUw53PI/AAAAAAAACd8/KKiWoBHpYvk/s400/espn2.png" height="388" width="400" alt="">

The page provides two tables - one of game statistics - total games played and the per game statistics for the season for all players from that team and the second, cumulative numbers for the entire season. Tables in this format are useful, but they do not provide information on
relationships between variables, between teams, or between conferences. So, the objective of this post is to visualize few of these relationships. In order to do this, we do the following.  
 
## Steps
 
1. Find a way to extract data from the website. Remember, each page for a college provides information on only one season, but information on 12 seasons is available.  This is done using a function developed to scrape the site.
2. Clean and prepare the data.
3. Prepare preliminary graphs, and lastly,
4. Make the graph generation process interactive for people to focus on their favorite teams or variables.
 
## Scope of this post

1. We focus only on the first of the two tables of statistics provided by espn.com (see the previous image) - total games played and per game statistics. Please note that these are player level data. 
2. This post does not look at individual players, by name, in different teams - so it does not identify best players on any variable -- but it uses player level data to study teams and conferences.
3. We look at only 20 teams, 10 each in the West Coast Conference and Big 12 - but with some extra time, interest, and patience (TIP), it can be used for the remaining [331 Division 1 teams in 30 different basketball conferences](http://en.wikipedia.org/wiki/College_basketball#Conferences).
4. Not all questions pertaining to variables studied are answered and not all graphical formats explored. For example, we do not have data on the win/loss record or of the competition teams faced.
 
## The fun begins
 
### Step 1: Extracting Data 
The image previously presented of a typical statistics page from espn has certain distinct elements.

1. Each page has two tables, the first about game statistics and the second about the season (cumulative numbers for the season), they have the same headers.
2. The URL for a page had three different parts.

<img src="http://3.bp.blogspot.com/-Qnizd0BeqqY/UgVAVRY8PjI/AAAAAAAACaw/ybQqmmM9XyU/s640/espn3.png" alt="">

1. Part 1 has the team id, Part 2 the year, and Part 3 was the team name.
2. The second part, year, represents a season --- so when Part 2 is 2012, the page described the 2011-12 season. This is something to remember to make the necessary change in the data.
3. The basic idea is to create a function, which does the following. 
  1. Take in Part 1 and Part 3, among any other variables we deem appropriate as inputs;
  2. Loop through pages representing different seasons for a team; 
	3. From each page extract two tables and update two master data frames with data from these two tables --- two because we have game stats and season stats (the latter is not used for analysis in this post -- but the data is available for anyone wishing to look at them). This function should then be used to extract data for 20 universities.

First the packages required for all of this code.

{% highlight css %} 
library(XML)
library(ggmap)
library(ggplot2)
library(plyr)
{% endhighlight %}

Initialize two empty master data frames, which we'll call Gamestatistics and Seasonstatistics, and provide column names from the two tables.

{% highlight css %}
Gamestatistics=as.data.frame(matrix(ncol=16))
names(Gamestatistics)
= c("Player", "GP", "MIN", "PPG", "RPG", "APG", "SPG", "BPG", "TPG", "FG%", "FT%", "3P%","Year","Team","City","Conference")

Seasonstatistics=as.data.frame(matrix(ncol=20))
names(Seasonstatistics)
= c("Player", "MIN", "FGM", "FGA", "FTM", "FTA", "3PM", "3PA", "PTS", "OFFR", "DEFR", "REB", 
"AST",  "TO", "STL", "BLK","Year","Team","City","Conference")
{% endhighlight %}

Note that we have created columns for Year, Team, City, and Conference - variables beyond the columns provided by the two tables and will either have to be calculated or manually determined. For each of the 20 colleges of interest from the 2 conferences, we can prepare something like the following.

{% highlight css %}
URLpart1="http://espn.go.com/mens-college-basketball/team/stats/_/id/2250/year/"
URLpart3 ="/gonzaga-bulldogs"
Team="Gonzaga Bulldogs"
City="Spokane, WA"
Conference="West Coast"
{% endhighlight %}

The city information was obtained from Wikipedia for those I didn't know and the other information was available on the espn page for that university. Once we have prepared the parameters required to send to our function (getData), we then call on it. Remember that the function should return two tables. This we collect in a list named gameandseasonstats and extract the updated master tables - Gamestatistics and Seasonstatistics tables from the list.
 
{% highlight css %}
gameandseasonstats=getData(URLpart1,URLpart3,Team,City,Conference)
Gamestatistics=gameandseasonstats[[1]]
Seasonstatistics=gameandseasonstats[[2]]
{% endhighlight %}


Now the function.

{% highlight css %}
getData=function(URLpart1,URLpart3,Team,City,Conference){
for (i in 2002:2013){
URL=paste(paste(URLpart1,as.character(i),sep=""),URLpart3,sep="")
tablesfromURL = readHTMLTable(URL)
gamestat=tablesfromURL[[1]]
names(gamestat) = c("Player", "GP", "MIN", "PPG", "RPG", "APG", "SPG",
"BPG", "TPG", "FG%", "FT%", "3P%")
gamestat$Year=i
gamestat$Team=Team
gamestat$City=City
gamestat$Conference=Conference
Gamestatistics=rbind(gamestat,Gamestatistics)
seasonstat=tablesfromURL[[2]]
names(seasonstat) = c("Player", "MIN", "FGM", "FGA", "FTM", "FTA",
"3PM", "3PA", "PTS", "OFFR", "DEFR", "REB", "AST",  "TO", "STL", "BLK")
seasonstat$Year=i
seasonstat$Team=Team
seasonstat$City=City
seasonstat$Conference=Conference
Seasonstatistics=rbind(seasonstat,Seasonstatistics)
}
return(list(Gamestatistics,Seasonstatistics))
}
{% endhighlight %}

What this does is the following.

1. Receive parameters we send to the function - getData
2. For every year's page, from 2002-2013, it assembles the complete URL of the page by adding URLpart1, the year, and URLpart3 together.
3. Gets the two tables and stores them in two temporary tables --- gamestat and seasonstat
4. Adds new columns for year, team, city, and conference.
5. Add these rows to the respective master tables - Gamestatistics and Seasonstatistics and return them in a list, which we retrieve outside the function and reuse them for the next school.

Now, we have collected data on 2 tables for 20 schools from 2 different conferences from 240 different pages from espn.com. On to the next stage.
 
### Step 2 Clean and Prepare the Data
 
The dataframes have three types of rows which need to be removed. These are instances where the value of "Players" is either "Players", "Total", or "NA" (remember, we initialized empty dataframes). This is from the way tables were read by our function. That's easy.  

{% highlight css %}
Gamestatistics=Gamestatistics[which(Gamestatistics$Player!="NA"),]
Gamestatistics=Gamestatistics[which(Gamestatistics$Player!="Player"),]
Gamestatistics=Gamestatistics[which(Gamestatistics$Player!="Totals"),]
{% endhighlight %}

Converting few variables to factors and few to numbers was accomplished
by these two lines.

{% highlight css %}
for (i in 2:12){Gamestatistics[, i] = as.numeric(as.character(Gamestatistics[,i]))}
for(i in 14:16){Gamestatistics[,i]=as.factor(Gamestatistics[,i])}
{% endhighlight %}

Then, columns were renamed to explain each variable completely, so PPG became Points.Per.Game. This could've done this at the very beginning, but I didn't have the foresight.

{% highlight css %}
names(Gamestatistics) = c("Player", "Games.Played", "Minutes", "Points.Per.Game", "Rebounds.Per.Game", 
"Assists.Per.Game","Steals.Per.Game", "Blocks.Per.Game", "Turnovers.Per.Game", "Field.Goal.Percent", "Free.Throw.Percent", 
"Three.Point.FieldGoal.Percent", "Year", "Team", "City","Conference")
{% endhighlight %}

And the last thing left was converting years back to seasons ---  so 2002 became "2001-2002", accomplished using this for years between 2002 and 2013.

{% highlight css %}
Gamestatistics$Year<-gsub("2002", "2001-2002", Gamestatistics$Year)
{% endhighlight %}

Remember, these changes are required for the second table as well --- Seasonstatistics, which we don't use for the post. However, both these cleaned dataframes are available for anyone to play with. They are with the [code at the github link](https://github.com/patilv/ESPNBball) provided previously.
 
### Step 3: Prepare preliminary graphs
 
Which 20 schools did we collect data on?

{% highlight css %}
ggplot(Gamestatistics,aes(x=Conference,y=City,color=Conference))+ geom_text(data=Gamestatistics,aes(label=Team))+
 theme(axis.text.x = element_text(color="black",size=12))+ theme(axis.text.y =
element_text(color="black",size=12))+theme(legend.position="none")+labs(y="",x="")
{% endhighlight %}

<img src="http://3.bp.blogspot.com/-Zh0PC7hwSUQ/UgVVZ7odqtI/AAAAAAAACbA/EslvhCI_mgg/s640/schoolstable.png" alt="">

Let's plot these cities on a map. First, get the US map from osm, get the list of cities from our data, get their latitudes and longitudes, and add this information to our data.
 
{% highlight css %}
location=c(-125,24.207,-70,50) # It took a bit to figure these coordinates out - 
# zoom to the appropriate location and level using openstreetmap.org and find coordinates from the # export link
map=get_map(location=location,maptype="roadmap",source="osm")
usmap=ggmap(map)
locs=geocode(as.character(unique(Gamestatistics$City))) # find the 20 cities from the data and identify their latitude and longitude; 
# combine City information

locs$City=unique(Gamestatistics$City)
Gamestatistics$lat=locs$lat[ match(Gamestatistics$City,locs$City)]# bring latitude and longitude information to main data frame
Gamestatistics$lon=locs$lon[ match(Gamestatistics$City,locs$City)]
{% endhighlight %}

And, the plot.

{% highlight css %}
usmap+geom_point(data=Gamestatistics,aes(x=lon,y=lat,color=Conference),size=7)+ ggtitle("Location of WCC and Big 12 Schools")
{% endhighlight %}

<img src="http://3.bp.blogspot.com/-Wd_Jv4qy1C8/UgVXPRO6oII/AAAAAAAACbY/0SG5kq8ZEZA/s640/schoolsmap.png" alt="">

1. BYU is in Utah, which isn't a coastal state, unlike the other schools from the WCC.
2. WVU doesn't exactly fit the region of the other Big 12 schools. 
3. BYU and WVU recently joined these conferences.
 
Just a thought: On what bases are conferences named? Big 12 has 10 teams, but Big Ten has 12? Clearly, there appears to be a branding issue. PAC-10 did change to PAC-12 after the recent addition of two new teams. Hmm. 
 
Let's plot histograms of some variable, say Points.Per.Game, for all teams. 
 
{% highlight css %}
ggplot(Gamestatistics,aes(x=Points.Per.Game, fill=Team))+
geom_histogram()+ggtitle("Histogram of Points.Per.Game for All Teams - Data Collapsed Across All Years")+ facet_wrap(~Team,ncol=4) + 
theme(legend.position="none")
{% endhighlight %}

<img src="http://3.bp.blogspot.com/-kwmd0JxRME4/UgbfhUey44I/AAAAAAAACck/H5PeKemH-R0/s640/histograms.png" alt="">

We could also compare the distributions of two different schools on one variable --- let's take a look at Gonzaga Bulldogs and Kansas Jayhawks on say, Points.Per.Game.

{% highlight css %}
ggplot(subset(Gamestatistics,Team %in% c("Gonzaga Bulldogs","Kansas
Jayhawks")),aes(x=Points.Per.Game, fill=Team))+ 
geom_density(alpha=.3)+ ggtitle("Kernel Density Plots of
Points.Per.Game for Gonzaga Bulldogs and Kansas Jayhawks for all
Years")+ facet_wrap(~Year,ncol=4)
{% endhighlight %}

<img src="http://1.bp.blogspot.com/-f-jP_n_jgiw/UgVbYZ7cJPI/AAAAAAAACcE/UfBNen9-51w/s640/2schoolskdf.png" alt="">


We might also be interested in seeing how the mean points per game of team players change over years for different teams.

{% highlight css %}
# Mean calculation of Points.Per.Game of Team players for a season
ppgmean=ddply(Gamestatistics,.(Team,Year),summarize,Mean.Points.Per.Game=mean(Points.Per.Game))
#Plot
ggplot(ppgmean,aes(x=Year,y=Mean.Points.Per.Game,color=Team,group=Team))+
geom_point()+geom_line()+facet_wrap(~Team,ncol=4)+theme(legend.position="none")+
theme(axis.text.x = element_text(angle=-90))+ggtitle("Mean Points Per
Game of Players of Different Teams in Different Seasons") 
{% endhighlight %}

<img src="http://2.bp.blogspot.com/-NjYeCVXzFBE/UggojW3ZfqI/AAAAAAAACdc/gZ-Bd4jqKDI/s640/meanppgteamsfinal.png" alt="">

Alternately, we might be interested in how the mean points per game of team players changed for two teams, across different seasons.
 
{% highlight css %}
# Mean points per game comparison for two teams, say, Gonzaga and Kansas, over years
ggplot(subset(ppgmean,Team %in% c("Gonzaga Bulldogs","Kansas
Jayhawks")),aes(x=Year,y=Mean.Points.Per.Game,color=Team,group=Team))+
geom_point()+geom_line()+ggtitle("Mean Points Per Game of Players of
Gonzaga Bulldogs and Kansas Jayhawks in Different Seasons")
{% endhighlight %}

<img src="http://2.bp.blogspot.com/-Vw4hShWS1iw/Uggnrpe3QWI/AAAAAAAACdU/IiKnseTaHE8/s640/meanppgkugufinal.png" alt="">

We could also look at relationships between two variables (Points per game and Assists.Per.Game) in teams across different years and add in a LOESS curve.

{% highlight css %}
ggplot(Gamestatistics,aes(x=Points.Per.Game, y=Assists.Per.Game,
color=Team))+ geom_jitter()+ geom_smooth(method='loess',level=0,size=1,aes(color=Team))+
ggtitle("Scatter Plots with LOESS smoothing of Points.Per.Game and
Assists for All Teams -- Data Collapsed Across All Years")+ facet_wrap(~Team,ncol=4) +
theme(legend.position="none")
{% endhighlight %}

<img src="http://3.bp.blogspot.com/-U2HrXNuTvHU/UgbgE6goDXI/AAAAAAAACcs/p2tZbjwy2Cs/s640/loess.png" alt="">

We could also compare the relationship of two variables - points per game and assists per game, for two or more schools.
 
{% highlight css %}
ggplot(subset(Gamestatistics,Team %in% c("Gonzaga Bulldogs","Kansas Jayhawks")),aes(x=Points.Per.Game, y=Assists.Per.Game, color=Team))+
geom_jitter()+ geom_smooth(method='loess',level=0,size=1,aes(color=Team))+
facet_wrap(~Year,ncol=4)+ ggtitle("Scatter Plots with LOESS smoothing of Points.Per.Game and
Assists for Gonzaga Bulldogs and Kansas Jayhawks -- Data Collapsed Across All Years")
{% endhighlight %}

<img src="http://3.bp.blogspot.com/-xvLN_kLECHc/UgVcXv5BYaI/AAAAAAAACcU/6kDJ7lXRDws/s640/2schoolsscatter.png" alt="">


### Step 4: Interactively generate graphs - for any combination of variable and teams
 
Of course, previously shown graphs could be generated for comparing both conferences and we could also have other variables of interest that we might want to compare different schools or conferences on. It would be unwieldy to present graphs of all possibilities here. Introducing
interactivity by letting you play around with variables and schools will help. For this, we rely on the shiny server platform from RStudio.  [Our shiny server application uses three preloaded data files - Gamestatisticscleaned.rda, and files for team-wise and conference-wise
means (labeled meansteams.rda and meansconferences.rda, respectively) of all variables for all years and presents 9 different graphs.](http://glimmer.rstudio.com/vivekpatil/ESPNBball/) The code to generate these additional data files is given below. 
 
{% highlight css %} 
meansteams=ddply(Gamestatistics,.(Team,Year),summarize,
Points.Per.Game=mean(Points.Per.Game),
Games.Played=mean(Games.Played),
Minutes = mean(Minutes),
Rebounds.Per.Game=mean(Rebounds.Per.Game),
Assists.Per.Game=mean(Assists.Per.Game),
Steals.Per.Game=mean(Steals.Per.Game),
Blocks.Per.Game=mean(Blocks.Per.Game),
Turnovers.Per.Game=mean(Turnovers.Per.Game),
Field.Goal.Percent=mean(Field.Goal.Percent),
Free.Throw.Percent=mean(Free.Throw.Percent),
Three.Point.FieldGoal.Percent=mean(Three.Point.FieldGoal.Percent)
)
meansconferences=ddply(Gamestatistics,.(Conference,Year),summarize,
Points.Per.Game=mean(Points.Per.Game),
Games.Played=mean(Games.Played),
Minutes = mean(Minutes),
Rebounds.Per.Game=mean(Rebounds.Per.Game),
Assists.Per.Game=mean(Assists.Per.Game),
Steals.Per.Game=mean(Steals.Per.Game),
Blocks.Per.Game=mean(Blocks.Per.Game),
Turnovers.Per.Game=mean(Turnovers.Per.Game),
Field.Goal.Percent=mean(Field.Goal.Percent),
Free.Throw.Percent=mean(Free.Throw.Percent),
Three.Point.FieldGoal.Percent=mean(Three.Point.FieldGoal.Percent)
)
save(meansteams,file="meansteams.rda")
save(meanconferences,file="meansconferences.rda")
{% endhighlight %}

The codes for the shiny server user interface (ui.r) and server (server.r) are [available through github.](https://github.com/patilv/ESPNBball) 

 <iframe width="100%" height="1500" src="//glimmer.rstudio.com/vivekpatil/ESPNBball/" frameborder="0"> </iframe>

## Concluding Remarks

1. The objective of this post was to visualize few relationships between game statistics presented for teams by espn.com for two NCAA basketball conferences - West Coast and Big 12.
2. Data were scraped from 240 different pages on espn.com 
3. Data on win/loss history or the competition teams faced was not available on the page and hence, not used.
4. Only one of two tables --- one concerning game statistics - was used for the analyses and the data from the second table, season statistics ---cumulative numbers for the entire season --- is available for download from [the previously provided link](https://github.com/patilv/ESPNBball).
5. I would appreciate any comments/suggestions you might have on the application or on the code. Thanks. 
