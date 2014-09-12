############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 1 
############################################################################################
############################################################################################

### Load the data for this assignment into your R session with the following command:

load(url("http://www.stanford.edu/~vcs/StatData/SFTemps.rda"))

############################################################################################

### Check to see that the data were loaded by running:

objects()
# [1] "dates"      "dayOfMonth" "month"      "temp"       "year"  
# This should show five variables: dates, dayOfMonth, month, temp, and year

############################################################################################

### Use the length() function to find out how many observations there are.

length(dates) 
# [1] 5534

length(dayOfMonth) 
# [1] 5534

length(month) 
# [1] 5534

length(temp)
# [1] 5534

length(year)
# [1] 5534

# same number of observations for all the varianbles in the dataset

############################################################################################

### 1. Find the average daily temperature

class(temp) # the variable is numeric so we can calculate the mean of it
# [1] "numeric"

temp
#  [1] 46.7 47.3 49.6 50.0 50.8 49.3 54.4 54.9 59.0 57.7 55.0 54.3 56.5 57.3 50.7 47.2 45.1 46.6 47.7 47.7 48.5
# [22] 51.1 52.1 52.3 51.8 50.6 53.3 55.1 54.7 55.3 56.0 56.4 58.5 57.0 54.0 52.9 53.1 54.2 52.6 52.2 52.2 50.8
# ..................(missing output)...........................................................................
# [442] 59.3 62.2 55.9 53.3   NA   NA 51.0 50.2   NA   NA   NA   NA   NA 51.0 54.2 59.7 56.3 55.6   NA 56.8 56.2
# [463] 59.3   NA   NA 55.0 54.7   NA 53.5 55.3 60.8 57.6   NA 51.5 53.5   NA 54.0   NA   NA   NA 58.3 63.3 60.8
# [484] 65.0 68.0 78.5 69.6 65.1 58.4 55.2 56.8 55.1 54.6 55.0 54.9 55.0 59.5 65.4 60.3 65.0 63.0 62.0   NA 59.7
# ..................(missing output)...........................................................................
# [5503] 48.0 52.2 52.9 48.8 50.1 51.5 51.1 51.0 51.8 51.9 51.8 54.3 53.7 54.8 52.9 52.2 50.7 51.7 50.8 55.2 56.2
# [5524] 53.3 53.8 54.0 53.5 55.0 53.1 53.4 52.4 52.6 52.3 53.7

# Here we can observe that we have NA values, which will prevent us to calculate the mean

mean(temp, na.rm=TRUE) # na.rm revomes the NA's in order to be able to calculate the mean
# [1] 56.95646

############################################################################################

### 2. Find the 10% trimmed average daily temperature

mean(temp, na.rm=TRUE, trim=0.10)
# [1] 56.88641

############################################################################################

### 3. Find the 50% trimmed average daily temperature 

mean(temp, na.rm=TRUE, trim=0.50)
# [1] 57

############################################################################################

### 4. Compute the median daily temperature. How does it compare to the 50% trimmed mean? 
###    Explain. Put your explanation in a comment that begins with three ###

median(temp, na.rm=TRUE)
# [1] 57

### Your explanation goes here:
# The mean of the 50% trimmed average is obviously equal to the median because in the process of trimming
# 50% of the data we are actually eliminating 50% of the data from each end of the variable and calculate 
# the mean of the remaining data, and the remaining data is the middle value of the ordered vector 
# (the middle value of the ordered vector is the median)

############################################################################################

### 5. We would like to convert the temperature from Farenheit to Celsius. 
###    Below are several attempts to do so that each fail. Try running each expression in R. 
###    Record the error message in a comment. Explain what it means. 
###    Be sure to directly relate the wording of the error message with the problem you find in the expression.

(temp - 32)
### Error message here:
#   Here we do not have an error message

### Explanation here:
#   In this line of code we are simply substracting the integer "32" from every single value of the temp vector and 
#   what comes out is vector with new values. However, this is not the complete formula to obtain Celsius degrees

(temp - 32)5/9
### Error message here:
#   Error: unexpected numeric constant in "(temp - 32)5"

### Explanation here:
#   There is no operator between the (temp - 32) and 5, so R does not know what to do with the numbers 
#   If for example we introduce an operater in the code: (temp - 32)*5/9, than it runs without problems

5/9(temp - 32)
### Error message here:
#   Error: attempt to apply non-function

### Explanation here:
#   Here we have the same problem as above
#   Even if the order of the operation has changed still between 5/9 and (temp - 32) there is no operator
#   Here we can attempt to fix the problem by introducing an operation in the code, as we did above: 5/9*(temp - 32)
#   After the introduction of an operator between 5/9 and (temp-32), the line of code run without problems

[temp - 32]5/9
### Error message here:
#   Error: unexpected '[' in "["

### Explanation here:
#   Here we tried to resolve the issue we had above by changing the type of paranthesis used from () to [].
#   However this strategy was not succesfull, because the error we had in the step above was not due to the parenthesis
#   Also, [ ] are used to access specific elements of a vector, so it does not make sense to use them here.

############################################################################################

