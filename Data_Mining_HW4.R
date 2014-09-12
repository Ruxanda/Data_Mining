############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 4 
### Using the apply function and creating functions
############################################################################################
############################################################################################

### 1. (5) Create a matrix as follows:
m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)

### Now find the mean of the rows:
# Average by row: margin=1
apply(X = m, MARGIN = 1, FUN = mean)
# [1] 6  7  8  9 10 11 12 13 14 15
rowMeans(m)
# [1] 6  7  8  9 10 11 12 13 14 15

### And find the mean of the columns:
# Average by column: margin=2
apply(X = m, MARGIN = 2, FUN = mean)
# [1]  5.5 15.5
colMeans(m)
# [1]  5.5 15.5

### Divide all values by 2
m %/% 2
#       [,1] [,2]
#  [1,]    0    5
#  [2,]    1    6
#  [3,]    1    6
#  [4,]    2    7
#  [5,]    2    7
#  [6,]    3    8
#  [7,]    3    8
#  [8,]    4    9
#  [9,]    4    9
# [10,]    5   10

### Examine the following R code. Briefly explain what it is doing.

z.sq <- function(z) return(c(z, z^2))
# the function above is taking each value of vector "z" and returns a vector with
# all the "z" values, followed by all the "z" squared values
x <- 1:8
# creates a vector named "x" that has 8 integer entries from 1 to 8 
z.sq(x)
# [1] 1 2 3 4 5 6 7 8 1 4 9 16 25 36 49 64
# running the function created above (z.sq) on the values of the "x" vector
# and returns a new vector with 16 entries as predicted, first 8 are the
# values of the "x" vector, and the last 8 are the squared values of the "x" vector
matrix(z.sq(x), ncol = 2)
#     [,1] [,2]
# [1,]  1    1
# [2,]  2    4
# [3,]  3    9
# [4,]  4   16
# [5,]  5   25
# [6,]  6   36
# [7,]  7   49
# [8,]  8   64
# above the matrix() creates a matrix with 2 columns with the 16 values of 
# the vector obtained from running the function "z.sq()" 

### How could you simplify this? (Hint: Use sapply). Carry out your simplication 
# in R and show the result 
# In order to simplify the above code we can use on orphan function inside sapply()
MyMatrix <- matrix(data=c(1:8, sapply(1:8, function(i) i^2)), ncol=2)
MyMatrix
#     [,1] [,2]
# [1,]  1    1
# [2,]  2    4
# [3,]  3    9
# [4,]  4   16
# [5,]  5   25
# [6,]  6   36
# [7,]  7   49
# [8,]  8   64

############################################################################################

### 2. (5) Suppose we have a matrix of 1s and 0s, and we want to create a vector that
# has a 1 or a 0 depending on whether the majority of the first c elements in that 
# row are 1 or 0. Here c will be a parameter which we can vary. Write a short 
# function, perhaps called find.majority, that does this. Then apply it to 
# the following matrix X when c = 2 and again when c = 3:

X <- matrix(c(1,1,1,0, 0,1,0,1, 1,1,0,1, 1,1,1,1, 0,0,1,0), nrow=4)
X
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    0    1    1    0
# [2,]    1    1    1    1    0
# [3,]    1    0    0    1    1
# [4,]    0    1    1    1    0

find.majority <- function(matrix, c)
{ x = rep(NA, nrow(matrix)) # create an empty vector with length = number or rows
  a = rep(NA, nrow(matrix)) # create an empty vector with length = number or rows
  b = rep(NA, nrow(matrix)) # create an empty vector with length = number or rows
  for(i in 1:nrow(matrix)) # we are going to loop over the rows of the matrix
  {
      a[i] = length(which(matrix[i,1:c] == 1)) 
      # populate a with no. of 1 in the row
      b[i] = length(which(matrix[i,1:c] == 0)) 
      # populate a with no. of 0 in the row
      if (a[i] > b[i]) { x[i] = "Majority 1"} 
      # if we have more ones than zeroes we will print "Majority 1"
      else if (a[i] < b[i]) { x[i] = "Majority 0"}
      # if we have more zeros than ones we will print "Majority 0"
      else if (a[i] == b[i]) { x[i] = "Tied"}
      # if we have an identical number of zeros and one than print "Tied"
   } 
  return(x) # return a vector with the results
}

