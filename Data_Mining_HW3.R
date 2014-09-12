############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 3 
### Graphics Skills
############################################################################################
############################################################################################

# The goals of this assignment are to: 
# 1. become familiar with the variety of plotting functions available in R,
# 2. learn which types of plots are appropriate for which types of data
# 3. gain practice in making plots that make the data stand out,
# facilitate comparison, and are information rich
# 4. gain additional experience working with data frames and vectors

# The help for plot.default describes many parameters that are  
# available for many of the plotting functions.
# Also, ?par provides help on many other plotting parameters.
# Some of these can be set in the plot function, while others
# are set in a call to par()

############################################################################################

# PLOT 1. World Record in Men's 200 meter run
# We might be curious about how much faster today's runners 
# are compared to runners 50 years ago. 

# A search on Wikipedia shows us tables of the times for
# male world record holders in 200 meters dating back to 1951.
# The data are available to you at:
# http://www.stanford.edu/~vcs/StatData/WR200MeterMen.csv

# Read this data file into R, using commands from class.
WR200MeterMen <- read.table(file = "http://www.stanford.edu/~vcs/StatData/WR200MeterMen.csv", 
                           header = TRUE, sep = ",")
head(WR200MeterMen)
#   Time        Athlete   Nationality Year Month
# 1 20.6 Andy Stanfield United States 1951   May
# 2 20.6 Andy Stanfield United States 1952  June
# 3 20.6    Thane Baker United States 1956  June
# 4 20.6   Bobby Morrow United States 1956   Nov
# 5 20.6 Manfred Germar  West Germany 1958   Oct
# 6 20.6     Ray Norton United States 1960 March

# Q1a. How many world records does this data frame contain?
dim(WR200MeterMen) # [1] 24  5
# the dataset has 24 observations and 5 variables
names(WR200MeterMen) # [1] "Time" "Athlete" "Nationality" "Year" Month"  
length(WR200MeterMen$Time) # [1] 24
# this is another way to investigate the number of observations of the vectors

# Q1b. Use R commands to find out who currently holds the world record in the 
# men's 200 meter
class(WR200MeterMen$Time) # [1] "numeric"
min(WR200MeterMen$Time) # [1] 19.19
WR200MeterMen$Athlete[WR200MeterMen$Time == min(WR200MeterMen$Time)]
# [1] Usain Bolt
# 15 Levels: Andy Stanfield Bobby Morrow Donald Quarrie Henry Carr Livio Berruti ... Usain Bolt
# First, I investigated if "Time" vector is numeric in order to determine if it can be sorted
# Next, I wanted to see what is the minimum time value (World Record)
# Finally, I inquired the name of the "Athelete", where the "Time" is at the minimum (World Record)

# Let's look at the relationship between date and time.
# Q1c. What type of variable (numeric (continuous or discrete), nominal ordinal)
# are year and times? (no need to use R code to answer this question)
# Year and Time are numeric continuous variables
class(WR200MeterMen$Year) # [1] "integer"
class(WR200MeterMen$Time) # [1] "numeric"

# When we are examining a variable to see how it changes in time, we typically make a line plot, 
# with time on the x-axes and the (x,y) values connected with line segments.
# In this case, we want our line plot to look like a step function
# to make it easier to see when the record was broken and how long the record stood.

# Q2a. Begin by making a line plot of year by times for these data.
# Don't bother to make it pretty yet; we will get to that later.
plot(x = WR200MeterMen$Year, y = WR200MeterMen$Time, type = "l")

# Q2b. Redo the plot using a date that incorporates the month as 
# well as the year. For example, in Sep 1960 the world record 
# was broken by Livio Berruti. Use a date of 1960.75 for this date.
WR200MeterMen$NumericMonth <- floor(match(substr(WR200MeterMen$Month, 1, 3), month.abb) / 12 * 100)
WR200MeterMen$NewDate <- as.numeric(paste(WR200MeterMen$Year, WR200MeterMen$NumericMonth, sep="."))
WR200MeterMen$NewDate
#  [1] 1951.41 1952.50 1956.50 1956.91 1958.83 1960.25 1960.33 1960.41 1960.58 1960.58 1960.75
# [12] 1962.50 1963.25 1964.33 1968.50 1968.83 1971.66 1975.50 1968.83 1979.75 1996.50 1996.66
# [23] 2008.66 2009.66
class(WR200MeterMen$NewDate) # [1] "numeric"