### 6. Provide a well-formed expression that correctly performs the calculation that we want. 
###    Assign the converted values to tempC

tempC <- 5 / 9 * ( temp - 32 )
tempC
#    [1]  8.166667  8.500000  9.777778 10.000000 10.444444  9.611111 12.444444 12.722222 15.000000 14.277778 12.777778
#   [12] 12.388889 13.611111 14.055556 10.388889  8.444444  7.277778  8.111111  8.722222  8.722222  9.166667 10.611111
# ..................(missing output)........................................................................................
# [5523] 13.444444 11.833333 12.111111 12.222222 11.944444 12.777778 11.722222 11.888889 11.333333 11.444444 11.277778
# [5534] 12.055556

############################################################################################

# For the following questions, use one of: 
# head() - returns the first part of a vector, matrix, table, data frame or function
# summary() - used to produce result summaries of the results of various model fitting functions
# class() - many R objects have a class attribute
# min() - returns the (parallel) minima of the input values
# max() - returns the (parallel) maxima of the input values
# hist() - computes a histogram of the given data values
# quantile() - produces sample quantiles corresponding to the given probabilities
# to answer the questions.

############################################################################################

### 7. What was the coldest temperature recorded in this time period?

### Below there are 4 different ways we can obtain the coldest temperature: 38.3

summary(temp)
#   Min.   1st Qu.  Median    Mean    3rd Qu.    Max.     NA's 
#  38.30    53.00    57.00    56.96    60.80    79.60      36 

min(temp, na.rm=TRUE)
# [1] 38.3

quantile(temp, na.rm=TRUE)
#  0%     25%    50%    75%   100% 
# 38.3   53.0   57.0   60.8   79.6

min(head(sort(temp, decreasing=FALSE)))
# [1] 38.3

############################################################################################

### 8. What was the warmest temperature recorded in this time period?

### Below there are 4 different ways we can obtain the warmest temperature: 79.6

summary(temp)
#   Min.   1st Qu.  Median    Mean    3rd Qu.    Max.     NA's 
#  38.30    53.00    57.00    56.96    60.80    79.60      36 

max(temp, na.rm=TRUE)
# [1] 79.6

quantile(temp, na.rm=TRUE)
#  0%     25%    50%    75%   100% 
# 38.3   53.0   57.0   60.8   79.6

max(head(sort(temp, decreasing=TRUE)))
# [1] 79.6

############################################################################################

### 9. What does the distribution of temperatures look like, i.e. are there roughly as many warm as cold days, are 
###    the temps clustered around one value or spread evenly across the range of observed temperatures, etc.?

png ("HW1_hist_temp.png")
hist(temp)
dev.off()
# from the histogram of temperatures we can observe that the distribution is similar to a bell curve
# we can observe that majoraty of the data is aggregated around 55 to 60 degrees

summary(temp)
#   Min.   1st Qu.  Median    Mean    3rd Qu.    Max.     NA's 
#  38.30    53.00    57.00    56.96    60.80    79.60      36 
# the results of the histogram are corroborated by the summary of the vector
# the mean (56.96) and median (57.00) are as we expected, from the interpretation of the histogram above, between 55 and 60 

quantile(temp, na.rm=TRUE)
#  0%     25%    50%    75%   100% 
# 38.3   53.0   57.0   60.8   79.6
# we can determine that 50% of the temperatures are between the first quantile (53.0) and thrid quantile (60.8)
# we can state the distribution is quite in the realm of a normal distribution
# and if we want to be really precise about if we can say that it has a slight skew to the right (very small)

############################################################################################

### 10. Examine the first few values of dates. These are a special type of data. Confirm this with class(). 

dates
# [1]    "1995-01-01" "1995-01-02" "1995-01-03" "1995-01-04" "1995-01-05" "1995-01-06" "1995-01-07" "1995-01-08"
# [9]    "1995-01-09" "1995-01-10" "1995-01-11" "1995-01-12" "1995-01-13" "1995-01-14" "1995-01-15" "1995-01-16"
# [17]   "1995-01-17" "1995-01-18" "1995-01-19" "1995-01-20" "1995-01-21" "1995-01-22" "1995-01-23" "1995-01-24"
# ..................(missing output)...........................................................................
# [5513] "2010-02-03" "2010-02-04" "2010-02-05" "2010-02-06" "2010-02-07" "2010-02-08" "2010-02-09" "2010-02-10"
# [5521] "2010-02-11" "2010-02-12" "2010-02-13" "2010-02-14" "2010-02-15" "2010-02-16" "2010-02-17" "2010-02-18"
# [5529] "2010-02-19" "2010-02-20" "2010-02-21" "2010-02-22" "2010-02-23" "2010-02-24"

# the type of data looks like a date in the format : "YYYY-MM-DD"

class(dates)
# [1] "Date"
# the class function confirms our expectations that the vector is in Date format

############################################################################################

### 11. Run the following code to make a plot. (don't worry right now about what this code is doing)

png ("HW1_plot1_temp_dates.png")
plot(temp~dates, col = rainbow(12)[month], type="p", pch=19, cex = 0.3)
dev.off()