# Apply the function when c=2
find.majority(X, 2)
# [1] "Tied"       "Majority 1" "Tied"       "Tied"  

# Apply the function when c=3
find.majority(X, 3)
# [1] "Majority 1" "Majority 1" "Majority 0" "Majority 1"

############################################################################################

### 3. (7) There is a famous dataset in R called "iris." It should already be loaded
# in R for you. If you type in ?iris you can see some documentation. Familiarize 
# yourself with this dataset.

dim(iris)
# [1] 150   5
names(iris)
# [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"   

### Find the mean petal length by species  
aggregate( formula=Petal.Length~Species, data=iris, FUN=mean )
#      Species Petal.Length
# 1     setosa        1.462
# 2 versicolor        4.260
# 3  virginica        5.552

### Now obtain the mean of the first 4 variables, by species, but 
# using only one function call.
aggregate( formula = cbind(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) 
           ~ Species, data = iris, FUN = mean )
#      Species Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     setosa        5.006       3.428        1.462       0.246
# 2 versicolor        5.936       2.770        4.260       1.326
# 3  virginica        6.588       2.974        5.552       2.026

### Create a simple scatter plot of Petal Length against Petal Width. 
# Title your plot appropriately.
require(ggplot2)
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 4")
png ("HW4_plot1.png", height=600, width=800)
p <- ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))
p + geom_point() + ylab("Petal Width") + xlab("Petal Length") + 
  ggtitle("Iris Petal Size (length vs width)")
dev.off()

### Now change the plotting symbol to be different for each species.
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 4")
png ("HW4_plot2.png", height=600, width=800)
p <- ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))
p + ylab("Petal Width") + xlab("Petal Length") + 
  ggtitle("Iris Petal Size (length vs width)") + 
  geom_point(aes(shape = factor(Species))) + 
  scale_shape(solid = FALSE) +
  labs(shape="Iris Specie")
dev.off()

### Replot the data using the same symbol for all species, but plot 
# each species in a different color, filling the symbol
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 4")
png ("HW4_plot3.png", height=600, width=800)
p <- ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))
p + geom_point() + ylab("Petal Width") + xlab("Petal Length") + 
  ggtitle("Iris Petal Size (length vs width)") + 
  geom_point(aes(color = factor(Species))) + 
  labs(color="Iris Specie")
dev.off()

### A very useful function in R is "pairs." Use the pairs function to 
# create a plot of the iris data, comparing Petal Length, Petal
# Width, Sepal Length, and Sepal Width. You should have 12 subplots, 
# and 4 labeling plots.
# Use the previous question to code each of the points in a different
# color by species.
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 4")
png ("HW4_plot4_pairs.png", height=800, width=800)
require(RColorBrewer)
colors <- brewer.pal( n = 3, name = "Set1") 
pairs(iris[1:4], main = "Iris Measurements by Species",
      pch = 21, bg = colors[unclass(iris$Species)])
dev.off()

### What can you conclude about the data, from inspection of the pairs plot?
# We can observe that the data is clustered by species
# Regardless of the pair plot we are examining, we can distinguish that every color is segregated
# in clusters (each color representing an iris specie)

############################################################################################

### 4. (5) Create a list with 2 elements as follows:
l <- list(a = 1:10, b = 11:20)
l
# $a
# [1]  1  2  3  4  5  6  7  8  9 10
# $b
# [1] 11 12 13 14 15 16 17 18 19 20

### What is the mean of the values in each element?
lapply(X = l, FUN = mean) # here the outcome is a list of means
# $a
# [1] 5.5
# $b
# [1] 15.5
sapply(X = l, FUN = mean) # here the outcome is a vector of means
#   a    b 
# 5.5 15.5 

### What is the sum of the values in each element?
lapply(X = l, FUN = sum) # here the outcome is a list of sums
# $a
# [1] 55
# $b
# [1] 155
sapply(X = l, FUN = sum) # here the outcome is a vector of sums
#   a    b 
#  55  155 

