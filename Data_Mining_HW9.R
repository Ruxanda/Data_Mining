################################################################################################
################################################################################################
### APPLIED DATA MINING
### HOMEWORK 9 
################################################################################################
################################################################################################

### The file http://www.stanford.edu/v ̃cs/StatData/weather.csv
### contains the average daily temperature for each of 144 U.S. cities for the period 1/1/1995 
### to 10/13/2004. The data was scraped from
### http://academic.udayton.edu/kissock/http/Weather/citylistUS.htm

# (a) Create a matrix X in R with rows given by the cities, and columns given by the dates in the 
# dataset. What size is your matrix?

MyWeather <- read.csv("http://www.stanford.edu/~vcs/StatData/weather.csv", sep="|", head=TRUE)
head(MyWeather)
rownames(MyWeather) <- MyWeather[ ,1]
MyWeatherMatrix <- t(MyWeather[ ,2:ncol(MyWeather)])
head(MyWeatherMatrix[1:3,1:6])
#            1995-01-01 1995-01-02 1995-01-03 1995-01-04 1995-01-05 1995-01-06
# abilene_tx       33.4       31.1       33.6       28.2       29.5       45.5
# akron_oh         40.3       21.2       19.4       13.1        7.7       21.0
# albany_ny        35.4       33.8       26.7       24.5       16.4       21.0
dim(MyWeatherMatrix) # [1] 144 3574
### The matrix is 144 by 3574
### So we have 144 cities and 3574 dates


# (b) If you were to compute the singular value decomposition of X as X = UDVT what would you 
# expect to see for the first column of U? What about the first column of V? Would there 
# be any structure?

# First column of U is the daily temperature for each city.
# I am unsure if there would be pattern of structure here.

# First column of V is temperature pattern for each day.
# The temprarature pattern is cyclical so I would expect a cyclical structure

# (c) Compute the SVD of X using the function svd in R. The object it returns has attributes 
# u, d, v. Plot the first column of u and the first column of v.

MyWeatherMatrix_SVD <- svd(MyWeatherMatrix)
summary(MyWeatherMatrix_SVD)
#   Length Class  Mode   
# d    144 -none- numeric
# u  20736 -none- numeric
# v 514656 -none- numeric

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 9")
png ("HW9_plot1.png", height=400, width=600)
plot(MyWeatherMatrix_SVD$u[ ,1])
dev.off()

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 9")
png ("HW9_plot2.png", height=400, width=600)
plot(MyWeatherMatrix_SVD$v[ ,1])
dev.off()

# (d) Plot the singular values, i.e. d. What does this plot seem to suggest? If you were to 
# give an estimate of the number of important dimensions, what would you choose?

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 9")
png ("HW9_plot3.png", height=400, width=600)
plot(MyWeatherMatrix_SVD$d)
dev.off()

### What does this plot seem to suggest?
# Looking at this graph we can observe that after the first dimension there is remarkable drop

### If you were to give an estimate of the number of important dimensions, what would you choose? 
# I would probably choose 3 to 4 dimensions in order to cover the drop

# (e) Missing temperatures were encoded as -99 in the data file. Replace all -99’s with the 
# overall mean of those temperatures not equal to -99.

for (i in 1:length(MyWeatherMatrix))
  if(MyWeatherMatrix[i] == -99)
    {
    MyWeatherMatrix[i] = mean(MyWeatherMatrix[MyWeatherMatrix != -99])
    }

# (f) Repeat the SVD computation above on this new data matrix, replotting the first columns 
# of u, v as well as d. Does this significantly change the resulting plots?

MyWeatherMatrix_SVD_New <- svd(MyWeatherMatrix)
summary(MyWeatherMatrix_SVD_New)
#   Length Class  Mode   
# d    144 -none- numeric
# u  20736 -none- numeric
# v 514656 -none- numeric

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 9")
png ("HW9_plot1a.png", height=400, width=600)
plot(MyWeatherMatrix_SVD_New$u[ ,1])
dev.off()

### The plot of U did not change that much

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 9")
png ("HW9_plot2a.png", height=400, width=600)
plot(MyWeatherMatrix_SVD_New$v[ ,1])
dev.off()

### The V plot is the plot that changed the most, because we lost the outliers and the
# data is more compressed

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 9")
png ("HW9_plot3a.png", height=400, width=600)
plot(MyWeatherMatrix_SVD_New$d)
dev.off()

### The plot of D does not change drastically, we can the first 3-4 dimensions are
# the most important