### Use the Zoom button in the Plots window to enlarge the plot:
#   the Zoom button created a separte window named "Plot Zoom" that was enlarged to the size of the screen

### Resize the plot so that it is long and short.
png ("HW1_plot2_temp_dates.png", height=300, width=900)
plot(temp~dates, col = rainbow(12)[month], type="p", pch=19, cex = 0.3)
dev.off()

png ("HW1_plot3_temp_dates.png", height=700, width=300)
plot(temp~dates, col = rainbow(12)[month], type="p", pch=19, cex = 0.3)
dev.off()

### Make an interesting observation about temp in the Bay Area based on this plot 
### (something that you couldn't see with the calculations so far)

### Your answer goes here:
#   What is most striking about the plot is the perfect cyclical movement of the temperatures as time passes
#   We can directly observe that data points start in the winter season of 1995, because the temperatures are below 60
#   This interpretation of the plot is confirmed if look at the raw data: the first observation of "dates" is "1995-01-01"
#   Also, we can observe that for the first half an year the temperatures are on average below 60 degrees 
#   And for the next six months the points shift up, indicating temperatures above 60 degrees
#   This type of cyclical movement of the temperatures was not imediatly obvious the first time looked at the raw data
#   For this reason, a plot can reveal hidden patterns in large data sets (here we have over 5,000 observations)


### What interesting question about the weather in the Bay Area would you like to answer with these data, 
### but don't yet know how to do it? 

### Your answer goes here:
#   I would be interested in exploring if there is a specific breaking point that switches the seasons around
#   Also, if the point where the temperatures start to increase/decrease moves in a pattern from year to year

############################################################################################

# For the remainder of this assignment we will work with one of the random number generators in R.

############################################################################################

### 12. Use the following information about you to generate some random values:  

# a.  Use your year of birth for the mean of the normal.
# b.	Use the day of the month you were born for the sd of the normal curve.
# c.	Generate either 5 random values.
# d.	Assign the values to a variable matching your first name.
# e.	Provide the values generated.

Ruxanda <- rnorm(n = 5, mean = 1985, sd = 2)
Ruxanda
# [1] 1981.095 1983.699 1985.288 1986.143 1985.718

############################################################################################

### 13. Generate a vector called "normsamps" containing 1000 random samples from a normal distribution with mean 1 and sd 2

normsamps <- rnorm(n = 1000, mean = 1, sd = 2)
normsamps
#   [1]  0.764210579  3.069414709  2.148386771  1.318256201  2.204653206 -1.127882516  3.101666429 -0.465893960 -0.478578212
#  [10]  1.847973458 -1.550949467 -0.588336387  1.327882836  0.229924393 -1.575441473  2.001206700 -1.039406352 -0.401291501
#  [19]  1.256974074  2.407583965 -0.921481393  3.299180776  1.943608479  0.615962340  4.973894143  4.636667000 -2.395060693
# ..................(missing output)........................................................................................
# [982] -0.603615845  1.936283875  5.283616231 -1.619250631 -2.486966485 -2.076358506 -0.018019819  0.397448808  1.293476425
# [991]  0.119752140  2.739323703  0.172071156  0.030565881 -0.131668371  2.447119998  3.683517138  3.612597793 -2.317218813
#[1000]  7.145721458

############################################################################################

### 14. Calculate the mean and sd of the 1000 values.

mean(normsamps)
# [1] 1.034018
sd(normsamps)
# [1] 2.076083

### The return values from your computation go here:
#   The mean is 1.034018, really close to 1 (the mean we set for when we created the random numbers inside normsamps)
#   The standard deviation is 2.076083, again really close to 2 (the standard deviation set for the creation of the random numbers)

############################################################################################

### 15. Use implicit coercion of logical to numeric to calculate the fraction of the values in normsamps that are less than 3

normsamps < 3
#   [1]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#  [22] FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
# ..................(missing output).....................................................................................
# [967]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
# [988]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE

as.numeric(normsamps < 3)
#   [1] 1 0 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 0 0 1 1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 1 1 0 0 0 0
#  [66] 0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0 1 1 1 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 0 1 1 0 1 0 1 1 0 0 1 1 1 1 1 1 1 1 0 0 0 1 1 1 1
# ..................(missing output).....................................................................................
# [911] 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 0 1 1 1 1 0 1 1 1 0
# [976] 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 1 0

# We can observe from comparing the two outputs fro above that TRUE is replaced with 1, and FALSE is replaced with 0

sum(as.numeric(normsamps < 3))
# [1] 831
# 831 is the total number of instances in our vector that are below 3

sum(as.numeric(normsamps < 3)) / length(normsamps)
# [1] 0.831
# 0.831 is the fraction of numbers in our vector that are below 3

############################################################################################

### 16. Look up the help for rnorm. 
###     You will see a few other functions listed.  
###     Use one of them to figure out about what answer you should expect for the previous problem.  
###     That is, find the area under the normal(1, 2) curve to the left of 3.  
###     This should be the chance of getting a random value less than 3.  

pnorm(q=3, mean=1, sd=2, lower.tail=TRUE)
# [1] 0.8413447
# this result (0.8413447) is almost identical with the result from the exercise above (0.831)

############################################################################################