### What type of object is returned if you use lapply? sapply? Show your R code that finds these answers. 
lapply(X = l, FUN = class) # the outcome is a list of the class of each element of the list (a and b)
# $a
# [1] "integer"
# $b
# [1] "integer"
sapply(X = l, FUN = class) # the outcome is a vector of the class of each element of the list (a and b)
#     a         b 
# "integer" "integer" 

### Now create the following list:
l.2 <- list(c = c(21:30), d = c(31:40))
l.2
# $c
# [1] 21 22 23 24 25 26 27 28 29 30
# $d
# [1] 31 32 33 34 35 36 37 38 39 40

### What is the sum of the corresponding elements of l and l.2, using one function call?
mapply(FUN="+", l, l.2) 
# this function adds every element from list "l" with the corresponding element from list "l.2"
#        a  b
#  [1,] 22 42
#  [2,] 24 44
#  [3,] 26 46
#  [4,] 28 48
#  [5,] 30 50
#  [6,] 32 52
#  [7,] 34 54
#  [8,] 36 56
#  [9,] 38 58
# [10,] 40 60
mapply(FUN=sum, l, l.2)
# this function sums of the elements inside "a" from "l" and adds them to the sum of the elements inside "c" from "l.2"
# this function sums of the elements inside "b" from "l" and adds them to the sum of the elements inside "d" from "l.2"
#  a   b 
# 310 510 

### Take the log of each element in the list l:
mapply(FUN=log, l)
#               a        b
#  [1,] 0.0000000 2.397895
#  [2,] 0.6931472 2.484907
#  [3,] 1.0986123 2.564949
#  [4,] 1.3862944 2.639057
#  [5,] 1.6094379 2.708050
#  [6,] 1.7917595 2.772589
#  [7,] 1.9459101 2.833213
#  [8,] 2.0794415 2.890372
#  [9,] 2.1972246 2.944439
# [10,] 2.3025851 2.995732

############################################################################################

# 5. (5) Write a function that finds the sample covariance, following the commenting 
# in this template. Then try your function out on the iris data.

## This is a funtion to find the sample covariance.
## Input: Dataset mat
## Output: Covariance Matrix

samp.cov <- function(matrix)
{  
  # find the mean for each column, called sample.mean
  sample.mean = colMeans(matrix)
  # subtract the sample mean from each observation
  difference = apply(X=matrix, MARGIN=1, function(x) return(x - sample.mean)) 
  # implement matrix multiplication (hint: just leave the following code as it is)
  y.multiply = function(y) return(y %*% t(y))
  # now use apply() to carry out matrix multiplication over the rows of Mat
  # notice the output will have ncol(Mat)ˆ2 rows, and nrow(Mat) columns
  x.matmult = apply(X=t(difference), MARGIN=1, FUN=y.multiply)
  # create the covariance matrix by taking the row means of x.matmult
  covariance.matrix = apply(X=x.matmult, MARGIN=1, FUN=mean)
  # now use the return function and coerce the output to be matrix valued and 
  # have the same number of rows and the number of columns as your input matrix 
  return(matrix(covariance.matrix, nrow=ncol(matrix), ncol=ncol(matrix)))  
}

# Load samp.cov into R and give the result when you try your function out on 
# the iris data. Compare to the following output. Do your results differ? If 
# they do, why is that?
samp.cov(iris[,1:4])
#             [,1]        [,2]       [,3]       [,4]
# [1,]  0.68112222 -0.04215111  1.2658200  0.5128289
# [2,] -0.04215111  0.18871289 -0.3274587 -0.1208284
# [3,]  1.26582000 -0.32745867  3.0955027  1.2869720
# [4,]  0.51282889 -0.12082844  1.2869720  0.5771329
cov(iris[,1:4])
#              Sepal.Length Sepal.Width Petal.Length Petal.Width
# Sepal.Length    0.6856935  -0.0424340    1.2743154   0.5162707
# Sepal.Width    -0.0424340   0.1899794   -0.3296564  -0.1216394
# Petal.Length    1.2743154  -0.3296564    3.1162779   1.2956094
# Petal.Width     0.5162707  -0.1216394    1.2956094   0.5810063

# The results are identical up the second decimal point, however due to different roundings 
# the results are different after the third decimal point 