plot(x = WR200MeterMen$NewDate, y = WR200MeterMen$Time, type = "l")

# Q3. The current world record was set in 2008. If we want to
# show that this record still stands in 2013, we could add a 
# horizontal line segment to the plot from 2008 to 2013 at the 
# 2008 record time.  
# To do this: remake the plot and set the xlim parameter 
# so that 2013 is included in the x-axis scale;
# then use the points function with type = "l" to add the additional segment.
plot(x = WR200MeterMen$NewDate, y = WR200MeterMen$Time, type = "l", 
     xlim = c(min(WR200MeterMen$Year), 2013), lwd = 3)
points(x = c(max(WR200MeterMen$NewDate), 2013), 
       y = c(rep(WR200MeterMen$Time[WR200MeterMen$NewDate == max(WR200MeterMen$NewDate)], 2)),
       type ="l", lwd = 3)

# Q4. The 1996 record stood for several years.
# Let's make it easier to see this and include the name of the athlete 
# who set the record. This additional reference information makes
# our plot richer.
# Add a grey vertical lines at 1996.
# Add the runner's name next to the vertical line.
# To do this, you will need the abline() function, the text() function,
# and you might want to consider the cex, col, pos, adj parameters.
# Also, do not type in the athlete's name. Instead, use the Athlete 
# variable to access it.
plot(x = WR200MeterMen$NewDate, y = WR200MeterMen$Time, type = "l", 
     xlim = c(min(WR200MeterMen$Year), 2013), lwd = 3)
points(x = c(max(WR200MeterMen$NewDate), 2013), 
       y = c(rep(WR200MeterMen$Time[WR200MeterMen$NewDate == max(WR200MeterMen$NewDate)], 2)),
       type = "l", lwd = 3)
abline(v = WR200MeterMen$NewDate[WR200MeterMen$Year == 1996], lty = "dashed", 
       col = "grey", lwd = 2)
text(x = WR200MeterMen$NewDate[WR200MeterMen$Year == 1996][1], 
     y = WR200MeterMen$Time[WR200MeterMen$Year == 1996][1], 
     labels = WR200MeterMen$Athlete[WR200MeterMen$Year == 1996][1], 
     col = "darkgrey", cex = .8, pos = c(4,1), adj = 0, font = 4)

# Q5. Now we are ready to add other contextual information.
# Remake the plot adding axis labels and a title.
# THIS IS THE PLOT THAT SHOULD BE PRINTED AND TURNED IN.
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 3")
png ("HW3_plot1.png", height=600, width=800)
plot(x = WR200MeterMen$NewDate, y = WR200MeterMen$Time, type="l", 
     xlim = c(min(WR200MeterMen$Year), 2013), lwd = 3, 
     xlab = "Year", ylab = "World Record Time", font.axis = 4, font.lab = 4, 
     col.lab = "darkgrey")
title(main = "World Records for 200 meter men", sub = "( 1951 - 2013 )",
      cex.main = 1.5, font.main = 2, col.main = "darkgrey", 
      cex.sub = 0.9, font.sub = 4, col.sub = "darkgrey")
points(x = c(max(WR200MeterMen$NewDate), 2013), 
       y = c(rep(WR200MeterMen$Time[WR200MeterMen$NewDate == max(WR200MeterMen$NewDate)], 2)),
       type = "l", lwd = 3)
abline(v = WR200MeterMen$NewDate[WR200MeterMen$Year == 1996], lty = "dashed", 
       col = "grey", lwd = 2)
text(x = WR200MeterMen$NewDate[WR200MeterMen$Year == 1996][1], 
     y = WR200MeterMen$Time[WR200MeterMen$Year == 1996][1], 
     labels = WR200MeterMen$Athlete[WR200MeterMen$Year == 1996][1], 
     col = "darkgrey", cex = 1.5, pos = c(4,1), adj = 0, font = 4)
dev.off()

############################################################################################

# PLOT 2
# A lot of medal counting goes on during the Olympics.
# We might wonder about the relationship between number of medals
# a country has and the size of its population and its wealth.
# We collected data from various sources (ManyEyes, Guardian,
# ISO) to create this data frame with GDP, population, and other information
# about each country that participated in the Olympics.

# The data frame SO2012Ctry contains this information.
# It can be loaded into R with
load(url("http://www.stanford.edu/~vcs/StatData/SummerOlympics2012Ctry.rda "))

#Q6 Take a look at the variables in this data frame.
# What kind of variable is GDP and population?
names(SO2012Ctry)
# [1] "ISO"       "Gold"      "Silver"    "Bronze"    "Total"     "GDP"       "pop"      
# [8] "GDPPP"     "Country"   "latitude"  "longitude" "Female"    "Male"
class(SO2012Ctry$GDP) # [1] "numeric"
class(SO2012Ctry$pop) # [1] "integer"

# What about Total?
table(SO2012Ctry$Total)
#   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  17  18  20  28 
# 119  18  13   5   8   4   4   3   2   2   3   1   3   2   1   3   1   2   2 
# 34  35  38  44  65  82  88 104 
# 1   1   1   1   1   1   1   1 
class(SO2012Ctry$Total) # [1] "integer"

# To examine the relationship between these three variables,
# we could consider making a scatter plot of GDP against pop
# and use plotting symbols that are proportional in size to
# the number of medals. 

# To begin, make a plot of GDP against population. 
plot(x = SO2012Ctry$pop, y = SO2012Ctry$GDP)
# Which of the three principles of good graphics does this plot violate and why?
# Answer: The points are overplotted in only one small corner of the graph, so the 
# data does not stand out. The scale for both variables is very hard to interpret, 
# so we should take the log

# Q7. Let's examine GDP per person (create this new variable your self)
# and population. Use a log scale for both axes. Use the symbols()
# function rather than plot(), and create circles for the plotting
# symbols where the area of the circle is proportional to the 
# total number of medals.
SO2012Ctry$indvGDP <- SO2012Ctry$GDP / SO2012Ctry$pop # this is GDP per person
# the plot() is type = "n" - meaning it does not plot 
plot(x = SO2012Ctry$pop, y = SO2012Ctry$indvGDP, type = "n", log = "xy")
# the symbols() plots the point and its adding them to the plot
symbols(x = SO2012Ctry$pop, y = SO2012Ctry$indvGDP, circles = SO2012Ctry$Total, 
        inches = 0.7, add = TRUE)

# Q8. It appears that the countries with no medals are circles too.
# Remake the plot, this time using only the countries that won
# medals. Then add the non-medal countries to the plot using the "." plotting
# character.
plot(x = SO2012Ctry$pop, y = SO2012Ctry$indvGDP, type = "n", log = "xy")
symbols(x = SO2012Ctry$pop[SO2012Ctry$Total >= 1], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$Total >= 1], 
        circles = SO2012Ctry$Total[SO2012Ctry$Total >= 1], 
        inches = 1, add = TRUE) # countries that won at least one medal
points(x = SO2012Ctry$pop[SO2012Ctry$Total == 0], 
       y = SO2012Ctry$indvGDP[SO2012Ctry$Total == 0], 
       type = "p", pch = ".", add = TRUE) # countries that did not win any medals

# Q9. Make the plot information rich by adding axis labels, 
# title, and label at least 5 of the more interesting points
# with the country name. Use text() to do this.
# PRINT A COPY OF THIS PLOT TO TURN IN.

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 3")
png ("HW3_plot2.png", height=700, width=900)

plot(x = SO2012Ctry$pop, y = SO2012Ctry$indvGDP, type = "n", log = "xy",
     xlab = "Population Size", ylab = "GDP per person", font.axis = 4, font.lab = 4, 
     col.lab = "darkgrey")
title(main = "The relationship between Population and GDP per person
      Proportional to the number of medals won at the 2012 Olympics", 
      sub = "( Log Population and GDP per person )",
      cex.main = 1.9, font.main = 2, col.main = "darkgrey", 
      cex.sub = 1.2, font.sub = 4, col.sub = "darkgrey")
symbols(x = SO2012Ctry$pop[SO2012Ctry$Total >= 1], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$Total >= 1], 
        circles = SO2012Ctry$Total[SO2012Ctry$Total >= 1], 
        inches = 1.2, add = TRUE) # countries that won at least one medal
points(x = SO2012Ctry$pop[SO2012Ctry$Total == 0], 
       y = SO2012Ctry$indvGDP[SO2012Ctry$Total == 0], 
       type = "p", pch = ".") # countries that did not win any medals

# make the point red for the country in with zero medals and with the smallest pop
# and add name on plot (Tuvalu)
points(x = min(SO2012Ctry$pop[SO2012Ctry$Total == 0]), 
       y = SO2012Ctry$indvGDP[SO2012Ctry$pop == min(SO2012Ctry$pop[SO2012Ctry$Total == 0])], 
       type = "p", pch = ".", col = "red") 
text(x = min(SO2012Ctry$pop[SO2012Ctry$Total == 0]), 
     y = SO2012Ctry$indvGDP[SO2012Ctry$pop == min(SO2012Ctry$pop[SO2012Ctry$Total == 0])], 
     labels = SO2012Ctry$Country[SO2012Ctry$pop == min(SO2012Ctry$pop[SO2012Ctry$Total == 0])], 
     col = "red", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the point red for the country in with zero medals and with the largest pop
# and add name on plot (Pakistan)
points(x = max(SO2012Ctry$pop[SO2012Ctry$Total == 0]), 
       y = SO2012Ctry$indvGDP[SO2012Ctry$pop == max(SO2012Ctry$pop[SO2012Ctry$Total == 0])], 
       type = "p", pch = ".", col = "red") 
text(x = max(SO2012Ctry$pop[SO2012Ctry$Total == 0]), 
     y = SO2012Ctry$indvGDP[SO2012Ctry$pop == max(SO2012Ctry$pop[SO2012Ctry$Total == 0])], 
     labels = SO2012Ctry$Country[SO2012Ctry$pop == max(SO2012Ctry$pop[SO2012Ctry$Total == 0])], 
     col = "red", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the point blue for the country with most medals and add name on plot (US)
symbols(x = SO2012Ctry$pop[SO2012Ctry$Total == max(SO2012Ctry$Total)], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$Total == max(SO2012Ctry$Total)], 
        circles = SO2012Ctry$Total[SO2012Ctry$Total == max(SO2012Ctry$Total)], 
        inches = 1.2,  fg = "blue", add = TRUE)
text(x = SO2012Ctry$pop[SO2012Ctry$Total == max(SO2012Ctry$Total)], 
     y = SO2012Ctry$indvGDP[SO2012Ctry$Total == max(SO2012Ctry$Total)], 
     labels = SO2012Ctry$Country[SO2012Ctry$Total == max(SO2012Ctry$Total)], 
     col = "blue", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the symbol blue for the country with second most medals and add name on plot (China)
symbols(x = SO2012Ctry$pop[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[2]], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[2]], 
        circles = SO2012Ctry$Total[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[2]], 
        inches = 1.2,  fg = "blue", add = TRUE)
text(x = SO2012Ctry$pop[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[2]], 
     y = SO2012Ctry$indvGDP[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[2]], 
     labels = SO2012Ctry$Country[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[2]], 
     col = "blue", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the symbol blue for the country with third most medals and add name on plot (Russia)
symbols(x = SO2012Ctry$pop[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[3]], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[3]], 
        circles = SO2012Ctry$Total[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[3]], 
        inches = 1.2,  fg = "blue", add = TRUE)
text(x = SO2012Ctry$pop[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[3]], 
     y = SO2012Ctry$indvGDP[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[3]], 
     labels = SO2012Ctry$Country[SO2012Ctry$Total == sort(SO2012Ctry$Total, decreasing=TRUE)[3]], 
     col = "blue", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the point blue for the country with most medals and largest population
# and add name on plot (China) 
# the country with the second most medals is also the country with the most medals and the 
# largest population (China)
symbols(x = SO2012Ctry$pop[SO2012Ctry$Total == 
                             max(SO2012Ctry$Total[SO2012Ctry$pop == max(SO2012Ctry$pop)])], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$Total == 
                                 max(SO2012Ctry$Total[SO2012Ctry$pop == max(SO2012Ctry$pop)])], 
        circles = SO2012Ctry$Total[SO2012Ctry$Total == 
                                     max(SO2012Ctry$Total[SO2012Ctry$pop == max(SO2012Ctry$pop)])], 
        inches = 1.2,  fg = "blue", add = TRUE)
text(x = SO2012Ctry$pop[SO2012Ctry$Total == 
                          max(SO2012Ctry$Total[SO2012Ctry$pop == max(SO2012Ctry$pop)])], 
     y = SO2012Ctry$indvGDP[SO2012Ctry$Total == 
                              max(SO2012Ctry$Total[SO2012Ctry$pop == max(SO2012Ctry$pop)])], 
     labels = SO2012Ctry$Country[SO2012Ctry$Total == 
                                   max(SO2012Ctry$Total[SO2012Ctry$pop == max(SO2012Ctry$pop)])], 
     col = "blue", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the point green for the country with the largest individual GDP
# and add name on plot (Monaco) 
symbols(x = SO2012Ctry$pop[SO2012Ctry$indvGDP == max(SO2012Ctry$indvGDP)], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$indvGDP == max(SO2012Ctry$indvGDP)], 
        circles = SO2012Ctry$Total[SO2012Ctry$indvGDP == max(SO2012Ctry$indvGDP)],
        inches = 1.2,  fg = "green", add = TRUE)
text(x = SO2012Ctry$pop[SO2012Ctry$indvGDP == max(SO2012Ctry$indvGDP)],
     y = SO2012Ctry$indvGDP[SO2012Ctry$indvGDP == max(SO2012Ctry$indvGDP)],
     labels = SO2012Ctry$Country[SO2012Ctry$indvGDP == max(SO2012Ctry$indvGDP)],
     col = "green", cex = 1.5, pos = c(1,1), adj = 0, font = 4)

# make the point green for the country with the smallest individual GDP
# and add name on plot (Somalia) 
symbols(x = SO2012Ctry$pop[SO2012Ctry$indvGDP == min(SO2012Ctry$indvGDP)], 
        y = SO2012Ctry$indvGDP[SO2012Ctry$indvGDP == min(SO2012Ctry$indvGDP)], 
        circles = SO2012Ctry$Total[SO2012Ctry$indvGDP == min(SO2012Ctry$indvGDP)],
        inches = 1.2,  fg = "green", add = TRUE)
text(x = SO2012Ctry$pop[SO2012Ctry$indvGDP == min(SO2012Ctry$indvGDP)],
     y = SO2012Ctry$indvGDP[SO2012Ctry$indvGDP == min(SO2012Ctry$indvGDP)],
     labels = SO2012Ctry$Country[SO2012Ctry$indvGDP == min(SO2012Ctry$indvGDP)],
     col = "green", cex = 1.5, pos = c(4,1), adj = 0, font = 4)

dev.off()
############################################################################################

# PLOT 3.
# Plotting to understand longitudinal relationships

# Q10. Recently there was a controversy about the validation of 
# methods used in a paper published by Reinhart and Rogoff.
# See e.g. http://blog.stodden.net/2013/04/19/what-the-reinhart-rogoff-debacle-really-shows-verifying-empirical-results-needs-to-be-routine/ and http://www.bloomberg.com/news/2013-05-28/krugman-feud-with-reinhart-rogoff-escalates-as-austerity-debated.html
# We examine a subset of their data. Load the following debt/GDP ratio dataset into R:
# http://www.stanford.edu/~vcs/StatData/Debt.csv
Debt <- read.table(file = "http://www.stanford.edu/~vcs/StatData/Debt.csv", 
                           header = TRUE, sep = ",")
head(Debt)
#   Year Canada China   US   UK
# 1 1867   31.2    NA 32.1 77.7
# 2 1868   30.8    NA 32.0 74.9
# 3 1869   30.1    NA 33.0 74.7
# 4 1870   30.7    NA 32.1 70.3
# 5 1871   26.1    NA 31.0 64.2
# 6 1872   25.2    NA 27.4 60.4

# Q11. Use the plot function to plot the values of debt/GDP 
# for the four countries to show their relationship over time.
# The China values are short since we don't have as much historical data 
# from the Chinese government
MyMin = min( min(Debt$Canada), min(Debt$China, na.rm=TRUE), min(Debt$US), min(Debt$UK) )
MyMax = max( max(Debt$Canada), max(Debt$China, na.rm=TRUE), max(Debt$US), max(Debt$UK) )
plot(x = Debt$Year, y = Debt$Canada, ylim = c(MyMin, MyMax), type = "n")
lines(x = Debt$Year, y = Debt$Canada, type = "l", col = "green")
lines(x = Debt$Year, y = Debt$China, type = "l", col = "orange")
lines(x = Debt$Year, y = Debt$US, type = "l", col = "blue")
lines(x = Debt$Year, y = Debt$UK, type = "l", col = "red")

# Q12. Use the techniques described in class to improve the plot. 
# Explain each step you choose including why you are making the change. You
# might consider changing color, axes, labeling, legend, and others for example.
# What relationships appear?
# THIS IS THE PLOT TO PRINT AND TURN IN

# First, I changed the name of the axis labels and added a title
# I extended the ylim in order to capture the all extreme values of the 4 countries 
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 3")
png ("HW3_plot3.png", height=700, width=900)

MyMin = min( min(Debt$Canada), min(Debt$China, na.rm=TRUE), min(Debt$US), min(Debt$UK) )
MyMax = max( max(Debt$Canada), max(Debt$China, na.rm=TRUE), max(Debt$US), max(Debt$UK) )

plot(x = Debt$Year, y = Debt$Canada, 
     ylim = c(MyMin, MyMax), 
     xlim = c(min(Debt$Year), max(Debt$Year + 10)), type = "n", 
     xlab = "Year", ylab = "Debt / GDP Ratio", font.axis = 4, font.lab = 4, 
     col.lab = "darkgrey")
title(main = "Debt / GDP Ratio over time", 
      sub = "( 1867 - 2012 )",
      cex.main = 1.5, font.main = 2, col.main = "darkgrey", 
      cex.sub = 1, font.sub = 4, col.sub = "darkgrey")
# Next, I added a separate line for each country that was color coded
# and I added the name of the country in the same color as the line
# because it will be easier to read
# In order to accomodate the country labels on the right side of the plot, I extended
# the xlim inside the plot()
# Canada is GREEN (line and text)
lines(x = Debt$Year, y = Debt$Canada, type = "l", col = "green", lwd = 2)
text(x = max(Debt$Year),
     y = Debt$Canada[Debt$Year == max(Debt$Year)],
     labels = names(Debt)[2],
     col = "green", cex = 1.2, pos = c(4,1), adj = 0, font = 4)
# China is ORANGE (line and text)
lines(x = Debt$Year, y = Debt$China, type = "l", col = "orange", lwd = 2)
text(x = max(Debt$Year),
     y = Debt$China[Debt$Year == (max(Debt$Year, na.rm=TRUE)-1)],
     labels = names(Debt)[3],
     col = "orange", cex = 1.2, pos = c(4,1), adj = 0, font = 4)
# US is BLUE (line and text)
lines(x = Debt$Year, y = Debt$US, type = "l", col = "blue", lwd = 2)
text(x = max(Debt$Year),
     y = Debt$US[Debt$Year == max(Debt$Year)],
     labels = names(Debt)[4],
     col = "blue", cex = 1.2, pos = c(4,1), adj = 0, font = 4)
# UK is RED (line and text)
lines(x = Debt$Year, y = Debt$UK, type = "l", col = "red", lwd = 2)
text(x = max(Debt$Year),
     y = Debt$UK[Debt$Year == max(Debt$Year)],
     labels = names(Debt)[5],
     col = "red", cex = 1.2, pos = c(4,1), adj = 0, font = 4)

dev.off()

# The relationship between the 4 countries is quite striking, we can observe that 
# starting in 1867 the Debt/GDP Ratio for US, UK and Canada is slowly decreasing,
# untill it reacheas an all time low in the 1920's (before the great depression), 
# and then all three countries spike up twice (most notably UK), and again all three 
# have a steep decline after WW2, reaching an new all time low in the 1980's, 
# possibly due to high borrowing interests rates 
# For this last streach since the 1980's we also have data for China and it is in 
# a stready incline, however not too steep
# However, we can observe some fluctuations in UK and US around 2008 (financial crises)

############################################################################################

# PLOT 4

# The csv file called London2012ALL_ATHLETES.csv
# contains information about every athlete who competed 
# in the Olympics.
# Load the following dataset into R:
# http://www.stanford.edu/~vcs/StatData/London2012ALL_ATHLETES.csv

London2012 <- read.table(file = "http://www.stanford.edu/~vcs/StatData/London2012ALL_ATHLETES.csv", 
                         header = TRUE, sep = ",")
dim(London2012) # [1] 7081    5
head(London2012) 
#                  Name Sex   Sport    Country MoreThan1Sport
# 1  AL-MASHHADANI Rand   F Archery       Iraq               
# 2        ALVAREZ Luis   M Archery     Mexico               
# 3      AVITIA Mariana   F Archery     Mexico               
# 4      BANERJEE Rahul   M Archery      India               
# 5 BANNOVA Anastassiya   F Archery Kazakhstan               
# 6       BARNARD Elisa   F Archery  Australia               

# There is one observation for each athlete. 
# (Actually, about 20 atheletes have two records if they
# competed in different sporting events. Let's not worry about that.)

# Q13. We are interested in the relationship between Sport and Gender. 

# What type of data is each of these variables?
class(London2012$Sex) # [1] "factor"
levels(London2012$Sex) # [1] ""  "F" "M"
class(London2012$Sport) # [1] "factor"
levels(London2012$Sport)
#  [1] ""                      "Archery"               "Athletics"            
#  [4] "Basketball"            "Beach Volleyball"      "Boxing"               
#  [7] "Canoe"                 "Cycling"               "Cycling "             
# [10] "Diving"                "Equestrian"            "Fencing"              
# [13] "Football"              "Gymnastics Artistic"   "Gymnastics Rhythic"   
# [16] "Handball"              "Hockey"                "Modern Pentathlon"    
# [19] "Rowing"                "Sailing"               "Shooting"             
# [22] "Swimming"              "Synchronised swimming" "Table Tennis"         
# [25] "Taekwondo"             "Tennis"                "Trampoline"           
# [28] "Triathlon"             "Volleyball"            "Water Polo" 

# How many athletes competed in the 2012 Olympics?
length(London2012$Name) # [1] 7081
length(unique(London2012$Name)) # [1] 7070

# How many women competed?
length(London2012$Sex[London2012$Sex == "F"]) # [1] 3264
table(London2012$Sex[London2012$Sex == "F"]) 
#  F      M 
# 3264    0 
table(London2012$Sex)
#  F    M 
# 3264 3816 

# How many sports were there?
length(levels(London2012$Sport)) # [1] 30
length(unique(London2012$Sport)) # [1] 30

# The table() function might be helpful for answering 
# some of these questions. 

# Q14. Make a barplot of Sport and Sex that emphasizes the 
# important differences. To do this, first make a table of 
# Sex by Sport. This will be the input to barplot(). 
# Make the barplot with the parameter beside = TRUE and 
# and again with beside = FALSE. Use the Brewer color 
# palette to adjust the colors as we have discussed in class.
# Explain which of these barplots provides the easiest comparison.  

MyTable <- table(London2012$Sex, London2012$Sport)
MyTable <- MyTable[2:3, 2:30]
require(RColorBrewer)
colors <- brewer.pal( n = 9, name = "Set1") 

# First graph - beside = TRUE (the columns are portrayed as juxtaposed bars)
barplot(height = MyTable, beside = TRUE, col = colors[1:2],
        font.axis = 4, font.lab = 4, col.lab = "black",
        axis.lty = 0, cex.names = .7, cex.axis = .8, axisnames = TRUE, 
        legend.text = c("Female", "Male"), las = 2,
        ylab = "Number of Athletes") 
title(main = "Gender distribution by sport at the 2012 London Olympics", 
      cex.main = 1.2, font.main = 4, col.main = "black")

# Second graph - beside = FALSE (the columns of height are portrayed as stackes bars)
barplot(height = MyTable, beside = FALSE, col = colors[1:2],
        font.axis = 4, font.lab = 4, col.lab = "black",
        axis.lty = 0, cex.names = .7, cex.axis = .8, axisnames = TRUE, 
        legend.text = c("Female", "Male"), las = 2,
        ylab = "Number of Athletes") 
title(main = "Gender distribution by sport at the 2012 London Olympics", 
      cex.main = 1.2, font.main = 4, col.main = "black")

# The answer depends on the kind of comparison we have in mind
# If we interested in the male-female comparison within each sport, 
# the barplot where the columns are portrayed as juxtaposed bars 
# (beside = TRUE) is much more easier to interpret and compare
# However, if we are interested in comparing the total number of athletes in 
# each sport and the gender distribution is just an added information, 
# the barplot where the columns of height are portrayed as stackes bars 
# (beside = FALSE) is more appropriate
# Overall, the barplot where the columns are portrayed as juxtaposed bars 
# (beside = TRUE) is much richer and easier in information to compare

# Q15. Remake the barplot above, but this time switch the order 
# of Sport and Sex in the call to table(). Use the value for
# the beside parameter that you decided was best for the 
# plot in Q14. Compare the barplot with (Sex, Sport) vs 
# (Sport, Sex). Which makes a more interesting visual comparison?

MyTable2 <- table(London2012$Sport, London2012$Sex)
MyTable2 <- MyTable2[2:30, 2:3]
require(RColorBrewer)
colors <- brewer.pal( n = 12, name = "Set3") 
Sports <- levels(London2012$Sport)[2:30]

# Graph with beside = TRUE (the columns are portrayed as juxtaposed bars)
barplot(height = MyTable2, beside = TRUE, col = colors,
        font.axis = 4, font.lab = 4, col.lab = "black",
        axis.lty = 0, cex.names = .7, cex.axis = .8, 
        names.arg = c("Female", "Male"), 
        legend.text = Sports, las = 1,
        ylab = "Number of Athletes") 
title(main = "Gender distribution by sport at the 2012 London Olympics", 
      cex.main = 1.2, font.main = 4, col.main = "black")

# The barplot with (Sex, Sport) is so much more easier to compare
# because we are comparing one-to-one male-female separate for each
# sport and its so much more easier to see the differences
# In the barplot with (Sport, Sex) the comparison is more difficult
# because we have so many sport enumerated for female and its hard 
# to keep track and compare bars that so far apart

# Q16. Notice that the bars are in alphabetical order by sport.
# To facilitate comparisons, we might want to arrange
# the bars in order of participation in a sport. To do this,
# call order() on the return value from making a table of Sport alone.
# Assign this vector to a variable, say orderSport.
# Then reorder your two-way table of Sport and Sex,
# using the orderSport vector and [ ] to subset the table and rearrange
# the rows/cols. The resulting barplot should show bars in 
# increasing height.

Participation <- data.frame(table(London2012$Sport))
Participation$orderSport <- Participation$Var1[order(Participation$Freq)[Participation$Var1]]
Participation$Freq <- Participation$Freq[order(Participation$Freq)[Participation$Var1]]
London2012a <- merge(x=Participation, y=London2012, by.x="orderSport", by.y="Sport", sort=FALSE)
MyTable3 <- table(London2012a$Var1, London2012a$Sex)
MyTable3 <- MyTable3[2:30, 2:3]

require(RColorBrewer)
colors <- brewer.pal( n = 12, name = "Paired") 
pal <- colorRampPalette(colors)
Sports2 <- Participation$orderSport[2:30]

barplot(height = MyTable3, beside = TRUE, col = pal(29),
        font.axis = 4, font.lab = 4, col.lab = "black",
        axis.lty = 0, cex.names = .7, cex.axis = .8, 
        names.arg = c("Female", "Male"), 
        legend.text = Sports2, las = 1,
        ylab = "Number of Athletes") 
title(main = "Gender distribution by sport at the 2012 London Olympics", 
      cex.main = 1.2, font.main = 4, col.main = "black")


# Q17. Finally to make the plot more information rich, try turning
# the x-axis labels on their side. To do this, find a parameter
# in par() that will rotate the x-axis tick mark labels. Even though
# you found the parameter in the par() function, this
# parameter can be added in the call to barplot().
# Also find and use a parameter to shrink the text for these labels. 
# Lastly, add a title to the plot.
# THIS IS THE PLOT PRINT AND TO TURN IN

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 3")
png ("HW3_plot4a.png", height=700, width=900)

barplot(height = MyTable3, beside = TRUE, col = pal(29),
        font.axis = 4, font.lab = 4, col.lab = "black",
        axis.lty = 0, cex.names = .7, cex.axis = .8, 
        names.arg = c("Female", "Male"), 
        las = 1, args.legend = c(1,2),
        ylab = "Number of Athletes") 
title(main = "Gender distribution by sport at the 2012 London Olympics", 
      cex.main = 1.2, font.main = 4, col.main = "black")
legend(x= 3, y= 700, legend=Sports2, fill=pal(29))

dev.off()

MyTable4 <- table(London2012a$Sex, London2012a$Var1)
MyTable4 <- MyTable4[2:3, 2:30]
colors <- brewer.pal( n = 12, name = "Set1") 

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 3")
png ("HW3_plot4b.png", height=600, width=800)
par(mar=c(10,6,4,2)+0.5,mgp=c(5,1,0))

barplot(height = MyTable4, beside = TRUE, col = colors[1:2], 
        font.axis = 4, font.lab = 4, col.lab = "black",
        axis.lty = 0, cex.names = .8, cex.axis = .8, 
        names.arg = Sports2, las = 2,
        ylab = "Number of Athletes") 
title(main = "Gender distribution by sport at the 2012 London Olympics", 
      cex.main = 1.2, font.main = 4, col.main = "black")
legend(x= 10, y= 600, legend=c("Female", "Male"), fill=colors[1:2])

dev.off()