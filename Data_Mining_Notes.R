############################################################################################
############################################################################################
############################################################################################
### DATA MINING
### Code and notes 
############################################################################################
############################################################################################
############################################################################################

rm(list=ls())

####################################
### Data Types Vectors and Subsets
####################################

### Data Types
class(3.5)
# [1] "numeric"
class("Hello")
# [1] "character"
class(TRUE)
# [1] "logical"

fnames <- c("Tom", "May", "Joe", "Bob", "Sue", "Liz", "Jon", "Sal",
            "Tim", "Tom", "Ann", "Dan", "Art", "Zoe")
fnames
class(fnames) # [1] "character"

fage <- c(77, 33, 79, 47, 27, 33, 67, 52, 59, 27, 55, 24, 46, 48)
fage
class(fage) # [1] "numeric"

fgender <- factor(c('m', 'f', 'm', 'm', 'f', 'f', 'm', 'f', 'm', 'm', 'f', 'm', 'm', 'f'))
fgender
#  [1] m f m m f f m f m m f m m f
# Levels: f m
class(fgender) # [1] "factor"
# A factor vector is a special storage class used for qualitative data. 
# The values are internally stored as integers by each integer corresponds to a level, which is a character string.
levels(fgender) # [1] "f" "m"

foverWt <- c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE)
foverWt
class(foverWt) # [1] "logical"

0/0 # [1] NaN # Not A Number
12/0 # [1] Inf

# NULL is a special value that denotes an empty vector
names(fage)
# NULL

### Finding out more information
length(fage) # [1] 14
head(fage) # [1] 77 33 79 47 27 33
names(fage) # NULL
is.na(fage) # [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
min(fage) # [1] 24
is.logical(fage) # [1] FALSE
is.null(fage) # [1] FALSE
as.numeric(fgender) # [1] 2 1 2 2 1 1 2 1 2 2 1 2 2 1
objects()

### Subsetting
fage[10] # [1] 27
fage[-1] # [1] 33 79 47 27 33 67 52 59 27 55 24 46 48
fgender[foverWt]
# [1] m f m m m f
# Levels: f m

### Assign vaues to elements of a vector
fheight <- c(70, 64, 73, 67, 64, 68, 68, 65, 68, 71, 67, 66, 66, 62)
names(fheight) <- c(letters[1:14])
fheight
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# 70 64 73 67 64 68 68 65 68 71 67 66 66 62 

### By inclusion
fheight[2] = 61
fheight
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# 70 61 73 67 64 68 68 65 68 71 67 66 66 62 

### By exclusion
fheight[-13] = 62
fheight
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# 62 62 62 62 62 62 62 62 62 62 62 62 66 62 

### By name
fheight["e"] = 67
fheight
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# 62 62 62 62 67 62 62 62 62 62 62 62 66 62 

### By logical
fheight[foverWt] = NA
fheight
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# NA 62 62 62 67 NA NA 62 NA NA NA 62 66 62 

### No index
fheight[] = 70
fheight
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# 70 70 70 70 70 70 70 70 70 70 70 70 70 70 

### Watch out !!!
fheight = 70
fheight
# [1] 70

### Five ways to subset a vector
        #  Position – indices of the element you want
        #  Exclusion – indices of elements to exclude
        #  Logical – logical vector the same length as the vector being subset. 
                # Keep the elements corresponding to TRUE.
        #  Name – character vector of names of elements to keep. 
                # Vector being subsexed must have names associated with elements
        #  All – all the elements

### Logical Operations
4 < 3
# [1] FALSE
"a" == "A"
# [1] FALSE
"A" == "A"
# [1] TRUE
4 != 3
# [1] TRUE
# fweight > 150
# [1] TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
# [9] TRUE  TRUE TRUE FALSE FALSE FALSE
fgender !="m"
[1] FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE
[9] FALSE FALSE TRUE FALSE FALSE  TRUE
# fbmi
# [1] 25.16239 21.50106 24.45884 24.48414 18.06089
# [6] 28.94981 28.18797 20.67783 26.66430 30.04911
#[11] 26.05364 22.64384 24.26126 22.91060
# fbmi == 25.16239
# [1] FALSE FALSE FALSE FALSE FALSE FALSE ...
fgender == "f"
# [1] FALSE TRUE FALSE FALSE TRUE TRUE FALSE ! [8] TRUE FALSE FALSE TRUE FALSE FALSE TRUE

# Use this logical expression to subset the vector of fage
fage[ fgender == "f" ]
# [1] 33 27 33 52 55 48

(fage > 25)
# [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
(fage > 25) & (fnames == "Tom")
# [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
(fgender == "m") | (fage > 65)
# [1]  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE

all(fage > 18)
# [1] TRUE
any(fage < 18)
# [1] FALSE

# Ages of all non-overweight members of the family
fage[!foverWt]
# Genders of those over 50
fgender[fage > 50]
# Age of the tallest member of the family 
fage[fheight == max(fheight)]

### Creating Vectors
        #  c() - catenate vectors and values together 
        #  : - create a sequence of values 1 apart
        #  seq() – create more complex sequences
        #  rep() – repeat values in a vector
        #  sort() – sort the values in a vector
        #  order() – provide the order of values
c(3, 2, 1) # [1] 3 2 1
c(2,3,1) # [1] 2 3 1
x = c(bob = 3, alice = 2, john = 1)
x
# bob alice john
#   3     2    1
c(TRUE, FALSE) # [1] TRUE FALSE
c(1.3, 2, 8/3) # [1] 1.300000 2.000000 2.666667
c("a", "z", "Hello") # [1] "a" "z" "Hello"  
y = c(100, 120)
c(x, y)
# bob alice john
#   3     2    1 100 120
1:3 # [1] 1 2 3
4:7 # [1] 4 5 6 7
10:6 # [1] 10 9 8 7 6
1.1:5.7 # [1] 1.1 2.1 3.1 4.1 5.1
5.7:1.1 # [1] 5.7 4.7 3.7 2.7 1.7
5.7:-1.1 # [1] 5.7 4.7 3.7 2.7 1.7 0.7 -0.3
rep(3,2) # [1] 3 3
x = c(7,1,3)
rep(x, 2) # [1] 7 1 3 7 1 3
rep(x, times = 2) # [1] 7 1 3 7 1 3
rep(x, c(3, 2, 1)) # [1] 7 7 7 1 1 3
rep(x, each = 2) # [1] 7 7 1 1 3 3
seq(1, 5, by = 2) # [1] 1 3 5
seq(1, 5, length = 3) # [1] 1 3 5
seq(1, 5, length = 5) # [1] 1 2 3 4 5
seq(1, length = 5, by = 2) # [1] 1 3 5 7 9

rep(seq(0, 8, by = 2), each = 5) # [1] 0 0 0 0 0 2 2 2 2 2 4 4 4 4 4 6 6 6 6 6 8 8 8 8 8
rep(1:5, times = 5) # [1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
rep(1:5, times = 5) + rep(0:4, each = 5) # [1] 1 2 3 4 5 2 3 4 5 6 3 4 5 6 7 4 5 6 7 8 5 6 7 8 9

### sort() order()
fage
# [1] 77 33 79 47 27 33 67 52 59 27 55 24 46 48
sort(fage) # return the ordered values
# [1] 24 27 27 33 33 46 47 48 52 55 59 67 77 79
sort(fage, decreasing = TRUE)
# [1] 79 77 67 59 55 52 48 47 46 33 33 27 27 24
order(fage) # returns the order indeces
# [1] 12  5 10  2  6 13  4 14  8 11  9  7  1  3

lastname = character(length = 14) 
lastname # [1] "" "" "" "" "" "" "" "" "" "" "" "" "" ""
lastname[] = "Smith"
lastname
# [1] "Smith" "Smith" "Smith" "Smith" "Smith" "Smith" "Smith”
# [8] "Smith" "Smith" "Smith" "Smith" "Smith" "Smith" "Smith"
lname = character()
lname # character(0)
lname[1:14] = "Smith" 
lname
# [1] "Smith" "Smith" "Smith" "Smith" "Smith" "Smith" "Smith"
# [8] "Smith" "Smith" "Smith" "Smith" "Smith" "Smith" "Smith"

### Data Frames
setwd("~/Desktop/DATA MINING/Code")
load(file="familyData.rda")
family
class(family) # [1] "data.frame"
length(family) # [1] 7
dim(family) # [1] 14 7
names(family) # [1] "firstName" "gender"    "age"       "height"    "weight"    "bmi"       "overWt"   
family$gender
# [1] m f m m f f m f m m f m m f
# Levels: m f
mean(family$height) # [1] 67.07143
class(family$height) # [1] "numeric"
family[ 10:13, -(3:14)] 
#    firstName gender
# 10       Tom      m
# 11       Ann      f
# 12       Dan      m
# 13       Art      m
family[ , c("gender", "firstName") ]
family[family$weight > 180, c("height", "bmi")]
family["height"]
family[ , "height"] # [1] 70 64 73 67 64 68 68 65 68 71 67 66 66 62
### What’s the difference between these two expressions?
class(family["height"]) # [1] "data.frame"
class(family[, "height"]) # [1] "numeric”

### Reading data into R
CAquakes = read.table(file = "http://www.consrv.ca.gov/cgs/rghm/quakes/Documents/ms49epicenters.txt", header = TRUE)
dim(CAquakes) # [1] 383   4
CAquakes[1:3,]
#       Date Latitude Longitude   M
# 1 18001011     36.8    -121.5 5.5
# 2 18001122     32.9    -117.8 6.3
# 3 18030000     34.2    -118.1 5.5
class(CAquakes$Date) # [1] "integer"
class(CAquakes$Latitude) # [1] "numeric"
class(CAquakes$Longitude) # [1] "numeric"
class(CAquakes$M) # [1] "numeric"

### Lists
Ingredients = list(cheese = c("Cheddar", "Swiss"), meat = c("Ham","Turkey", "Bologna"))
Ingredients
# $cheese
# [1] "Cheddar" "Swiss"  
# $meat
# [1] "Ham"     "Turkey"  "Bologna"

### Indexing lists
Ingredients[2]
# $meat
# [1] "Ham"     "Turkey"  "Bologna"
Ingredients[[2]][2]
# [1] "Turkey"
class(Ingredients[2]) # [1] "list"
class(Ingredients[[2]][2]) # [1] "character"

# To extract individual elements of a list with [[]]
Ingredients[[2]]
# [1] "Ham"     "Turkey"  "Bologna"
class(Ingredients[[2]])
# [1] "character"

### Linear regression
x = 1:100
y = x * 3 + rnorm(100)
regression.results = lm(y ~ x)       # Regress y on x
is.list(regression.results)
# [1] TRUE
names(regression.results)
#  [1] "coefficients"  "residuals"     "effects"       "rank"          "fitted.values" "assign"        "qr"            "df.residual"  
# [9] "xlevels"       "call"          "terms"         "model" 
regression.results$coef     # Note partial matching
# (Intercept)           x 
# -0.02010826  3.00066065 
class(regression.results$coef) # numeric
# [1] "numeric"

### LISTS are ordered container of objects (vectors, data frames, lists, etc)

### Matrices and Arrays
        #  Rectangular collection of elements
        #  Dimensions are two, three, or more
        #  Homogeneous primitive elements (e.g. all numeric or all character)

### Matrices
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
m <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
m
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
rownames(m) = letters[1:2]
colnames(m) = letters[1:3]
m
#   a b c
# a 1 2 3
# b 4 5 6
dim(m) # [1] 2 3
nrow(m) # [1] 2
ncol(m) # [1] 3
t(m) # transpose
#   a b
# a 1 4
# b 2 5
# c 3 6

# To index elements of a matrix, use the same five methods of indexing we covered for vectors, 
# but with the first index for rows and the second for columns.
m
#   a b c
# a 1 2 3
# b 4 5 6
m[-1, 2] # Exclussion & inclusio by position
# [1] 5
m["a",] # By name, empty column index
# a b c 
# 1 2 3 
m[, c(TRUE, TRUE, FALSE)] # Empty row index, logical
#   a b
# a 1 2
# b 4 5

# Matrices and arrays are actually just stored as vectors with shape information, 
      # so our discussions of “vectorized” calculations hold for matrices as well.
# This is NOT true for lists and data frames.

############################################################################################
############################################################################################
############################################################################################

##############
### Graphics
##############

rm(list=ls())

### Visualization enters every step of the data analysis cycle
          # Data cleaning – are there anomalies? 
          # Exploration
          # Model checking
          # Reporting results
# Plots can uncover structure in data that can’t be detected with numerical summaries
# Important communication skill

### Graphic Models
        # Painter - we will use this one, starts with a blank canvas and add/paint on it
        # Object-oriented - easy to get started but hard to tweak

### The appropriate graphical techniques depend on the kind of data that you are working with
        #  Quantitative
              #  continuous – e.g. height, weight
              #  discrete – numeric data with few values, e.g. number of children in family
        #  Qualitative
              #  ordered – categories with an order but no meaningful distance between, 
                    # e.g. number of stars for a movie rating
              #  nominal - categories have no meaningful order, e.g. gender

#######################
### Case: Infant Health
#######################

load(url("http://www.stanford.edu/~vcs/StatData/KaiserBabies.rda"))
objects()
names(infants)
# [1] "gestation" "bwt"       "parity"    "age"       "ed"        "ht"        "wt"        "dage"      "ded"      
#[10] "dht"       "dwt"       "marital"   "inc"       "smoke"     "number"   
dim(infants)
# [1] 1236   15

### Rug plot
# Each baby’s weight is represented as a tickmark. 
# The thicker lines are from multiple babies with similar weights.
?rug
rug(x=infants$bwt, na.rm=TRUE)

### Distribution
      # The distribution is the pattern of variation in the birth weights.
      # It provides the numerical values for birth weight and how ofen each value occurs.
      # A histogram/density plot shows the shape of the distribution

### Histogram
      # Are a special case of density plots
      # AREA = Proportion (or percent)
      # The area of a bar:  Height * Width = Area (Proportion/oz) * oz = Proportion
      # Histograms are not the same as bar charts
      # With bar charts, it is only the height that matters. 
      # Bar charts are for qualitative data
hist(infants$bwt)
hist(infants$bwt, freq = FALSE,
     xlab = "Birth Weight (oz)",
     main = "Male Babies, Oakland Kaiser 1960s")

### Density plot - smoothed histogram
plot(density(infants$bwt))
plot(density(infants$bwt), 
       xlab = "Birth Weight (oz)", 
       main = "Male Babies, Oakland Kaiser 1960s")
# Here we can control how much to smooth in the density plot
plot(density(infants$bwt, bw = 1))

### Boxplot
boxplot(infants$bwt, horizontal=TRUE)
boxplot(infants$bwt, horizontal=TRUE, xlab="Birth Weight (oz)")

### Quantitative Distribution
      # Distribution: pattern of values for a variable
      # Mode: high density region
      # Long Tail: many observations far from center
      # Symmetry/Skewness: distribution of values the left and right of the center.
      # Gaps: places where there are no observations.
      # Outliers: unusually large or small values that falls well beyond the overall pattern of data

### Parity = number of siblings
# This quantitative variable is different from birth weight there are only a few possible values, 
      # i.e. it’s not possible to have 2.3 siblings, and it’s highly unlikely to have 17
table(infants$parity)

### Barplot
barplot(table(infants$parity))

### Bar width of the plot has no meaning
plot(table(infants$parity),
     type = "h", # we want lines
     lwd = 4, # line width, 4 means really wide
     ylab = "Proportion", 
     col = "darkgrey")

###########################
### Case: College Students
###########################

rm(list=ls())
load(url("http://www.stanford.edu/~vcs/StatData/videogame.rda"))
objects()
names(video)
#  [1] "time"  "like"  "where" "freq"  "busy"  "educ"  "sex"   "age"   "home"  "math"  "work"  "own"  
# [13] "cdrom" "email" "grade"
dim(video) # [1] 91 15

# sex is qualitative (nominal)
# grade is qualitative with an ordering

table(video$grade)
table(video$grade, video$sex)

### Bar chart
barplot(table(video$grade))

### Pie chart
pie(table(video$grade))

### Dot chart
dotchart(x = as.numeric(table(video$grade)), pch = 19)

### Mosaic Plot
# compare the distribution for subgroups or to compare against another population or standard
mosaicplot(table(video$sex, video$grade), main = "Stat 2 Survey")

################################
# Case: East Bay Housing Market
################################

rm(list=ls())
load(file=url("http://www.stanford.edu/~vcs/StatData/SFHousing.rda"))
objects()
dim(housing) # [1] 281506     15
someCities = c("Albany", "Berkeley", "El Cerrito", "Emeryville",
               "Piedmont", "Richmond", "Lafayette", "Walnut Creek",
               "Kensington", "Alameda", "Orienda", "Morega")
shousing = housing[housing$city %in% someCities & housing$price < 2000000,]
dim(shousing) # [1] 18761    15

### Boxplot
boxplot(shousing$price ~ shousing$city, las = 2)

### Dot plot
ppsf = shousing$price / shousing$bsqft
plot(ppsf ~ shousing$bsqft)

### Scatter plot
plot(ppsf ~ shousing$bsqft, # plot y against x 
     pch=19, # change plovng character to solid circle 
     cex = 0.2, # shrink plovng character to 20% 
     subset = shousing$city =="Berkeley", # plot a subset of records
     main = "Berkeley", # title of plot
     xlab = "Area (ft^2)", # label for x axis
     ylab = "Price/ft^2")  # label for y axis
     
# TWO QUALITATIVE VARIABLES
    # Mosaic Plot
    # Side-by-side plot
# ONE QUANTITATIVE AND ONE QUALITATIVE
    # Boxplot
    # Dot chart
    # Multiple density plots
    # Violin plots
# TWO QUANTITATIVE VARIABLES
    # Scatter plot
    # Line plot

###################
# Case: Fix a plot
###################
rm(list=ls())
chips = read.table("http://www.stanford.edu/~vcs/StatData/chip04.txt", header = TRUE)
class(chips) # [1] "data.frame"
names(chips) # [1] "Name" "Date" "Transistors" "Microns" "ClockSpeed"  "Data" "MIPS"   
dim(chips) # [1] 10  7

# Redo the plot in the slides
plot(chips$Date, chips$Transistors, type ="l", 
       lwd = 3, col ="green", log ="y",
       xlab="Date", ylab="Transistors (log)")

# Reference plotting functions
    # hist() histogram
    # boxplot() boxplot
    # dotchart() dotchart
    # plot() for scatter plots, line plots, density plots
    # barchart()
    # pie()
    # mosaicplot()

# Reference add-on functions for plots
    # abline() add line to canvas
    # points() add points to canvas
    # lines() add line segments to canvas
    # text() add text to canvas

# Reference for PLOT arguments
    # type = "p" for points, "l" for lines, "n” for nothing
    # ylim = c(0, 1) the range for the scale of the axis
    # xlab = "x axis label"
    # main = "plot title" 
    # col = vector of colors
    # log = "y" use log scale on y axis, can be "x" or "xy"
    # lwd = 2 thickness of line
    # pch = 19 plotting character – check other numbers
    # cex = 0.5 character magnification
    # lty = 2 type of line – check other numbers
    # las = 0, 1, 2, or 3 style of tick mark labels

# Graph Construction:
    # Properties of good graphs:
          # Data stand out
                # Avoid having other graph elements interfere with data
                # Use visually prominent symbols
                # Avoid overplotting (use jitter)
                # Different values of data may obscure each other
                # Choosing the scale of the axis
                # Eliminate superfluous material (extra tick marks, unnecessary text and arrows)
          # Facilitate comparison
                # Put juxtapose plots on same scale
                # Make it easy to distinguish elements of superposed plots (e.g. color)
          # Information rich
                #  Describe what you see in the Caption
                        # Describe what has been graphed 
                        # Draw attention to important features 
                        # Describe conclusions drawn from graph
                #  Add context with Reference Markers (lines and points) including text
                #  Add Legends and Labels
                #  Use color and plottng symbols to add more information
                #  Plot the same thing more than once in different ways/scales
                #  Reduce clutter

### Good Plot Making Practice
      #  Put major conclusions in graphical form
      #  Provide reference information
      #  Proof read for clarity and consistency
      #  Graphing is an iterative process
      #  Multiplicity is OK, i.e. two plots of the same variable may provide different messages
      #  Make plots data rich

### Perception: Color, shape (including banking) can affect your ability to make good comparisons
# Banking at 45 degrees
      #  Roughly: Examine the absolute value of the orientation of segments, 
              # they should be centered at 45 degrees.
      #  Transformations to improve the aspect ratio uncovers the structure 
              # of the relationship between variables
      #  Easier to see important features

### Bar plot vs Pie chart
        # Pie chart judgments are less accurate than bar chart judgments
        # Bar chart errors are about the same size for all percents.
        # Pie chart errors tend to be larger for percents greater than 35%

### Color
      # 7-10% of males are red-green color blind
      # Saturated/colorful colors are hard to look at for a long time.
      # They tend to produce an after-image effect which can be distracting
      # Lighter colors tend to make areas look larger than darker colors

### Data Type and Color
      # Qualitative – Choose a qualitative scheme that makes it easy to distinguish between categories
      # Quantitative – Choose a color scheme that implies magnitude.
            # Does the data progress from low to high? 
                  # Use a sequential scheme where light colors are for low values
            # Do both low and high value deserve equal emphasis? 
                  # Use a diverging scheme where light colors represent middle values

###############################################
# Case: Voter Registration Trends in California
###############################################
rm(list=ls())
# Data for first plot
MajorityOfDemocrats = c(21, 23, 29, 37, 43)
MajorityOfRepublicans = c(37, 35, 29, 21, 15)
ElectionYear = c("2004", "2008", "2000", "1996", "1992")
# Data for second plot
year = c(1992, 1996, 2000, 2004, 2008)
eligible = c(20612814, 19298379, 21190865, 21843202, 22987562)
registeres = c(13217022, 14314658, 14676174, 14945031, 15468551)
dem = c(.485, .474, .462, .432, .427)
rep = c(.389, .368, .349, .357, .336)
other = c(.031, .052, .052, .049, .044)
decline = c(.095, .106, .137, .162, .193)
require(RColorBrewer)
# how to select palette
colors = brewer.pal(9, "Set1") 
plot(dem ~ year, type="l", col=colors[3])

#################################
# Case: read data from web (CO2)
#################################

rm(list=ls())
myData = read.table( url("http://www.stanford.edu/~vcs/StatData/CO2Nations.txt"),
                     header = TRUE, sep = "\t") 
head(myData)
require(reshape2)
MyNewData <- melt(data=myData, value.name="Years", variable.name="VarName")
head(MyNewData)
colors = brewer.pal(9, "Set1") 
plot(x=MyNewData$VarName, y=MyNewData$Years, type="l", col=colors, horiz=FALSE)

############################################################################################
############################################################################################
############################################################################################

################################
### Data frames, Lists, Matrices
################################

######################################
# Olympics Data with GDP from ManyEyes
######################################
ctry <- read.csv("http://www-958.ibm.com/software/data/cognos/manyeyes/datasets/olympic2012withgdp/versions/1.txt", 
                  skip = 1, sep = "\t", header = FALSE,
                  colClasses = c("character", rep("numeric", 5), rep("character", 3)))
head(ctry)

### VECTOR: 
      # ordered container of literals
      # elements must be same type
### DATA FRAME:
      # ordered container of vectors
      # vectors must all be the same length
      # vectors can be different types

###############
# Wireless Data
###############

w <- read.table("http://www.stanford.edu/~vcs/StatData/wireless.txt", header=TRUE)
head(w)
class(w) # [1] "data.frame"
names(w) # [1] "x"  "y"  "S1" "S2" "S3" "S4" "S5"
dim(w) # [1] 259   7
summary(w$S1)
#    Min. 1st Qu.  Median    Mean  3rd Qu.    Max. 
#  -92.00  -90.00  -80.00  -77.41  -71.00  -33.00 
w[w$x > 200, c("S2")]
#  [1] -78 -74 -35 -43 -46 -43 -41 -48 -68 -71 -67 -70 -58 -61 -64 -73 -71 -67 -68 -61 -60 -57
# [23] -58 -56 -48 -51 -68 -54 -51 -48 -46 -35 -67

X = rep(w$x, 5)
Y = rep(w$y, 5)
ap = rep(1:5, each = nrow(w))
SS = c(w$S1, w$S2, w$S3, w$S4, w$S5)
D1 = sqrt((w$x - ap[1, "x"] )^2 + (w$y - ap[1, "y"])^2 )
D2 = sqrt((w$x - ap[2, "x"] )^2 + (w$y - ap[2, "y"])^2 ) 
D3 = sqrt((w$x - ap[3, "x"] )^2 + (w$y - ap[3, "y"])^2 ) 
D4 = sqrt((w$x - ap[4, "x"] )^2 + (w$y - ap[4, "y"])^2 ) 
D5 = sqrt((w$x - ap[5, "x"] )^2 + (w$y - ap[5, "y"])^2 )
Dist = c(D1, D2, D3, D4, D5)
newW = data.frame(x = X, y = Y, AP, SS, Dist)

### LISTS:
      # each element in a list can have a different length
      # each element of a list can be a list, a data frame, a vector or a matrix

##########
# Rainfall
##########
load(url("http://www.stanford.edu/~vcs/StatData/rainfallCO.rda"))
class(rain) # [1] "list"
length(rain) # [1] 5
names(rain) # [1] "st050183" "st050263" "st050712" "st050843" "st050945"

# Lists can be indexed by name using $
class(rain$st050183) # [1] "numeric"
length(rain$st050183) # [1] 9878
head(rain$st050183) # [1]  0 10 11  1  0  0

# Lists can be indexed by position or name using [[ ]]
class(rain[["st050945"]]) # [1] "numeric"
length(rain[["st050945"]]) # [1] 3692
head(rain[[5]]) # [1]  0  0  1  0 26  0

# List can be indexed like vectors using [ ]
class(rain["st050183"]) # [1] "list"
length(rain["st050183"]) # [1] 1

# To extract individual elements of a list use [[ ]]
class(rain[[1]]) # [1] "numeric"
head(rain[[1]]) # [1]  0 10 11  1  0  0

### Matrices and Arrays
      #  Rectangular collection of elements
      #  Dimensions are two, three, or more
      #  Homogeneous primitive elements (e.g., all numeric or all character)

### Arrays - matrices in higher dimensions
x = array(1:30, c(4, 3, 2)) # wil be a 4 by 3 matrix and will be two of them
x
x[1:2, 3, 2] # take rows 1 to 2 from the 3rd column in the 2nd matrix
x[ , 2, 1] # take all rows from 2nd column in the first matrix
x[3:4, c(3, 1), 1] # take the 3rd and 4th rows from 3rd and 1st columns in the 1st matrix

# Vector: ordered collection of primitive types
# Data frame: ordered collection of vectors all same length
# List: ordered collection of objects

### Apply Functions
      # apply() is for matrices
      # sapply() for lists and data frames - outcome is a vector
      # lapply() for lists and data frames - outcome is a list
      # tapply() for "tables" (ragged arrays as vectors)

# get the mean of rainfall for all stations
lapply(X=rain, FUN=mean) # outcome is a list of means
sapply(X=rain, FUN=mean) # outcome is a vector of means

lapply(X=rain, FUN=mean, na.rm=TRUE, trim=.1) # outcome is a list of means
# na.rm = TRUE - exclude missing values
# trim=.1 - trim at the 90%
args(lapply)

# tapply() - general version
x <- c(1:10)
x
v <- c(1,1,1,0,0,0,1,1,1,0)
v
tapply(x,v,mean)
tapply(x,v,median)

# rainfall data
sapply(rain, max)
sapply(rain, quantile, probs=.99)

# to see if number of recordings matches the number of days
all(sapply(rain, length) == sapply(day, length))

# how many years each station was in operation
# Version 1
Year = lapply(day, floor) 
Year
Uyear = lapply(Year, unique)
Uyear
OpYear = sapply(Uyear, length)
OpYear
# Version 2
length(unique(floor(day[[1]])))

# First EG for orphan function
# For this orphan function we do not need curly brackets because we have
# only one command - length(unique(floor(x)))
sapply(day, function(x) length(unique(floor(x))))
# takes this function - length(unique(floor(x))) and applies it to the data (day)

# Second EG for orphan function
sapply(rain, function(x) sum(x > 0)/length(x) )
# takes this function - sum(x > 0)/length(x) and applies it to the data (rain)

### Matrices and arrays
# apply() for matrices
x <- matrix(1:6, 2)
x
apply(X=x, MARGIN=1, FUN=sum) # put sum on all the rows of x, because we have MARGIN=1
apply(X=x, MARGIN=2, FUN=sum) # put sum on all the columns of x, because we have MARGIN=2
apply(X=x, MARGIN=2, FUN=min)


############################################################################################
############################################################################################
############################################################################################

##############################
### Writing your own functions
##############################

### EG1:
x <- c(1,2,3)
centers <- function(x)
{
  MEAN = mean(x)
  MEDIAN = median(x)
  return(list(avg=MEAN, mdn=MEDIAN))
}
centers(x)

### Write function that transforms inches to cm
# OPTION 1: here we don't need brakets {} since there is only one expression
convert = function(x) x*2.54
# OPTION 2:
convert <- function(x)
{
  x*2.45
}
convert(x)

### IF/ELSE STATEMENT
# OPTION 1:
if ( any(x <= 0) ) y = log(1+x) else y = log(x)
# OPTION 2:
y = if ( any(x <= 0) ) log(1+x) else log(x)
# OPTION 3:
if( any(x <= 0) ) x = 1+x
y = log(x)

# Logical arguments to tell a function what to do
corplot = function(x, y, plotit = TRUE){
  if ( plotit == TRUE ) plot(x, y)
}
# Verify that the arguments of a function are as expected
if ( !is.matrix(m) ) 
    stop("m must be a matrix")
# Handle common numerical errors
ratio = if ( x!=0 ) y/x else NA
# Control which block of code is executed
normt = function(n, dist) { 
  if ( dist == "normal" ) {
  return( rnorm(n) )
    } else if (dist == "t") {
  return(rt(n, df = 1, ncp = 0))
} else stop("distribution not implemented")
}

### IFELSE
ratio = ifelse(x!=0, y/x, NA) # (Compare with earlier)
US.indicator = ifelse(country == “USA”, 1, 0)
plot(Income, Donations, col = ifelse(party == “Republican”, “red”, “blue”)

### Write a function that takes a data frame 
get_area <- function(data)
{
  a = data[,1] * data[,2]
  return(a)
}

# Convert inch in cm and cm to inch (control flow)
convert <- function(x, end_units="cm")
{
  if(end_units == "cm")
  {
    return(x*2.54)
  }
  if(end_units == "inches")
  {
    return(x/2.54)
  }
}
convert(x, end_units="inches")

### IFELSE
x <- c(1,2,3,4)
y <- c(0,3,2,5)
MYFUN = ifelse(x>y, 1, 0)
MYFUN # [1] 1 0 1 0

### Two ways to write this function
length(unique(floor(rain[[1]]))) # [1] 123
numYears = function(y) {
  length(unique(floor(y)))
}
numYears(rain[[1]]) # [1] 123
sapply(rain, numYears)
# st050183 st050263 st050712 st050843 st050945 
#    123       27      113      139      100 
sapply(rain, function(y) length(unique(floor(y))))     
# st050183 st050263 st050712 st050843 st050945 
#    123       27      113      139      100 
  
# Other functions
sqrt( (x - pt[1])^2 + (y - pt[2])^2 )
distToPoint = function(x, y, pt = c(0, 0)) {
  sqrt( (x - pt[1])^2 + (y - pt[2])^2 )
}

### LOOPING
     # Looping is the repeated evaluation of a statement or block of statements.
     # Much of what is handled using loops in other languages can be more 
            # efficiently handled in R using vectorized calculations or 
            # one of the apply mechanisms.
     # However, certain algorithms, such as those requiring recursion, 
            # can only be handled by loops.
     # There are two main looping constructs in R: for and while.
     
### For loops
     # A for loop repeats a statement or block of statements a predefined number of times.
     # for ( var in vector ){ statement }
     # For each element in vector, the variable var is set to the value of 
            # that element and statement is evaluated.
     # Vector often contains integers, but can be any valid type.
     
### While loops
     # A while loop repeats a statement or block of statements
            # for as many times as a particular condition is TRUE
     # while (condition){ statement }
     # condition is evaluated, and if it is TRUE, statement is evaluated. 
     # This process continues until condition evaluates to FALSE.     
     
### PLOT FUNCTION
make_plot <- function(x, y, verts=NULL)
{
  plot(x, y, type="l")
  if(!is.null(verts)){
    ablines(v=verts)
  }
}
make_plot()

### Write a function that simulates flipping a coin until a fixed number of heads 
# are obtained. It should take the probability p and the total number of heads total
# and return the trial on which the final head was obtained. 
# This produces a single sample from the negative binomial distribution.
# The break statement causes a loop to exit. 
# This is particularly useful with while loops, which, if we’re not careful, 
# might loop indefinitely (or until we kill R).
myRNG = function(total, p = 0.5){
       # Simulate number of tosses to get 10 Heads
       x=0
       steps = 0 
       max.iter = 1000
       while(x < total){
         x = x + sample(1:0, size = 1, prob = c(p, 1-p))
         steps = steps + 1
         if(steps >= max.iter){
           warning(“Maximum iteration reached”)
           break }
       }
       return(steps)
     }

############################################################################################
############################################################################################
############################################################################################
     
#####################    
### Simulation Part I
#####################

# Steps in carrying out a simulation study:
     # 1.  Specify what makes up an individual experiment: 
                # sample size, distributions, parameters, statistic of interest.
     # 2.  Write an expression or function to carry out an individual experiment 
                # and return the statistic.
     # 3.  Determine what inputs, if any, to vary 
                # (e.g. different sample sizes or parameters).
     # 4.  For each combination of inputs, repeat the experiment B times, 
                # providing B samples of the statistic.
     # 5.  For each combination of inputs, summarize the empirical distribution 
                # of the statistic of interest.
     # 6.  State and/or plot the results. (Sometimes go back to 3.)

### Useful Random Number Generators
# sample(x, size, replace = TRUE, prob = NULL)
# replace = TRUE - sample with replacement

### Standard Probability Distributions
# runif(n, min=0, max=1) # uniform distribution
# rnorm(n, mean=0, sd=1) # normal distribution
# rbinom(s, size, prob) # binomial distribution
# rexp() # exponential distribution
# rpois() # poissant distribution
# rt() # t distribution
# rf() # f distribution

# Pseudo Random Number Generator
# starts with a seed and an algorithm
# x_1 = a * x_0 mod b
# x_(n+1) = a * x_n mod b
# x_0 is the seed

# EG: a = 3, b = 64, seed = 17
# 3 * 17 mod 64 = 51 mod 64 = 51

# plot(x3b64[1:(n-1)], x3b64[2:n], xlab = "current value”, ylab = "next value")
# cong(n, a = 69069, b = 2^32)

# set.seed() # in order to reproduce your simulation
set.seed(69069)
runif(3) # [1] 0.1648855 0.9564664 0.3345479

# Sample(1:0, size=1, prob=c(p, 1-p))
# Simulate number of tosses to get 10 Heads
max.iter = 1000 
x = 0
steps = 0 
while(x < 10)
{
  x = x + sample(c(0, 1), 1)
  steps = steps + 1
  if(steps == max.iter)
    {
    warning("Maximum iteration reached")
    break }
}

# Experiment:
n = 27
s = 3
set.seed(5)
median(rnorm(n=n, sd=s)) # [1] -0.4726031

# Repeat Experiment
B = 1000
set.seed(5)
sampleMs = replicate(1000, median(rnorm(n = n, sd = s)))
mean(sampleMs) # [1] -0.02800491
sd(sampleMs) # [1] 0.7042437
hist(sampleMs)

# Repeat Expriment for different n and s
ns = seq(20, 200, by = 10)
ss = seq(1, 10, by = 0.5)
samples = matrix(nrow = length(ns), ncol = length(ss))
for (i in 1:length(ns)) 
  {
     for (j in 1:length(ss)) 
       {
          samples[i , j] = mean(replicate(1000, median(rnorm(n = ns[i], sd = ss[j]))))
        } 
  }

     
############################################################################################
############################################################################################
############################################################################################
     
######################
### SIMULATION PART II
######################

# understand the distribution that generated the data
# understand miu and sigma squared in order to understand the distribution
# distribution  -----(sampling mechanism/probability)----> sample data
# sample data ------inference-----> distribution
# assumptions how this is generated
# with simulation we can cheat
# ideal we take a lot of samples, however, in reality we take only one sample
# Brad Efron (1979) - statistics professor --- invented BOOTSTRAP 
     # (resample from the sample)
# we CAN resample from our sample ---- this will illumininate the insight about the distribution

# EG: normal distribution with center zero
# take n samples from the sample 
# use sample medians to estimate features of the sampling distribution of the median (center, spread, shape)
# generate n random normal values from Normal(O, s^2)
n = 27
s = 3
median(rnorm(n=n, sd=s)) # [1] -0.2037243

# Repeat Experiment
B = 1000
set.seed(5)
sampleMs = replicate(1000, median(rnorm(n = n, sd = s)))
mean(sampleMs) # [1] -0.02800491
sd(sampleMs) # [1] 0.7042437
hist(sampleMs)

# Repeat the simulation for different values of n and s
ns = seq(from=20, to=200, by=10)
ss = seq(from=1, to=10, by=0.5)

samples = matrix(nrow = length(ns), ncol = length(ss)) # create a matrix 

MYbootstrap <- function(samples)
{
  for (i in 1:length(ns)) 
  {
    for (j in 1:length(ss)) 
    {
      samples[i , j] = mean(replicate(1000, median(rnorm(n = ns[i], sd = ss[j]))))  
    } 
  }  
}

MYbootstrap(samples)

#################################
# Bootstrap EG from courseworks
# Stat Village
#################################
# Bus = (c(0.2, 0.2,.2,.2,.1,.05, .01,.01,.01,.01,.005,.005)))
# sum(ps)
# statVillage = sample(1:12, size = 1200, replace =TRUE, prob = ps)
# save(statVillage, file="~/Courses/Stat133/Lectures/Wk12_Resampling/statVillage.rda")

load(url("http://www.stat.berkeley.edu/users/nolan/data/statVillage.rda"))
head(statVillage)
mean(statVillage)
sum(statVillage >6)/length(statVillage)
table(statVillage)
plot(table(statVillage), type = "h", lwd = 5)

sample(statVillage, 30, replace = TRUE)
mean(sample(statVillage, 30, replace = TRUE))

sampAvgs = replicate(1000, mean(sample(statVillage, 30, replace = FALSE)))
head(sampAvgs) # [1] 3.400000 3.500000 2.233333 2.866667 3.000000 3.300000
hist(sampAvgs, breaks = 30)

mean(sampAvgs) # [1] 3.3312
mean(statVillage) # [1] 3.325833
sd(sampAvgs) # [1] 0.3881029

#################################
# Bootstrap EG from courseworks 
# Video Games Surveys
#################################

# Simple EG: draw from the distribution (EG in class)
# Complex EG: draw from existing data (this is an EG for it)

bootStrapS = function(mySample, B = 1000)
  {  replicate(B, mean(sample(x=mySample, size=length(mySample), replace=TRUE)))  } 
                                                        # need to sample with replacement

bootStrap = function(mySample, popSize = NULL, B = 1000, repl = FALSE)
  { if (repl) 
    {
    return(replicate(B, mean(sample(x=mySample, size=length(mySample), replace=TRUE))))
    } else 
    {
    vals = sort(unique(mySample))
    counts = table(mySample)
    bootPop = rep(vals, round(counts * popSize / length(mySample)))
    return(list(bootPop, bootSamps = replicate(B, mean(sample(x=bootPop, size=length(mySample), replace=FALSE)))))
    }
  }

bootSampAvgs = bootStrap(mySample, popSize = 1200)
length(bootSampAvgs[[2]])
head(bootSampAvgs[[2]])
mean(bootSampAvgs[[2]])
hist(bootSampAvgs[[2]], breaks = 30)

videoSample =rep(c(0,.1,.5,1,1.5,2,3,4,5,14,30), times = c(57,1,5,5,1,14,3,1,1,2,1))
videoSample
length(videoSample)
hist(videoSample, breaks = 30)
mean(videoSample)

bootResults = bootStrap(videoSample, popSize = 314)
head(bootResults[[1]])
hist(bootResults[[1]], breaks = 30)

length(bootResults[[2]])
head(bootResults[[2]])
mean(bootResults[[2]])
hist(bootResults[[2]], breaks = 30)
 
     
############################################################################################
############################################################################################
############################################################################################     
     
####################################
### Text Data - Regular expressions
####################################

### ELECTION STUDY:
        # GEOGRAPHIC DATA - longitude ad latitude of country center
        # POPULATION DATA - census for each county
        # ELECTION RESULTS - 2008 for each county scraped from a website
     # NEED TO MATCH/MERGE THE INFORMATION
     
# PROBLEM THAT OCCUR WHEN MERGING DATA:
    # Capitalization
    # Missing data
    # St. vs St
    # White Spaces: DeWitt vs De Witt
     
### TEXT MINING STATE OF THE UNION ADDRESSES:
     # each speech starts with "***", followed by 3 lines of information: who gave the speech and when
     # create a word vector for each speech
     # stem words: nation, national, nations
     
### WEB BEHAVIOR:
     # Information recorded when you visit a website:
            # the page visited
            # date and time of visit
            # browser used
            # operating system
            # IP address
     # Information has a lot of structure
     # Information IS NOT:
              # consistently separated by the same characters such as in a csv file
              # placed cocnsistently in the same columns in the file

### SPAM FILTERING:
     # 3 PARTS:
            # Header
                    # date, sender and subject
                    # message ID
                    # who are the carbon-copy recipients
                    # return path
                    # SYNTAX - KEY: VALUE
            # Body
                    # is separated from the header by a single blank line
                    # MIME = Multipurpose Internet Mail Extensions
                    # use MIME to figure out which is the body and which is the attachment
                    # BOUNDARY key:
                            # special character string to mark beginning and end of message
                            # start of message: BOUNDARY="_===669732====calmail-me.berkeley.edu===_”
                            # end of message: BOUNDARY="--_===669732====calmail-me.berkeley.edu===_--"
                                  # end of message has 2 extra hyphens
            # Attachments (optional)
                    # are included in the body of the message
                    # attachments use MIME
                    # Content-Type: MULTIPART/Mixed;    ---- this means attachments are present

### Characteristics of email:
     # When was it send?
          # numeric 00-24 hour received
     # Has an Re: in the subject line
          # Logical: TRUE if Re: in subject line
     # Funny words like v!@gra
          # Logical: TRUE if punctuation in the middle of word
     # Lots of YELLING IN THE EMAIL
          # Numeric: proportion of characters that are capitals

### STRING MANIPULATION FUNCTIONS:
# substring(text, first, last) – extract a portion of a character string from text, 
        # beginning at first, ending at last
# nchar(text) – return the number of characters in a string
# strsplit(x, split) – split the string into pieces using split 
        # to divide it strsplit(x, "") – splits into one character pieces
# paste(x, y, z, ..., sep = " ", collapse = NULL) – paste together character 
        # strings separated by one blank
# tolower(x) toupper(x) - convert uppercase characters to lowercase, or vice versa. 
        # Non-alphabetic characters are let unchanged

test = "St John the Baptist Parish"
# option one
substring(test, 1, 2) # [1] "St"
substring(test, 1, 2)  ==  "St" # [1] TRUE
newName = paste("St.", substring(text=test, first=3, last=nchar(test)), sep ="")
newName # [1] "St. John the Baptist Parish"
# option two
substring(test, 1, 3) # [1] "St "
substring(test, 1, 3)  ==  "St " # [1] TRUE
newName = paste("St. ", substring(text=test, first=4, last=nchar(test)), sep ="")
newName # [1] "St. John the Baptist Parish"

# EG: St vs St. 
string = "The Slippery St Frances" 
chars = unlist(strsplit(x=string, split="")) 
chars
# [1] "T" "h" "e" " " "S" "l" "i" "p" "p" "e" "r" "y""""S""t""""F""r""a""n""c""e" "s" 
possible = which(chars == "S")
possible
# [1] 5 14
substring(text=string, first=possible, last=possible + 2)
# [1] "Sli" "St "
substring(text=string, first=possible, last=possible + 2) == "St "
# [1] FALSE  TRUE

### Other functions: 
     # gsub() --- GLOBAL substitution
     # sub() --- replaces ONLY the first match
     # BOTH look for a PATTERN and REPLACE it within a string with some other text
     # BOTH are vectorized
cNames = c("Dewitt County", "Lac qui Parle County", "St John the Baptist Parish", "Stone County")
gsub(pattern="St ", replacement="St. ", x=cNames)
# [1] "Dewitt County"
# [2] "Lac qui Parle County"
# [3] "St. John the Baptist Parish"
# [4] "Stone County"
strings = c("a test", "and one and one is two", "one two three")
gsub(pattern="one", replacement="1", x=strings) # general substitutions (all in a string)
# [1] "a test"  "and 1 and 1 is two"  "1 two three"
sub(pattern="one", replacement="1", x=strings) # just the first one in a string
# [1] "a test"  "and 1 and one is two"  "1 two three"

### REGULAR EXPRESSIONS:
     # Regular Expressions give us a powerful way of matching patterns in text data
     # Do it PROGRAMATICALLY, so we can easily reproduce our work if needed

# Uses of Regular Expressions:
     # extract pieces of text
     # create variables from information found in text
     # clean and transform text into a uniform format, resolving inconsistencies in format between files
     # mine text by treating documents directly as data
     # "scrape" the web for data

# Regular Expression (regex and regexp) = pattern that describes a set of strings
     # this may be finite or infinite, depending on the particular regexp
     # regexp "matches" each element of that set
            # grey|gray  --- matches both grey and gray
            # ^A.*  --- matches any string starting with capital A
     
# Syntax:
     # LITERAL characters are matched only by the character itself.
     # A CHARACTER CLASS is matched by any single member of the specified class. 
            # For example, [A-Z] is matched by any capital letter.
     # MODIFIERS operate on literal characters, character classes, or combinations of the two. 
            # For example ^ is an anchor that indicates the literal 
            # must appear at the beginning of the string     
     
### EQUIVALENT CHARACTERS:
      # enumerate a colection of characters [Tt]his
      # character "-" used to determine range [0-9] or [A-Za-z]
      # put caret ^ to determine that is the first character [^0-9]
      # include the character "-" in the set of characters to match [-+][0-9]
              # this is patterns from a SEQUENCE of two patterns

### EQUIVALENCE CLASSES:
      # [:alpha:] All alphabetic
      # [:digit:] Digits 0123456789
      # [:alnum:] All alphabetic and numeric 
      # [:lower:] Lower case alphabetic
      # [:upper:] Upper case alphabetic 
      # [:punct:] Punctuation characters
      # [:blank:] Blank characters, i.e. space or tab

# [[:digit:]_] can be used in conjunction with other characters

words <- c("rep1!c@ted", "replicated", "funny", "class33er")
gsub(pattern="[[:alpha:]][[:digit:][:punct:]][[:alpha:]]", replacement="", x=words)
# [1] "rep1!ed" "replicated" "funny"      "class33er" 
     # for p1!c use this: [[:alpha:]][[:digit:][:punct:]]+[[:alpha:]]
gsub(pattern="[[:alpha:]][[:digit:][:punct:]]+[[:alpha:]]", replacement="", x=words)
# [1] "re@ted" "replicated" "funny"      "clasr" 
# the "+" sign signifies that the SECOND CHARACTER CLASS may apperar one or more times
# "+" is a META CHARACTER
     
### Regular Expressions
# grep(pattern, x) -  return the INDICES of the elements for which there was a match
# gsub(pattern, replacement, x) - replace all occurrences
# sub() - replaces first occurrence
# regexpr(pattern, text) - returns an integer vector giving the starting position of the first match 
              # or -1 if there is none
# gregexpr(patterns, text) - returns the locations of all occurences of the pattern in each element of the text

subjectLines = c("Re: 90 days", "Fancy rep1!c@ted watches", "It's me")
grep("[[:alpha:]][[:digit:][:punct:]][[:alpha:]]", subjectLines)
# [1] 2 3

newString = gsub("'", "", subjectLines)
grep("[[:alpha:]][[:digit:][:punct:]][[:alpha:]]", newString)
# [1] 2

grep("[[:alpha:]][[:digit:]!@#$%^&*():;?,.][[:alpha:]]", subjectLines)
# [1] 2

# gregexpr()
newString = c("Re: 90 days", "Fancy rep1!c@ted watches", "Its me")
gregexpr("[[:alpha:]][[:digit:][:punct:]][[:alpha:]]", newString)
     # [[1]]
     # [1] -1
     # attr(,"match.length")
     # [1] -1
     # attr(,"useBytes")
     # [1] TRUE
     
     # [[2]]
     # [1] 12
     # attr(,"match.length")
     # [1] 3
     # attr(,"useBytes")
     # [1] TRUE
     
     # [[3]]
     # [1] -1
     # attr(,"match.length")
     # [1] -1
     # attr(,"useBytes")
     # [1] TRUE

### META CHARACTERS:
    # ^ 
          # As the first character in the pattern, anchor for the beginning of the string/line
          # e.g. ^[lg]ame matches “lame” and “game” but not the last four characters in “flame”
          # As the first character in [], exclude these
          # e.g. [^[:alnum:]] matches any single character that’s not a letter or number
    # $
          # End of string/line anchor
          # e.g.^[^[:lower:]]+$ (What does it match?)
     
### ￼Meta characters that control how many times something is repeated
    # ? 
          # Preceding element zero or one time 
          # e.g. ba? matches “b” or “ba”
    # +
          # Preceding element one or more times
          # e.g. ba+ matches “ba”, “baa”, “baaa”, and so on, but not "b"
    # * 
          # Preceding element zero or more times
          # e.g. ba* matches “b”, “ba”, “baa”, and so on. 
          # Note the difference compared to the UNIX wildcard!
    # ￼.
          # Any single character
          # e.g. .* matches any character, any number of times (like * as a UNIX wildcard)
    # [] 
          # Character class
          # e.g. [a-cx-z] matches “a”, “b”, “c”, “x”, “y”, or “z”
    # - 
          # Range within a character class
    # | 
          # Alternation, i.e. one subpattern or another
          # e.g. abc|xyz matches “abc” and “xyz”
    # () 
          # Identify a subpattern
          # e.g. ab(c|x)yz matches “abcyz” and “abxyz”
    # ￼\<
          # Beginning of a word
    # \>
          # End of a word
    # {n} 
          # Preceding item n times
    # {n,}
          # Preceding item n or more times
    # {n,m}
          # Preceding item between n and m times (inclusive)
    
# The position of a character in a pattern determines whether it is treated as a meta character.
# Examples: [-+*/], [1-9]*
# When you want to refer to one of these symbols literally, you need to precede it with a backslash \ 
# However, this already has a special meaning in R’s character strings 
     # it’s used to indicate control characters like newline \n
# So, to refer to these symbols in R’s regular expressions, you need to precede them with 
     # two backslashes \\
# The characters for which you need to do this are:
     # . ^ $ + ? ( ) [ ] { } | \  
    
words <- c("hi mabc", "abc", "abcd", "abccd", "abcabcdx", "cab", "abd", "cad")
grep(pattern="abc", x=words) # [1] 1 2 3 4 5
grep(pattern="^abc", x=words) # [1] 2 3 4 5
grep(pattern="abc.d", x=words) # [1] 4
grep(pattern="abc+d", x=words) # [1] 3 4 5
grep(pattern="abc?d", x=words) # [1] 3 5 7
grep(pattern="abc$", x=words) # [1] 1 2
grep(pattern="abc.*d", x=words) # [1] 3 4 5
grep(pattern="abc?", x=words) # [1] 1 2 3 4 5 6 7
grep(pattern="a[b?d]", x=words) # [1] 1 2 3 4 5 6 7 8
     
words2 <- c("cat", "cats", "at", "t", "carrot", "rat", "nor", "yes")
# take out only words "cat", "at", "t"
grep(pattern="cat|at|t", x=words2) # [1] 1 2 3 4 5 6
grep(pattern="c?a?t", x=words2) # [1] 1 2 3 4 5 6

words3 <- c("cat", "cats", "at", "t", "carrot", "rat", "nor", "yes", "caaaaaat", "caaat", "ct")
# take out words "cat", "caat", "caaaat", and so on
grep(pattern="ca+t", x=words3) # [1] 1 2 9 10

words4 <- c("dog", "Dog", "dOg", "doG", "DOg", "DOG", "dogs", "dgs", "ds", "odo")
# "dog", "Dog", "dOg", "doG", "DOg", etc.
grep(pattern="[d|D][o|O][g|G]", x=words4) # [1] 1 2 3 4 5 6 7

numbers <- c("123", "32.5", "33.3", "1", "acs", "234", "27.9", "100.100", "abc", ".5")
# take out any numbers with or without a decimal point
grep(pattern="[0-9]*[//.|0-9][0-9]*", x=numbers) # [1]  1  2  3  4  6  7  8 10
     
### Greedy Matching
     # For example: when trying to remove HTML tags from a document, 
     # the regular expression <.*> will match too much 
     # BUT the regular expression <[^>]*> will be just right
     
############################################################################################
############################################################################################
############################################################################################          
     
##########################
### Web Scraping
##########################

### WEB LOG ENTRIES
        # 169.237.46.168 -- [26/Jan/2004:10:47:58 -0800]
        # "GET /stat141/Winter04 HTTP/1.1" 301 328
        # "http://anson.ucdavis.edu/courses/"
        # "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.1.4322)"

# readLines() reads each line of text in a file and creates a character vector with one element 
     # per line, then we can use regular expressions to extract the data we want
# scan()
wlist <- strsplit(wl, " \" | -- \\[ | \"")
# strsplit() output will be a list

wlist <- list(c("169.237.46.168",
     "26/Jan/2004:10:47:58 -0800]",
     "GET /stat141/Winter04 HTTP/1.1",
     "301 328",
     "http://anson.ucdavis.edu/courses/",
     "\"Mozilla/4.0 (compa+ble; MSIE 6.0; Windows NT 5.0; .NET CLR 1.1.4322)\""))
wlist
wlist[[1]][3]
# [1] "GET /stat141/Winter04 HTTP/1.1"
sapply(wlist, function(x) gsub(pattern=" .*$", replacement="", x=x[3]))
# [1] "GET"

### FIXED-WIDTH FORMATS
        # read.fwf() - functions are useful if information are always the same width
        # fwf = fixed-width-format
        # the web lg data is close toa fwf
read.fwf(file=fileLoc, widths = c(14,5,2,1,3,1,4,18,3))

### DELIMITED DATA
     # function for reading delimited text files
        # read.table()
        # read.csv()
     # options to include in the above functions:
        # file = name or URL
        # header = are column names at the top of the file?
        # sep = what divides elements of the table
        # na.strings = symbol for missing values, like 9999
        # skip = number of lines at the top of the file to ignore
     
fileLoc <- "http://www-958.ibm.com/software/data/cognos/manyeyes/datasets/olympic2012withgdp/versions/1.txt"
fileLoc
ctry <- read.csv(file=fileLoc, skip = 1, sep = "\t", header = FALSE, 
                 colClasses = c("character", rep("numeric", 5), rep("character", 3)))
head(ctry)
class(ctry$V7) # [1] "character"
head(ctry$V7)
# [1] "2,456,000,000.00"   "20,343,461,030.00"  "100,990,000,000.00" "12,959,563,902.00" 
# [5] "3,491,000,000.00"   "360,245,000,000.00"
fix7 <- as.numeric(gsub(pattern=",", replacement="", x=ctry$V7))
head(fix7)
# [1]   2456000000  20343461030 100990000000  12959563902   3491000000 360245000000
class(fix7) # [1] "numeric"


### Data Available on the Web
      # HTML
          # Table EG: simulation results
          # Plain text Format EG: ManyEyes Data
      # JSON - JavaScript Object Notation
      # XML - eXtensible Markup Language

#############
### HTML
#############

# Scarping Data from a Web Page = to write code to automatically extract data from one or more webpages 
# HTML is like XML - CAN USE XML package
# htmlParse() can create a tree structure from ill-formed HTML
# the information is read as text, need to use regular expressions
# Most browsers allow you to see this file: View -- Page Source

#####################################
### JSON - JavaScript Object Notation
#####################################

# Text format
# Lightweight data-interchange
# Easy for humans to read and write.
# Easy for machines to parse and generate

# JSON is built on two structures:
  #  An unordered collection of comma-separated name: value pairs
      # {“lender_id”:”matt”, “loan_count”:23}
  #  An ordered array of values
      # [1, [true, false, true], [1, 2, 10, 20], {“lender_id”:”skylar”, “loan_count”:1}]

# XML compared with JSON
    # JSON is simpler
    # Not as rich – no attributes, unordered, no schema for describing acceptable format
    # Compressed JSON and XML not much different in size

### EG JSON CODE: KIVA DATA
# {"header":{"total":"576803","page":1,"date":"2010-01-29T20:00:23Z","page_size": 1000},
# "lenders":[ 
#       {"lender_id":"matt",
# "name":"Matt",
# "image":{"id":12829,"template_id"1}, "whereabouts":"San Francisco CA", "country_code":"US",
# "uid":"matt",
# "member_since":"2006-01-01T09:01:01Z", "personal_url":"www.socialedge.org\/blogs\/kiva-chronicles", "occupa+on":"Entrepreneur",
# "loan_because":"I love the stories. ",
# "occupational_info":"I co-founded a startup nonprofit (this one!) and I work with an amazing group of people dreaming up ways to alleviate poverty through personal lending. ",
# "loan_count":89,
# "invitee_count":23}, 
#       {"lender_id":"jessica",
# "name":"Jessica", 
# "image":{"id":197292, "template_id":1}, ...
     
#######################################
### XML - eXtensible Markup Language
#######################################

# Most of the data sets we have seen have been in the form of ASCII tables.
# Advantages:
    # easy to read, write, and process
    # in standard cases, don’t need a lot of extra information
# XML is a standard for semantic, hierarchical representation of data
    # <state>
    # <gml:name abbreviation="AL”> ALABAMA </gml:name>
    # <county>
    # <gml:name> Autauga County </gml:name>
    # <gml:location>
    # <gml:coord>
    # <gml:X> -86641472</gml:X>
    # <gml:Y> 32542207</gml:Y>
    # </gml:coord>
    # </gml:location>
    # </county>

# PROS 
      #  data is self-describing
      #  format separates content from structure 
      #  data can be easily merged and exchanged 
      #  file is human-readable
      #  file is also easily machine-generated
      #  standards are widely adopted

# CONS
      #  XML documents can be very verbose and hard to read
      #  It’s so general that it’s hard to develop tools for all cases
      #  Files can be quite large due to high amount of redundancy

# XML has become quite popular in many scientific fields, and it's standard in many web applications 
# Learn how to CREATE IT and READ/PROCESS it using R
     
### EG XML CODE: KIVA DATA
     # <lender> 
     # <lender_id>matt</lender_id> 
     # <name>Matt</name> <image>
     # <id>12829</id>
     # <template_id>1</template_id>
     # </image>
     # <whereabouts>San Francisco CA</whereabouts> 
     # <country_code>US</country_code>
     # <uid>matt</uid> 
     # <member_since>2006-01-01T09:01:01Z</member_since> 
     # <personal_url>www.socialedge.org/blogs/kiva-chronicles </personal_url>
     # <occupation>Entrepreneur</occupation>
     # <loan_because>I love the stories. </loan_because> 
     # <occupational_info>I co-founded a startup nonprofit (this one!) and I work with an amazing group of people dreaming up ways to alleviate poverty through personal lending. </occupational_info> 
     # <loan_count>89</loan_count> 
     # <invitee_count>23</invitee_count>
     # </lender>

### EG XML CODE: EXCHANGE DATA
     # <Cube>
     # <Cube time="2008-04-21">
     # <Cube currency="USD" rate="1.5898"/>
     # <Cube currency="JPY" rate="164.43"/> 
     # <Cube currency="BGN" rate="1.9558"/> 
     # <Cube currency="CZK" rate="25.091"/>
     # </Cube>
     # <Cube time="2008-04-17">
     # <Cube currency="USD" rate="1.5872"/> 
     # <Cube currency="JPY" rate="162.74"/> 
     # <Cube currency="BGN" rate="1.9558"/> 
     # <Cube currency="CZK" rate="24.975"/>
     # </Cube> 
     # </Cube>

### EG XML CODE: USGS EARTHQUAKE CATALOG DATA
     # <event id="00068404" network-code="ak" time-stamp="2008/09/16_22:17:31 " version="2"> 
     # <param name="year" value="2008"/>
     # <param name="month" value="09"/>
     # <param name="day" value="14"/>
     # <param name="hour" value="00"/>
     # <param name="minute" value="59"/>
     # <param name="second" value="04.0"/>
     # <param name="la+tude" value="51.8106"/> 
     # <param name="longitude" value="-175.9250"/> 
     # <param name="depth" value="146.0"/>
     # <param name="magnitude" value="3.8"/>
     # <param name="num-sta+ons" value="10"/> 
     # <param name="num-phases" value="15"/> 
     # <param name="dist-first-sta+on" value="126.1"/> 
     # <param name="azimuthal-gap" value="53"/> 
     # <param name="magnitude-type" value="L"/> 
     # <param name="magnitude-type-ext" value="Ml = local magnitude (synthe+c Wood-Anderson)"/> 
     # <param name="location-method" value="a"/>
     # <param name="location-method-ext" value="Auryn (Confirmed by human review)"/> 
     # </event>
     # <event>

### EG XML CODE: US Congress DATA
     # <actions>
     # <action datetime="2009-01-26">
     # <text>Referred to the CommiTee on Appropriations, and in addition to the CommiTee on the Budget, for a period to be subsequently determined by the Speaker, in each case for considera+on of such provisions as fall within the jurisdic+on of the commiTee concerned. </text>
     # </action>
     # <action datetime="2009-01-26">
     # <text>Referred to House Appropriations</text> 
     # </action>
     # </actions>
     # .. 
     # <relatedbills>
     # <bill relation="rule" session="111" type="hr" number="88" /> 
     # </relatedbills>
     
### EG KML CODE: Snippet of KML for one earthquake
     # <Placemark id="217">
     # <name>8.2</name>
     # <description> Date: 2008-9-15 Magnitude: 1.5 Depth: 8.2 km </description>
     # <styleUrl>#ball1-2</styleUrl>
     # <Point>
     # <coordinates>-147.426, 60.929, 0</coordinates> 
     # </Point>
     # </Placemark>
    
     
################
### XML SYNTAX
################
     
# The basic unit of XML code is called an “element” or “node” 
     # It is made up of both markup and content. 
     # MARKUP consists of 
                # tags
                # atrributes
                # comments
     # EG: XML SYNTAX
            # <CYL> 6 </CYL> <!-- elem with content 6 -->
                    # <CYL> = START TAG
                    # 6 = CONTENT
                    # </CYL> = END TAG
                    # !-- elem with content 6 -- = COMMENT
            # <CYL> </CYL>
                    # <CYL> </CYL> = ELEMENTS WITH NO CONTENT
            # <CYL type="numeric"/>
                    # <CYL type="numeric"/> = ELEMENTS WITH NO CONTENT
            # <CYL size="2"> 6 </CYL>
                    # size="2" = AN ATTRIBUTE
     
### WELL-FORMED XML
     # Tag names are case-sensitive; start and end tags must match exactly.
     # No spaces are allowed between the < and the tag name.
     # Tag names must begin with a letter and contain only alphanumeric characters.
     # An element must have both an open and closing tag unless it is empty.
     # An empty element that does not have a closing tag must be of the form <tagname/>.
     # Tags must nest properly. (Inner tags must close before outer ones.)
     
### EG WELL FORMED XML:
     # <?xml version="1.0" encoding="ISO-8859-1"?> ### XMLdeclaration and processing instructions
     # <!-- Edited with XML Spy v2006 (http://www.altova.com) -->
     # <CATALOG>
     #      <PLANT>
     #            <COMMON>Bloodroot</COMMON>
     #            <BOTANICAL>Sanguinariacanadensis</BOTANICAL>
     #            <ZONE>4</ZONE>
     #            <LIGHT>MostlyShady</LIGHT>
     #            <PRICE>$2.44</PRICE>
     #            <AVAILABILITY>031599</AVAILABILITY>
     #      </PLANT>
     #      <PLANT>
     #            <COMMON>Columbine</COMMON>
     #            <BOTANICAL>Aquilegiacanadensis</BOTANICAL>
     #            <ZONE>3</ZONE>
     #            <LIGHT>MostlyShady</LIGHT>
     #            <PRICE>$9.37</PRICE>
     #            <AVAILABILITY>030699</AVAILABILITY>
     #      </PLANT>
     #      <PLANT>
     
### WELL FORMED XML ctd.
     # All attributes must appear in quotes in the format:
            # name = “value”
     # Isolated markup characters must be specified via entity references: 
            # < is specified by &lt;
            # > is specified by &gt;
     # All XML documents must contain a root node containing all the other nodes
     
### TREE REPRESENTATION:
     # <Envelope>
     #          <subject>Reference rates</subject> 
     #          <Sender>
     #                <name>European Central Bank</name> 
     #          </Sender>
     #          <Cube>
     #                <Cube time="2008-04-21">
     #                        <Cube currency="USD" rate="1.5898"/> 
     #                        <Cube currency="JPY" rate="164.43"/> 
     #                        <Cube currency="BGN" rate="1.9558"/> 
     #                        <Cube currency="CZK" rate="25.091"/>
     #                </Cube>
     #                <Cube time="2008-04-17">
     #                        <Cube currency="USD" rate="1.5872"/>
     #                        ￼￼￼￼￼￼<Cube currency ..... 
     #                        <Cube currency ..... 
     #                        <Cube currency .....
     #                </Cube> 
     #          </Cube>
     # </Envelope>
     
     
### Tree terminology:
     #  There is ONLY ONE ROOT or document node in the tree, and all the other 
            # nodes are contained within it.
     #  We think of these other nodes as being DESCENDENTS of the root node.
     #  We use the language of a family tree to refer to relationships between nodes. 
            # Parents, children, siblings, ancestors, descendants
     #  The TERMINAL NODES in a tree are also known as LEAF NODES. 
            # Content always falls in a leaf node.     
      
### Note:
     # We’ll learn to create and process XML documents from within R, but always keep in mind 
              # that R and XML are two separate things.
     # In particular, it will be helpful to have in your mind the structure of the XML document 
              # before you do anything in R, especially when you’re creating a new XML document.
     
############################################################################################
############################################################################################
############################################################################################          
     
#######################################
### Midterm Review
#######################################

# GOAL: use computer to conducy and communicate statistical analysis of data
# DATA: highly varried: traffic flows, flight data, traffic fatalitis, data.gov, inage/video/audio, meta-data
# RESEARCH CYCLE: 
      # 1. hypothesis, research question
      # 2. data aquisition
      # 3. data cleaning
      # 4. data organization/combination
      # 5. data analysis
      # 6. simulation
      # 7. reporting and visualization
# USED R: because it's free, open source, widely used, extensive, scripting environment
      # follow mathematical order of operations
      # variables and functions
      # random number generation: rnorm, runif, rexp, rt, rf, rposs
      # variables: numeric, character, logical, integer, factor (use levels)
      # subset: by exclusion, by name, by logical, by location/index; (see also any(), all())
      # logical operators: == equal, != not equal, ! not
      # vectors: c() concatanate, seq() sequence, rep() repeat, : go from here to here, 
          # sort() this sorts, order() gives the indeces does not touch the vector
      # data frame: dim(), class(), $ to full a variable out of the data frame, 
          # attach and detach a data frame
      # lists, matrices, arrays: 
          # list can combine anything together, 
          # matrices are more strict (extra structure), 
          # array is less structures than a matrix
          # array is a super matrix, higher dimensional matrices
          # newarray = array( ...., (2,2,100)) # has 100 matrices that all 2 by 2 
      # read.table(), read.csv(), scan(), load()
      # graphics: vizualization used in 
          # data cleaning (see outliers), 
          # data exploration
          # model checking
          # reporting and communicating results
      # data types: 
          # qualitative
                # ordered (stars for movies on IMDB)
                # not ordered (nominal)
          # quantitative (numerical) both ordered
                # continuous 
                # discrete
      # rug(), plot(), hist(), density() <- concept of bandwidth selection (bias) 
          # how much variation do you want to pick up un the data (smooth)
          # tradeoff between accuracy and accesability
          # overfitting
          # jitter() to add noise in order to increase the accesability
      # barchart(), pie(), dotplot(), stem(), mosaicplot(), boxplot() for quantitative data
      # examine density plot for distribution, mode, median, symetry, skewness, long tails, gaps, outliers
      # adjust plot details: pch, cex, main, xlab, ylab
      # fundamentally subjective: 
          # parsemoniuos (nothing that is extra, keep it clean), 
          # clear message,
          # informatioon rich
          # comparisons: 
              # same scale
              # use of color (light or bright color)
              # Brewer color palette:
                    # diverging palettes
                    # sequential palettes
                    # qualitative palettes
      # using packages in R:   
      # time series data: 
          # appropriate baselines, 
          # smoothing
      # apply functions:
          # apply() for matrices
          # sapply() - returns a vector (for lists and data frames)
          # lapply() - returns a list (for lists and data frames)
          # taaply() for tables, and ragged arrays
      # looping (instead of apply): evaluate a function on dimenstions of the data
      # orphan functions: (do not have names), used in apply calls
      # functions: in addtition to creating scripts
          # name = function(input) { commands }
          # input can have defaults (input1=TRUE)
          # in comands: 
                  # error handeling, 
                  # messages to the user,
                  # return statement
                  # usefull to have comments/documentation about thefunction: inputs, outputs
      # flow control:
          # if(condition) { commands } else if(condition) { commands } else { commands }
          # ifelse(test, if true do this, if false do this)
          # | means or 
          # & means and
      # for loops:
          # for(var in vector) EG: for(i in 1:10)
      # while(condition) { commands }
      # sample()
      # SIMULATION: "mimic" or model real world behavior with ONLY one sample
          # IMPORTANT: we know the underlying distribution
          # distribution -----sampling mechanism-----> observed data
          # observed data ------inference------> distribution
          # simulation allows us to fake the sampling mechanism
          # parameters that we do not know, so we use the estimatesrs from the sample 
          # sampling distribution
      # Monte Carlo methods:  
          # IMPORTANT: we do NOT know the underlying distribution
          # for the underlying distribution we will have parametehrs, sample size ----simulation----> statistic
          # the process above gets repeated B times
      # SIMULATION STEPS: 
            # 1. specify your single experiment
            # 2. implement as function
            # 3. decide what inputs vary
            # 4. set.seed() in order to replicate
            # 5. repeat B times for each input combination
            # 6. summarize empirical distribution that results
            # 7. plot/state results (go back to step 3, to vary sothing else)
      # pseudo random number generation: congruential nrandom number generation, set.seed()
      # text parsing:
          # combine data sets from same or different sources
          # text keys
          # subset by text keys (by name)
          # weblogs, email
      # substring(), nchar(), strigsplit(), paste(), 
      # tolower(), toupper() for change case
      # sub() for the first one, gsub() for all
      # Regular Expressions: 
          # 1. literal
          # 2. character class [  ], [:equivalence class:] [:digits:]
          # 3. modifiers (includes metacharacters, wild cards)
          # EG: rep1ic@ted
                # grep(), regexp(), gregexp() <- regular expressions input
                # regexp() return index location
                # gregexp() returns ALL index locations
      # Data representation for machines:
          # XML, JSON, HTML
          # XML package

######################
### NOTES FROM THE WEB:
######################
  # A matrix can only store one type of data, while a data frame can manage multiple types.
  # A matrix and a data frame are subscripted exactly the same. 
  # A vector is conceptually a one-dimensional object while matrices and data frames are two-dimensional. 
  # So you need two subscripts for matrices and data frames. 
  # The rows and the columns are subscripted independently of each other, with a comma separating the subscripts.
  # Matrices are actually a special case of arrays — a matrix is a two dimensional array. 
  # An array can have any dimension (that fits on the machine).
  # A matrix is a two-dimensional data structure. All the elements of a matrix must be of the same type (numeric, logical, character, complex).
  # A data frame combines features of matrices and lists. 
  # In fact we can think of a data frame as a rectangular list, that is, a list in which all items have the length length. 
  # The items of the list serve as the columns of the data frame, so every item within a particular column has to be of the samne type. 
  # However, different columns can be of different types.
  # The names of the list are the column headers: every data frame must have column names. (In contrast, a matrix doesn't have to have names.) 
  # A data frame must also have row names, although often, as here, they're just ascending integers.
  # Vectors are the simplest R objects, an ordered list of primitive R objects of a given type (e.g. real numbers, strings, logicals). 
  # Vectors are indexed by integers starting at 1. 
  # Factors are similar to vectors but where each element is categorical, i.e. one of a fixed number of possibilities (or levels). 
  # A matrix is like a vector but with a specific instruction for the layout such that it looks like a matrix, i.e. the elements are indexed by two integers, each starting at 1. 
  # Arrays are similar to matrices but can have more than 2 dimensions. 
  # A list is similar to a vector, but the elements need not all be of the same type. 
  # The elements of a list can be indexed either by integers or by named strings, i.e. an R list can be used to implement what is known in other languages as an "associative array", "hash table", "map" or "dictionary". 
  # A dataframe is like a matrix but does not assume that all columns have the same type. 
  # A dataframe is a list of variables/vectors of the same length. 
  # Classes define how objects of a certain type look like. 
  # Classes are attached to object as an attribute. 
  # All R objects have a class, a type and a dimension.

############################################################################################
############################################################################################
############################################################################################          
     
####################
### INTRO TO UNIX OS
####################

### OS for mainframes
    # central CPU/disks
    # multiple users

# UNIX was not developed open source (developed at AT&T)
# now is open source (rewritten at Berkley)
# Berkeley distribution of UNIX
# UNIX -> Berkekey distribution (BSD) -> Linux -> Mac OS

### UNIX     
    # command line operating system
    # accessing UNIX at columbia
          # MAC:
                # utilities -> terminal
                # linuxpromt$ ssh # this means first s means secure, sh means shell
                # kernel is in the back, and we use the shell to interact with the kernel
                # ssh rd2545@cunix.cc.columbia.edu
                # this will prompt a question, answer yes
                # after will ask for your columbia password
                # this will change from the linuxprompt$ to just $ (or columbia$)
                # ssh allows us to open a shell because the commands will be issued on the Columbia UNIX 
                        # because there is more space, faster, backed up info, more powerful
                        # we need a network conection in order to connect to the unix mainframe
                # exit  # command that takes you back to your local shell (on your computer)
          # Windows:
                # download putty ssh (select putty.exe)

### UNIX Commands
     # ls      # contents of the directory (list)
     # ls -a   # list files that are normally hidden
     # ls -l   # prompts a long list
        # drwxr-sr-x
            # d=directory
            # r=write
            # w=write
            # x=execute
            # rwxr for me, sr for group, x for public
            # 4096 is the size of how much space to can take up
      # touch name_file.txt     # creates file
      # cd public_html/         # change directory
      # ls -l                   # long list
      # ls -la                  # all list
      # ls -a                   # shows hidden files (.cshrc)
            # if you a one dot .      # means "right here"
            # if you see two dots ..  # means "up one directory"
      # cd .                    # current directory
      # cd ..                   # parent directory
      # pwd                     # print working directory
      # less file_name          # to see the content of a file
      # cd ~                    # go back to the home directory
      # rm name_file.txt        # remove file
      # ls
      # ls ~                    # list out whats in my home directory
      # mkdir DataMining        # make directory
      # rmdir DataMining        # remove directory
      # pwd                     # shows the path where you are located
      # chmod _ _ _  (put 3 numbers)             # change mod
      # chmod 700 file_name       
          # first number is me, second is group, third is public
          # 7 means read write execute
          # 5 write and execute
          # 0 no permission
     # chmod u+r file_name   # give users reading permission
          # u for user
          # g for group
          # o for other
          # a for all
          # r for read
          # w for write
          # x for execute
          # + to add permission
      # w         # users conected
      # who       # users conected
      # R         # use R in unix

### Everything in UNIX (Kernel and Shell):
     # has two things:
          # processes (pid - process ID)
          # files
     # R    # prompted R
     # R &  # means command runs in the background
     # q()  # to quit a program (this case R)
     # kill %1   # to kill command with ID 1 that is in your shell
     # top       # to see what is going in the system
     # kill -9 10387  # here 10387 is the process ID
     # cp    # COPY
          # cp ../file.txt .  
                # means that you take the file from the above folder and copy in this folder
          # cp /DataMining/Files/HM/test.txt .   
                # means that you move tst.txt from that directory into the directory where you are located now  
     # mv    # MOVE
     # rm    # REMOVE
     # rmdir # REMOVE DIRECTORY
     # man   # stands for MANUAL
          # man ls     # manual for function ls
     ######################################################################
     # clear             # clear your window before you start a new session
     # cat science.txt   # prints out the text of the file in the terminal
     # less science.txt  # print on the screen
     # head science.txt  # prints the first ten lines of the  file
     # tail science.txt  # prints the last ten lines of the file
     # grep science science.txt  # prints the lines from science.txt that contain the word "science"
     # grep -i science science.txt # do not distinguish between upper and lower case
                # -i = ignore upper/lower case distinctions
                # -v = display the lines that do not match
                # -n = precede each matching line with the line number
                # -c = print only the total count of matched lines
                # EG: grep -ivc science science.txt # can use more than one at a time
     # wc -w science.txt   # word count
     # wc -l science.txt   # how many lines are in the text
# Write into files
     # cat > list1  # creates a new file "list1" and we need to add text to it
                    # type in names of fruits and hit RETURN after each one
                    # at the end press CONTROL D to stop
     # cat list1    # to look at the created list
     # cat >> list1 # adds text to an existing file
                    # type in MORE names of fruits and hit RETURN after each one
                    # at the end press CONTROL D to stop
     # cat list1 list2 > biglist  # combines two lists into one
     # to exit from typing inside file use : CONTROL D
# Sort 
     # sort < list1 
     # sort < list1 > list1_sorted # sorts list one and writes it out to list1_sorted
# Pipes
     # who           # who is on the system 
     # who | wc -l   # how many people are on the same machine with you
     # who | sort    # sorted list of the people that are on the same machine as me
# Wildcards
     # ls list*      # all files that start with list and I do not care what they end with
     # ls *list      # * means any number of characters
     # ls list?      # ? means only one character
# Man pages:
     # man wc        # manual page for word count
     # whatis wc     # a one-line description of the command
     # apropos keyword   # if you dont know the exact name
                         # gives you the commands with "keyword" in the manula page header
     
### File Transfer
     # MAC:
          # cd       # go to the directory where the file is
          # linux$ scp  file_name.R rd2545@cunix.cc.columbia.edu:
                  # s stands for secured, cp stands for copy
                  # need to put : in order to move there
                  # if you do not put : it will just rename it
          # linux$ scp rd2545@cunix.cc.columbia.edu:~/name_file.txt
     
### Standard INPUT = keyboard 
### Standard OUTPUT = screen (stuff that comes out to the screen)
### Standard ERROR = eror message
   
### Different types of shells:
     # bash is the one that comes up
     # tcsh we can put in the command line (type exit to leave it)
     # sh is another shell (type exit to leave it)
     
### Text Editor: PICO
     # pico firstscript.sh
     # write out #!/bin/sh
     # echo "Hello world"
     # mkdir bin
     # mv firstscript.sh ~/bin
     # cd bin
     # ls
     # ls -l
     # chmod 755 firstscript.sh    # to make the script executable
          # I am read write execute
          # group is read write
          # all is read write
     # ls -l
     # ./firstscript.sh     # to run the script
     # name of variable added to the script
     # name = "fred"
     # echo "The name is $name"
     
### Commands to use in the UNIX to manipulate standard output
     # grep
     # sed
          # one two three, one two three
          # sed 's/one/ONE/' <oldfile>newfile
                  # s = substitute
                  # / = delimiter
                  # one = pattern
                  # ONE = replacement
          # ONE two three, one two three    ### changes only the first occurance
     # awk
          # pattern { action }
          # EG: script in shell using awk
                # #!/bin/sh
                # Linux users have to change $8 to $9 
                # awk '
                # BEGIN { print "File\tOwner" } 
                # { print $8, "\t", $3}  
                # END { print " - DONE -" } 
                # '
     
     
############################################################################################
############################################################################################
############################################################################################          
     
##################################
### Representation of Information
##################################
     
# ssh rd2545@cunix.cc.columbia.edu
# ls -l

### COLORS (RGB)
      # red is #FF0000
      # yellow is #FFFF00
      # blue is #6495ED
      # pink is #E41A1C99
     
### REPRESENTATION OF DATA
     
#                            TXT                          HTML                        XLSX
# BROWSER         Render without no markup     Format according to markup      Open file in Excel
# EXCEL           Display as excel             Display as Excel                Display
# TEXT EDITOR     Display ASCII characters     See markup as well as content   See jibberish
     
     
# HTML = HyperText Markup Language
# Tree Data Structure
  # html   
     # head
     # body
          # h1
              # BML Report
          # h2
              # Introduction
          # p
              # Research by
              # a
                  # D'Souza
              # shows that
              # img

### Tree Hierarchy
     #  One root node
     #  Root node has child nodes and each of these can have child nodes and so on
     #  Any node must have one and only one parent
     
### EG: TABLE
     # <table cellpadding="6" border="2"> 
     # <tr>
     # <th>A</th> <th>B</th>
     # </tr>
     # <tr align="right">
     # <td>1</td> <td>25,000</td>
     # </tr>
     # <tr align="right">
     # <td>7</td> <td>100,000</td>
     # </tr>
     # </table>
     
#   A     B
#   1    25,000
#   7   100,000
     
# An HTML Table
     #  Tables are defined with the <table> tag
     #  A table has rows marked up with the <tr> tag
     #  Each row is divided into data cells with the <td> tag (td stands for table data)
     #  A data cell can contain text, images, lists, paragraphs, forms, horizontal rules, tables
     #  Headings in a table are defined with the <th> tag
     
### EG: unordered lists have items marked with bullets
     # <ul>
     # <li>Coffee</li>
     # <li>Milk</li>
     # </ul>
     
### EG: ordered lists have items maked with numbers
     # <ol>
     # <li>Coffee</li>
     # <li>Milk</li>
     # </ol>     
     
### EG: paragraph
     # <h1>My BML Report</h1>
     # <h2>Introduction</h2>
     # <p>The BML model is a simple traffic model...</p>
     # <p>We studied the BML model behavior for...</p>
     
### EG: images
     # <img src = "images/bml34.png" width ="400"/>
              # this tag is empty the start and end of the tag are collapsed
     
### EG: links
     # <a href = "http://mae.ucdavis.edu/dsouza/">D'Souzza</a> discovered ....
     # creates a hyperlink for the D'Souzza name
     # <a> is a anchor tag
     # the content is the text that is "clickable"
     # the link can be to another place within the document
  
### How to create our columbia page
### www.columbia.edu/~vcs2115 # in order to get files
### pico index.html   # here we can create our web page
    
  # How to create a title   
     # <h1>This is a title</h1>
            # <h1> =  start tag
            # This is a title = text content
            # </h1> = end tag
  # <br/> =  this is empty tag, means LINE BREAK
  # Complex content includes other elements.
     # <p>This paragraph includes <a href=“http:// ...”>a link</a> and sentences.</p>
     # <p> has 3 child elements:
              # the text before <a>
              # the <a> node
              # the text after the <a> node
     
### Attribute Syntax
     # Attributes provide additional information to an HTML element
     # Attributes always come in name/value pairs like this: name="value"
     # Attributes are always specified in the start tag of an HTML element
     
### Well-formed HTML is called XHTML
     # strict rules for matching case
     # attributes must be in quotes
     # elements must be properly nested
     
### Raw HTML:
     # <html> 
     # <head></head> 
     # <body>
     # <h1>BML Model Simula)on Study</h1> 
     # <h2>Introduction</h2>
     # <p>The BML model is a simple traffic model...</p> 
     # <h2>Earlier Findings</h2>
     # <p><a href="hip://mae.ucdavis.edu/dsouza/">D'Souzza</a> discovered .... </p>
     # <p>A total traffic jam might look like this<img src="images/bml34.png" width ="200"/> </p>
     # </body> 
     # </html>
     
### Pretty Raw HTML: Cascading Style Sheets
     # <html> 
     # <head>
     # <link rel="stylesheet" type="text/css" href="bmlStyle.css" />
     # </head> 
     # <body>
     # <h1>BML Model Simulation Study</h1> 
     # <h2>Introduction</h2>
     # <p> The BML model is a simple traffic model... </p> 
     # <h2 class="bml”>Earlier Findings</h2>
     # <p><a href="hip://mae.ucdavis.edu/dsouza/">D'Souzza</a> discovered .... </p>
     # <p>A total traffic jam might look like this<img src="images/bml34.png" width ="200"/> </p>
     # </body> 
     # </html>
     
### Cascading Style Sheet:
     # body
     # { background-color:#d0e4fe; }
     # h1
     # { color:orange; text-align:center; }
     # h2.bml
     # { color:green; text-align:center; }
     # p
     # { font-family:"Times New Roman”; font-size:20px; }
     
############################################################################################
############################################################################################
############################################################################################          
     
##################################
### Word Vectors
### Text Mining
##################################    
     
### Bag of Words = unique words across all documents
     
### Similarity between documents
     #  Term frequency: fraction of the words in a document are this term
     #  Document frequency: fraction of the documents contain this term
     #  Normalized vector:
              # V = term freq * inverse document freq     
     
### Distance between documents 
     #  Dist(V, W) = 1⁄2( KL(V, AVG) + KL(W, AVG))
     #  where: KL stands for Kulback-Leibler measure 
             # KL(V, AVG) = sum( log(V/AVG) * AVG )
             # V = TF * IDF
     
### Multi-dimenssional scaling
   # Information visualization technique for high-dimensional data
   # Consider the matrix of dissimilarities above for the four documents
   # Assign locations in 2 dimensions so that the distances between documents is roughly preserved
   # Doesn’t produce unique representations of the data
   # Does give you the opportunity to compare objects (documents in our case)
   # Look for clusters and gaps
   # Exists in high dimensional scape
   # Do we have a lower dimensional representation that conveys same information
            # distances roughly perserved
 
### How to do the 3D to 2D transition
     # Hierarchical Clustering
            # Build binary tree that successivelly merges similar groups
            # This implies that we need a metric or measure of similarity between groups of points
            # There are various algorithms that can be used to create the binary tree
     # Agglomerative Clustering
            # 1. Start with each point in its own group. 
            # 2. Merge the two most similar groups.
            # 3. Repeat step 2 until all groups have been merged into one
            # NOTE that the similarity between two groups being merged at any stage must, 
                 # by design, be decreasing because we merge less and less similar groups
     
### Measure of similarity between groups
     # Single linkage: 
          # smallest distance between any point in one group and a point in the other group
          # tends to result in chaining, where you successively add on one point to a group
     # Complete linkage: 
          # largest distance between any point in one group and a point in the other group
          # tends not to merge close groups when one point in one group is far from the other group
     # Average linkage: 
          # average distance between each point in one group and every point in the other group     
     
### Dendrogram
     # Useful visualization of the clustering process
     # Typically the tree is drawn such that the heights of the branches proportional 
              # to the dissimilarity between the two groups
     # This visual helps you see where a good place to “cut” the tree might be and create clusters
     # Different definitions of similarity can give very different trees
     # The algorithm imposes a hierarchy on a set of data, even if there isn’t one
     
     
############################################################################################
############################################################################################
############################################################################################          
     
#####################################
### XML - eXtensible Markup Language
#####################################      
     
### XML package in R:     
     # readHTMLTable: reads an HTML table into R
     # xmlParse: read an XML file into R
     # xmlValue: retrieve text content of a node
     # xmlSize: return the number of child nodes of a node
     # xmlSApply: applies the function to each child node of a node
     # SAX (Simple API for XML)
            # It reads the document incrementally and is more memory efficient, 
            # but it is trickier to use
     
     # To read an XML file into R - use xmlParse  
     doc = xmlParse("plant.xml")
     # Extract the root node using xmlRoot
     catalog = xmlRoot(doc)
     class(catalog)
     # [1] "XMLNode"   
     
# xmlParse implements what is called the DOM (Document Object Model) parser: 
     # It reads the entire file into memory
# another parsing model called SAX (Simple API for XML):
     # It reads the document incrementally and is more memory efficient, but it is trickier to use
# The tree structure is represented in R as a list of lists.
# We can access an element within a node (i.e., a child), using the usual [[ ]] indexing for lists
     
### Look at the first plant node
     oneplant = catalog[[1]]
     class(oneplant)
     # [1] "XMLNode"
     print(oneplant)
     # <PLANT>
     #  <COMMON>Bloodroot</COMMON>
     #  <BOTANICAL>Sanguinaria canadensis</BOTANICAL>
     #  <ZONE>4</ZONE>
     #  <LIGHT>Mostly Shady</LIGHT>
     #  <PRICE>$2.44</PRICE>
     #  <AVAILABILITY>031599</AVAILABILITY>
     # </PLANT>
     oneplant[['COMMON']] # drill down further into the list
     # <COMMON>Bloodroot</COMMON> 
        # Note that this doesn’t remove the markup. 
        # To do this, use the function xmlValue 
     xmlValue(oneplant[['COMMON']])
     # [1] "Bloodroot"
     xmlValue(oneplant[['BOTANICAL']])
     # [1] "Sanguinaria canadensis"
     
     # xmlApply returns a list   (just like lapply)
     # xmlSApply returns a simpler data structure if possible
     
     common = xmlSApply( catalog, function(x){ xmlValue(x[['COMMON']]) } )
     head(common)
     #     PLANT            PLANT                PLANT
     # "Bloodroot"￼￼      "Columbine"        "Marsh Marigold"
     #     PLANT             PLANT               PLANT
     #   "Cowslip"   "Dutchman's-Breeches"    "Ginger, Wild"
     
     # use xmlSApply to extract the common names of all the plants
     common = xmlSApply(catalog, function(x) { xmlValue(x[['COMMON']]) } )
     head(common)
     # PLANT                  PLANT             PLANT
     # "Bloodroot"￼￼         "Columbine   "  "Marsh Marigold"
     # PLANT                  PLANT               PLANT
     # "Cowslip"      "Dutchman's-Breeches"    "Ginger, Wild"
     
     # we can create a full data frame with all variables
     getvar = function(x, var) xmlValue(x[[var]])
     varNames = names(catalog[[1]])
     res = lapply(varNames, function(var) { xmlSApply(catalog,getvar,var) } )
     plants = data.frame(res)
     
##################################
### XPath
##################################      
     
### What is XPath ?
     # Extractoon tool designed for locating content in an XML file
     # Uses the hierarchy of a well-formed XML document to specify the desired chunks to extract
     # Syntax is similar to but more powerful than the way files are located in a hierarchy of 
                   # directories in a computer file system
     
     # <PLANT>
     # <COMMON>Bloodroot</COMMON>
     # <BOTANICAL>Sanguinaria canadensis</BOTANICAL>
     # <ZONE>4</ZONE>
     # <LIGHT>Mostly Shady</LIGHT>
     # <PRICE>$2.44</PRICE>
     # <AVAILABILITY>031599</AVAILABILITY>
     # </PLANT>
     
     common = xpathSApply(catalog, "/CATALOG/PLANT/COMMON", xmlValue)
     head(common)
     # [1] "Bloodroot” "Columbine”           "Marsh Marigold"   
     # [4] "Cowslip"   "Dutchman's-Breeches” "Ginger, Wild"
     
     xpx = paste("/CATALOG/PLANT/", varNames, sep="")
     xpx[1]
     # [1] "/CATALOG/PLANT/COMMON"
     res = sapply(xpx,function(var) xpathSApply(catalog, var, xmlValue))
     res[1:2, 1:3]
     # [1,] "Bloodroot" "Sanguinaria canadensis" "4"
     # [2,] "Columbine" "Aquilegia canadensis"   "3" 
     
### DRAW DOCUMENT TREE:
     # <Envelope>
     # <subject>Reference rates</subject>
     # <Sender>
     # <name>European Central Bank</name>
     # </Sender> 
     # <Cube>
     # <Cube time="2008-04-21">
     #    <Cube currency="USD" rate="1.5898"/> 
     #    <Cube currency="JPY" rate="164.43"/> 
     #    <Cube currency="BGN" rate="1.9558"/> 
     #    <Cube currency="CZK" rate="25.091"/>
     # </Cube>
     # <Cube time="2008-04-17">
     #    <Cube currency="USD" rate="1.5872"/> 
     #    <Cube currency="JPY" rate="162.74"/> 
     #    <Cube currency="BGN" rate="1.9558"/> 
     #    <Cube currency="CZK" rate="24.975"/>
     # </Cube> 
     # </Cube>
     # </Envelope>  
  
### /Envelope/Sender/name
     # 1. The first location step identifies the root node, <Envelope>
     # 2. The next location step finds the <Sender> child of <Envelope>
     # 3. The third location step identifies <Sender>'s child called <name>
     
### /Envelope/Cube/Cube
     # This XPath expression locates two sibling <Cube> nodes
     
###  //Cube[@currency = "JPY"]
        # The expression: //Cube matches all Cube nodes found anywhere in the document
        # The predicate [@currency="JPY"] filters the matches to those elements with a 
                  # currency arribute value of “JPY”
     
### EG: ISO Country Abbreviations
     # <ISO_3166-1_List_en xml:lang="en"> 
     # <ISO_3166-1_Entry>
     # <ISO_3166-1_Country_name>AFGHANISTAN </ISO_3166-1_Country_name> 
     # <ISO_3166-1_Alpha-2_Code_element>AF </ISO_3166-1_Alpha-2_Code_element>
     # </ISO_3166-1_Entry> 
     # <ISO_3166-1_Entry>
     # <ISO_3166-1_Country_name>ALBANIA </ISO_3166-1_Country_name> 
     # <ISO_3166-1_Alpha-2_Code_element>AL </ISO_3166-1_Alpha-2_Code_element>
     # </ISO_3166-1_Entry>
     doc = xmlParse("ISO.xml")
     ISO_doc = xmlRoot(doc)
     country_name = xpathSApply(ISO_doc, 
          "/ISO_3166-1_List_en/ISO_3166-1_Entry/ISO_3166-1_Country_name", xmlValue)
     
### EG: World Health Factbook
     # <factbook>
     #   ....
     # <field dollars="false” unit="(deaths/1,000 live births)" rankorder="1” name="Infant mortality rate" id="f2091"> 
     # <descrip8on> This entry ... number of deaths of infants under one year old in a given year per 1,000 live births.. </descrip8on>
     # <rank number="121.63" dateEs8mated="true" dateLatest="2012-12-31” dateEarliest="2012-01-01" dateText="2012 est." country="af"/> 
     # <rank number="109.98" dateEs8mated="true" dateLatest="2012-12-31” dateEarliest="2012-01-01" dateText="2012 est." country="ng"/>
     # ... 
     # </field>
     
     
### XPath syntax
     #  XPath is a language for locating content in XML documents
     #  An XPath expression is a location path that is made up of location steps separated by /
     #  Each step has three parts: 
                # the axis
                # nodetest
                # predicate
     #  Syntax: axis::nodetest[predicate] 
                #  The axis is the direction to look
                #  The nodetest is typically a node name that you wish to locate
                #  The optional predicate filters the qualifying nodes.
     # We will use only very simple Xpath expressions
     # The axis will be either
                #  “child”, which is the default and can be dropped
                #  “descendant-or-self”, which says look anywhere down the
                              # tree and is abbreviated by “//”
                #  “self” which is abbreviated with a . (period)
     #  The nodetest will always be a node name
     #  The predicate is optional and will either be a number
                # [2] which asks for the second node
                # or an attribute filter
                            # [@currency = “JPY” or @currency=“USD”] 
     
### Functions that take XPath expressions
     # getNodeSet(xmlTree, xpathExpression) 
              # returns a list of XML nodes from xmlTree
              # that satisfy the XPath expression
     # xpathSApply(xmlTree, xpath, function) 
              # the function is applied to those nodes 
              # in the XML tree that satisfy the Xpath expression. 
              # The return value is a vector when possible 
              # xpathApply returns a list     
     
### CIA Factbooks
  # This page contains the average latitude and longitude for countries around the world.
  # Source: CIA World Factbook
     # "iso 3166 country","latitude","longitude" 
     # AD,42.5000,1.5000
     # AE,24.0000,54.0000
     # AF,33.0000,65.0000 
     # AG,17.0500,-61.8000 
     # AI,18.2500,-63.1667
     # AL,41.0000,20.0000 
     # AM,40.0000,45.0000 
     # AN,12.2500,-68.7500 
     # AO,-12.5000,18.5000 
     # AP,35.0000,105.0000 
     # AQ,-90.0000,0.0000 
     # AR,-34.0000,-64.0000 
     # AS,-14.3333,-170.0000 
     # AT,47.3333,13.3333 
     # AU,-27.0000,133.0000
     
     # create a KML document that can be read in Google Earth
     # KML is a file format for geographic data, based on XML standards
     # Basically is an XML with geographical data
     # http://code.google.com/apis/kml/documentation/
     
### Sources
     #  Country population: CIA World Factbook
     #  Country infant mortality: CIA World Factbook
     #  Country location: plain text file
     #  Country name abbreviation map: ISO map
     #  Merge into one data frame
     #  Make a plot on Google Earth where circle size is proportional to country population, 
              # color is categorized by infant mortality, centers correspond to country 
              # latitude and longitude
     
### Handy functions for creating XML 
     # newXMLDoc: create a new XML document 
     # newXMLNode: create a new XML Node 
     # saveXML: save the XML tree in a text file
     # parseXMLAndAdd: parses character string of XML into an XML node and 
           # adds it to XMLInternalDocument (i.e. a tree) 
     
### EG:
     require(XML)
     doc = newXMLDoc()
     root = newXMLNode("toplevel", doc = doc)
     child1 = newXMLNode("level1", parent = root)
     newXMLNode("level2", "This is the content", parent = child1)
     doc
     # <?xml version="1.0"?>
     # <toplevel>
     #   <level1>
     #      <level2>This is the content</level2>
     #   </level1>
     # </toplevel>
     saveXML(doc, file = "simple.xml")
     
     
### Exercise: 
  # First diagram the tree structure of this document, then create it from within R.
     # <?xml version="1.0"?>
     # <kml>
     #    <Document>
     #        <name>Earthquakes</name>
     #        <description>6+ Earthquakes, 1968-2008</description>
     #        <Folder>
     #            <name>Quakes</name>
     #            <Placemark>
     #            <Point>
     #                <coordinates>-124.95,41.04,0  </coordinates>
     #            </Point>
     #            </Placemark>
     #            <Placemark>
     #            <Point>
     #                <coordinates>-118.83,37.59,0  </coordinates>
     #            </Point>
     #            </Placemark>
     #            ... more Placemark nodes
     #        </Folder>
     #    </Document>
     # </kml>  
     
     
############################################################################################
############################################################################################
############################################################################################          
     
##################################
### SQL
##################################      
     
### Programming Languages we have seen so far
     # R – uses control flow to describe a computation
     # shell commands – command line interface to the operating system
     # regular expressions – describes a pattern but not how to find it
     # HTML – describes what should appear on a Web page but not how to render it
     # Xpath – describes the location of content
     
### Two types of programming:
     # Declarative programming: 
            # describes a result
            # expresses what the program should do without specifying how to do it
            # Regular Expressions, HTML, XPath, SQL
     # Imperative programming: 
            # describe the algorithm/steps of a computation 
            # uses control flow, e.g., looping, assignment, conditional statements
            # R, SHELL
     
     
### Relational Databases and SQL
     # ￼A database is a collection of data with information about how the data are organized (meta-data)
     # A database server is like a web server, but responds to requests for data rather than web pages
     # We’ll talk about relational database management systems (RDBMS) and how to communicate with 
                # them using the Structured Query Language (SQL).
     
### Why use a database?
     #  Coordinate synchronized access to data
     #  Change continually; give immediate access to live data 
     #  Centralize data for backups
     #  Control access to the data
     
### ￼A RDBMS had three main parts
     #  Data definition
     #  Data access
     #  Privilege management
     
### We’ll concentrate on data access, assuming the database is already available 
         # and we have the needed privileges.
     
### Topics:
     #  using SQL to extract info from RDBMSs 
     #  relating these back to similar tasks in R 
     #  using SQL from within R
     
### There are tradeoffs in terms of what we choose to do using SQL and what we do in R.
     #  A data base is made up of one or more two dimensional tables, 
                 # usually stored as files on the server
     #  An important concept in the design of a data base is normalization. 
                # The idea is to remove as much redundancy as possible when creating the tables. 
                # This is done by breaking the full dataset into separate tables.
     #  The “relational” in RDBMS comes from the fact that we then need to link the tables together
    
###  For now let’s talk about a single table....
     #  A table is a rectangular arrangement of values, where a row represents a case, 
                # and a column represents a variable (just like a data frame in R).
     #  Another term for a table is a relation. 
                # The rows are referred to as tuples 
                # The columns as attributes
     #  An entity is the general object of interest. 
              # For example, a lab test:
                      # Each row (tuple) is a particular occurrence of the entity. 
                      # This means that rows in the table are unique.
     #  To identify each row, we use a key. 
              # A key is just an attribute or a combination of attributes that 
                      # uniquely identifies the cases.
     #  In the lab test example, we need a composite key of both patient ID and date, 
              # since neither is necessarily unique.
     #  In R, the row names of a data frame play a similar role.
     #  SQL allows us to interactively query the database to reduce the data 
              # by subseting, grouping, or aggregation.
     #  Each database program tends to have its own version of SQL, 
              # but they all support the same basic SQL statements. 
              # (We say statements rather than commands because SQL is referred to as a 
                       # declarative rather than an imperative language)
     #  The SQL statement for retrieving data is the SELECT statement. 
              # This operates on one or more tables. 
              # The result will always be another table.
     
### EG: ￼We have a table called chips, with data about the CPU development of PCs over time
     # The simplest possible query gives back everything:
       SELECT * FROM chips;
     #   processor  | date | transistors | microns | clockspeed | width | mips
     #  ------------+------+-------------+---------+------------+-------+------
     #   8080       |1974  |        6000 |        6|        2   |     8 |  0.64
     # .................. missing output.......................................

     # By convention, we display SQL statements in upper case. 
     # Statements are ended by a semicolon.
     
### ￼Attributes / Variables
     #  Recall that in R, we can select particular variables (columns) by name.
     chips[ , c(‘mips’, ‘microns’)]
     #  The order of the variable names determines the order in which they’ll be returned 
              # in the resulting data frame.
     #  The corresponding SQL query is:
     SELECT mips, microns FROM chips;
     
### ￼SQL Syntax
     #  Similar to a sentence in English, except that there’s less flexibility in the order of the words
     #  Sentence ends with a ;
     #  Use blanks and “,” and “=“ and () as delimiters
     #  We will only look at SELECT statements, which begin with the term SELECT
     
### ￼Examples of SELECT statements
       SELECT * FROM chips;
      
       SELECT mips, microns FROM chips;
       
       SELECT * FROM chips 
          WHERE processor = ‘Pentium’ OR processor = ‘PentiumII’;
     
### ￼Selecting Tuple/Row
     # In R we can select rows that match a condition:
     chips[chips$processor == ‘Pentium’ |! chips$processor == ‘PentiumII’,]
     #  The corresponding SQL statement is:
     SELECT * FROM chips 
       WHERE processor = ‘Pentium’ OR processor = ‘PentiumII’;
     
### Note: Whitespace can be used freely in SQL statements. 
     # We often separate lines for clarity. 
     # The statement isn’t evaluated until the semicolon is entered.
     
# Aside: In R, it usually doesn’t matter whether you use single or double quotes to surround 
     # character strings. In SQL, the standard is to use single quotes, so we will do this 
     # throughout the notes for both R and SQL.

# The WHERE clause can also be used with other Boolean operators. 
     # The keyword NOT negates a condition
     # Parentheses can be used to clarify order of evaluation
     SELECT * FROM chips WHERE date > 1990;
       
     SELECT * FROM chips WHERE NOT width = 8;
       
     SELECT * FROM chips WHERE NOT (width = 8 OR width = 16);
     
### In both R and SQL, we can do both types of subseting at once.
     # R:
       chips[chips$processor == ‘Pentium’ | chips$processor == ‘PentiumII’, c(‘mips’, ‘microns’)]
     #  SQL:
       SELECT mips, microns FROM chips
            WHERE processor = ‘Pentium’ OR processor = ‘PentiumII’;
     
### ￼General Syntax
     SELECT attribute(s) FROM table(s)
          [WHERE constraints];  ### is optional

# ￼How would we pull the years of all 32-bit processors that execute fewer than 250 million
     # instructions per second (mips)
     # R
          chips[ chips$mips < 250 & chips$width == 32, "date"]
     # SQL
          SELECT date FROM chips 
              WHERE mips < 250 AND width = 32;
  
### ￼SQL offers limited features for summarizing data
     #### AGGREGATE FUNCTIONS that operate over the rows of a table
     #### MATHEMATICAL FUNCTIONS that operate on individual values in a row

### The AGGREGATE FUNCTIONS are:
        #  COUNT - number of rows
        #  SUM - total of all values for an attribute 
        #  AVG - average value for an attribute
        #  MIN - minimum value for an attribute 
        #  MAX - maximum value for an attribute
     
SELECT attribute(s) FROM table(s) [WHERE constraints];

￼
### ￼Exercise:
  # 1)  How many rows are in the chips table?
  SELECT COUNT(date) FROM chips;
  # 2) How many chips have attribute width equal to 32?
  SELECT COUNT(date) FROM chips WHERE width = 32;
  # 3) What is the average clock speed for the chips in question 2?
  SELECT AVG(clockspeed) FROM chips WHERE width = 32;
  
  # Now answer the same questions assuming chips is a data frame in R:
  nrow(chips); 
  sum(chips$width == 32);  
  mean(chips$clockspeed[chips$width == 32)
     
     
### ￼Additional clauses: GROUP BY
  #  The GROUP BY clause makes the aggregate functions in SQL more useful. 
  #  It enables the aggregates to be applied to subsets of the rows in a table.
  SELECT width, MAX(mips) FROM chips
     GROUP BY width;
  # width | max
  # -------+------
  # 8      | 0.64 
  # 16     | 1 
  # 32     | 1700
  # (3 rows)
  #  More than one attribute can be included in the GROUP BY clause.

### ￼Additional clauses: HAVING
  #  The WHERE clause can’t contain an aggregate function, but the HAVING clause can be used 
            # to refer to the groups to be selected.
    SELECT width, MAX(mips) FROM chips
           GROUP BY width HAVING MAX(mips) >= 1;
    #  width | max
    # -------+------
    # 16     | 1
    # 32     | 1700
    # (2 rows)

# First the chips table is separated into sets of rows by width. 
# For each set, MAX(mips) is calculated, and the set is discarded if MAX(mips) < 1. 
# Finally, width and MAX(mips) are returned for each set.

     
### ￼A few other predicates and clauses
       #  DISTINCT - forces values of an attribute in the results table to have unique values
       #  NOT - negates conditions in WHERE or HAVING clause 
       #  LIMIT - limits the number of rows returned
       
       SELECT * FROM chips LIMIT 3;
       
       SELECT DISTINCT width FROM chips;
     
### ￼Order of Execution:
# The order of execution of the clauses in a SELECT statement is as follows:
     # 1. FROM: The working table is constructed.
     # 2. WHERE: The WHERE clause is applied to each row of the table, and
                 # only the rows that test TRUE are retained.
     # 3. GROUP BY: The results are broken into groups of rows all with
                 # the same value of the GROUP BY clause.
     # 4. HAVING: The HAVING clause is applied to each group and only
                 # those that test TRUE are retained.
     # 5. SELECT: The attributes not in the list are dropped, aggregates are calculated, 
                 # and options DISTINCT, ORDER BY and LIMIT are applied.

### ￼Using SQL with R
     # The DBI and RSQLite libraries allow you to connect to an SQL database, submit a query,
              # and receive the results as a data frame.
  library(RSQLite)
  # set up an interface to SQLite
  M = dbDriver("SQLite")
  # connect to particular DBMS (no security SQLite)
  con = dbConnect(m, dbname="tfile")
  # submit an SQL statement; returns a data frame
  dbGetQuery(con, "SELECT * FROM chipsSQLite LIMIT 5;")
  # ￼If the results are large, we don’t have to pull them all over into R at once.
  # submit an SQL statement; but keep results in SQL
  rs = dbSendQuery(con, "SELECT * FROM chipsSQLite;")
  # Retrieve the first 5 rows in the results!
  fetch(rs, n = 5)
  # Retrieve the next 3 rows
  fetch(rs, n = 3)
  # Retrieve the remaining rows
  fetch(rs, n = -1)
  # Close the query
  dbClearResult(rs)
  # We can of course import the whole table, then extracting what we want using R commands.
  # But, it may be more efficient to use SELECT to extract and import only the results with 
         # which we want to work     
     
### Multiple Tables
     # Entities 
          # Customer:
                 # Customers can have more than one account 
          # Account:
                 # Accounts can be owned by more than one customer
                 # An account is in one branch
          # Branch:
                 # Branches can have many accounts
  
### EG: Extractions 
     # The names and addresses of all customers. 
     SELECT Name,Addr FROM Customers;
     # All of the attributes in the Registration table for accounts belonging to Customer 3
     SELECT * FROM Registration WHERE CID = 3;
     # Account numbers for accounts that don’t meet minimum $100 balance in City branch.
     SELECT AcctNo FROM Accounts 
       WHERE Branch = 'City' AND Balance < 100;
     # The total balance for all accounts belonging to a branch.
     SELECT Branch, SUM(Balance) 
       FROM Accounts
       GROUP BY Branch;
     # The total overdrawn amount at a branch, for those branches which have an account 
                # with at least $100 overdrawn.
     SELECT Branch, SUM(Balance) FROM Accounts
       WHERE Balance < 0 
       GROUP BY Branch 
       HAVING Min(Balance) < -100;
     
### Joining tables
     SELECT Name, AcctNo 
       FROM Customers,Registration 
       WHERE Customers.CustNo = Registration.CID;
    #         Name  AcctNo
    #   1 Smith, J    201
    #   2 Smith, D    201
    #   3 Smith, D    202

# Combining two tables in this way is called an INNER JOIN
# Note how we refer to columns within a given table using the form tableName.column (“dot notation”)
     # This isn’t strictly necessary when there’s only one possible match, but it improves clarity
# We can use AS to rename tables or columns. This can save a lot of typing.
     SELECT Name, AcctNo AS Account 
       FROM Customers AS C, Registration AS R 
       WHERE C.CustNo = R.CID;
     #         Name Account
     #   1 Smith, J     201
     #   2 Smith, D     201
     #   3 Smith, D     202

# The customer name, account number, and balance of the account for all accounts.
     SELECT C.Name, A.AcctNo, A.Balance 
       FROM Customers C, Registration R, Accounts A 
       WHERE C.CustNo = R.CID AND  A.AcctNo = R.AcctNo;
     #         Name  AcctNo  Balance
     #   1 Smith, J    201        12
     #   2 Smith, D    201        12
     #   3 Smith, D    202      1000
  
# Give the total balance for each customer with multiple accounts.
     SELECT CID, SUM(Balance) 
       FROM Registration R, Accounts A 
       WHERE A.AcctNo = R.AcctNo 
       GROUP BY R.CID HAVING COUNT(*) > 1; 
     #     CID SUM(Balance) 
     # 1     2 1012
     # 2     3 297
       
### Other types of Databases
     #  NoSQL
          # data bases that don’t use SQL – Not relational
          # JSON – style data structures
     #  NoSQL RDBMS
          #  Data base that doesn’t use SQL, but is relational 
          #  Shell based
     #  Example: MongoDB (from "humongous") is a scalable, high-performance
     
############################################################################################
############################################################################################
############################################################################################          
     
##################################
### Web Cache & Simulation
##################################      
     
### WEB CACHING
     # When you use a search engine to look for a Web page, the search engine looks 
           # through its cache.
     #  The cache is created by regularly crawling the web and taking copies of every 
           # page that has changed since the last time it visited the site.
     #  It’s time consuming and costly to crawl the web.
     #  How often do you need to crawl the web in order to keep its stock fresh for 
           # the search engine?
     #  Data: a collection of web sites were visited regularly over a period of time 
           # to see whether or not they had changed.
     #  Question: Given a new website, how often would you recommend as the length 
           # of time between visiting the site?
     
load(url("http://www.stanford.edu/~vcs/StatData/Cache500.rda"))
class(Cache500)
# [1] "list”
length(Cache500)
# [1] 500
class(Cache500[[1]])
# [1] "integer"
length(Cache500[[8]])
# [1] 14 
Cache500[[8]] # the eight website has changed 14 times
              # the first change was observed on the 3rd visit
              # the second change was observed on the 23rd visit
              # the last change was observed on the 175th vosit
# [1] 3 23 30 32 39 42 45 
# [8] 62 78 82 147 151 155 175
     
# Find the number of visits to each site     
ls = sapply(Cache500, length)
head(ls)
# [1] 206 22 23 390 346 218
     
# Find those sites that had only a few visits 
which(ls < 15 & ls > 0)[1:4]
# [1] 8 19 38 39
     
Cache500[c(8, 19, 38, 39)] 
# [[1]]
# [1] 3 23 30 32 39 42 45 62 78 82 147 151 155 175
# [[2]]
# [1] 20 85 90 91 140 211 254 373
# [[3]]
# [1] 199 239 255
# [[4]]
# [1] 16 40 64 88 112 136 160 184 208 232
     
### Extracting information
     #  We can think of these values as units of time, 
              # e.g. if the visits occurred daily then 5 is 5 days.
     #  Some characteristics of interest to us are:
              #  The number of changes over the observed time period
              #  The length of “time” between changes
              #  The times at which a change was observed
     
Cache500[[8]]
# [1] 3 23 30 32 39 42 45 
# [8] 62 78 82 147 151 155 175
x = Cache500[[8]]
     #  The number of changes over the observed time period
     #  The length of “time” between changes
     #  The times at which a change was observed
# [1] 3 23 30 32 39 42 45 62 
# [9] 78 82 147 151 155 175
     
#  The number of changes:
length(x)
# [1] 14
     
#  The length of “time” between changes: 
x[2:14] – x[1:13]
# [1] 20 7 2 7 3 3 17 16 4 65 4 4 20
  
#  The times at which a change was observed 
x     
 
### Properties of the time between
     # Might behave like a waiting time - the density curve for the time between changes 
             # looks like the exponential
### Properties of the times
     # Might behave like a uniform – the density curve for the locations might be uniform 
             # distribution (flat)

### How to compare the data to what we expect?
     # Compare locations of data to expect
     # Compare data HISTOGRAM
     # Compare QUANTILES
     
### SIMULATION STUDY FOR THE TIMES OF CHANGES:
     # Cautions:
         # If the site changed more than once between visits, we wouldn’t be able to tell
         # We can’t tell when the site changed, only that it changed at some point in the 
                    # interval between visits
     # Carry out a simulation study of the the distribution of the locations of changes 
          # when sampling from the uniform distribution. 
     # To do this we examine the distribution of a statistics that measures the distance 
          # between our empirical distribution and the expected distribution.
     #  For a given number of changes, simulate when these changes might occur, using the 
          # uniform distribution
     #  Compare the occurrence of changes to what you would expect if they were generated 
          # from the random uniform, i.e. get a statistic
     #  Repeat many times (B) to get the empirical distribution of these statistics

### SIMULATION EG:
     # Suppose the data are from a normal distribution with center 0. 
     # We are interested in the statistic: median.
     # How does the distribution of the median vary with the sample size 
             # and with the standard deviation of the normal distribution?
     # In our example: X1,X2,...,Xn are independent observations from the same normal distribution.
     # The normal distribution has center 0 (mean/ expected value) and spread σ (standard deviation)
     # We are interested in the distribution of Xˆ the median( X1,X2,...,Xn )
     # So we take many samples of size n, and study the behavior of the sample medians
     # We use all of these sample medians to estimate features of the sampling distribution 
             # of the median, such as the center of the distribution, 
             # the spread of the distribution, 
             # and the shape of the distribution.
     # (recall Monte Carlo methods)
     
### ￼Web Cache Simulation Study
     #  Experiment:
           #  For n (number of changes) – generate locations of changes
           #  Compute the statistic: KS-statistic
     #  Simulation:
           #  Repeat generation of locations 
           #  Repeat computation of KS-statistic
           #  Compare our Cache500 KS-statistic to the B simulated KS-statistics
     
### Cacher Package for R
     
# From ``Caching and Distributing Statistical Analyses in R’’ (R. Peng 2008)
# “Cached computations are results that are stored in a database as an analysis is being conducted.
# These stored results can be distributed via websites or central repositories so that others may 
# explore the datasets and computer code for a given scientific investigation.”
     
### Idea: Reproducible Research
     
### ￼Cacher Package for R
     # 1. parse the R source file
     # 2. create cache directories and subdirectories
     # 3. set various configuration variables and hook functions for plopng
     # 4. copy the source to the cache directory
     # 5. cycle through each expression in the source
            # (a) if an expression has never been evaluated, evaluate it and store any 
                           # resulting R objects in the cache database,
            # (b) if a cached result exists, lazy-load the results from the cache database,
            # (c) if an expression does not create any R objects (there is nothing to cache), 
                           # add the expression to the list of expressions where evaluation 
                           # needs to be forced,
            # (d) write out metadata for this expression to the metadata file.
     
### ￼Cacher Example:
     # R> library("cacher”)
     # R> cacher("myanalysis.R”) 
          # where myanalysis.R is an R source file.
     # To print log messages to the console, one can invoke:
          # R> cacher("myanalysis.R", logfile = NA)
          # See example starting on page 8 of paper
     
### Downloading a Cache
     # R> clonecache(http://penguin.biostat.jhsph.edu/bigvector.cache)
     #      created cache directory '.cache’
     #      downloading source file list
     #      downloading metadata
     #      downloading source files
     #      downloading cache database file list
     # R> showfiles()
     # [1] "bigvector.R"
     # R> sourcefile("bigvector.R")
     # R> code()
     # source file: bigvector.R
     # 1 x <- rnorm(1000000)
     # 2 s <- summary(x)
     # 3 print(s)
        
     
############################################################################################
############################################################################################
############################################################################################          
     
######################################
### Principal Component Analysis (PCA)
######################################      
     
### EG: PREPROCESSING THE DATA
     # Aggregation by another variable.
     # Continuous: Centering/Rescaling
     # Continuous: PCA, projection pursuit
     # Discrete/Nominal Distances/ Contingency Tables/ CA
     # Discrete/Ordinal Distance/PCA
     # Sequences −→ alignments
     
### Principal Components is a dimension reduction method
     # PC are new variables, uncorrelated built from the old ones
     # Definition: Principal components are the coordinates of the observations on the basis 
          # of the new variables (namely the columns of V) and they are the rows of G = XV = US. 
     # The components are orthogonal and their lengths are the singular values
          # C′C = SU′US = S2
     # In the same way the principal axes are defined as the rows of the matrix Z = U′X = SV′
     # Coordinates of the variables on the basis of columns of U
          # Z = S−1C′X and G = XZ′S−1.
     # However, this decomposition will be highly dependent upon the unity of measurement 
          # (scale) on which the variables are measured
     # It is only used, in fact, when the X·k are all of the same ``order''
     # Usually what is done is that a weight is assigned to each variable that takes into
     # The columns of V are the directions along which the variances are maximal��� The columns of V are the directions along which the variances are maximal.
     # X centered, all points (observations) same weight
          # Xij = SUM Uit St Vjt
          # is the best (optimal) approximation of rank k for X
     
# How do we choose k?
     # Not BEFORE seeing the EIGENVALUE DOTPLOT (or SCREENPLOT)
# Principal Components as seen as an Eigenvalue Analysis
     # Coefficients are obtained through eigenvalues of variance-covariance or correlation matrix.
     # Eigenvalues represent variance explained��� Eigenvalues represent variance explained.
     # Also useful discriminant analysis, canonical variate analysis
     # Generalized eigenvalue problem��� Generalized eigenvalue problem
           # det(A − λB) AB^(−1) B^(−1/2) A B^(−1/2)
     # Statistics → symmetrical eigenvalue problems��� Statistics → symmetrical eigenvalue problems.
     # A and Z′AZ same eigenvalues → Z tranforms A's ￼￼structure

### EG OF DATA PREPROCESSING:
     library(ade4)
     data(olympic)
     help(olympic)
     round(cov(olympic$tab),1)
     round(apply(olympic$tab,2,var),1)
     pca0 = dudi.pca(olympic$tab,scale=FALSE) 
     pdf("PCA0.pdf")
     par(mfrow=c(1,2))
     barplot(pca0$eig)
     s.label(pca0$co, clab = 0.5)
     dev.off()
     round(cor(olympic$tab),1)
     pca1 <- dudi.pca(olympic$tab) 
     pdf("plotolympic.pdf")
     par(mfrow = c(2,2))
     barplot(pca1$eig) 
     s.corcircle(pca1$co) 
     plot(olympic$score, pca1$l1[,1]) 
     abline(lm(pca1$l1[,1]~olympic$score)) 
     s.label(pca1$l1, clab = 0.5) 
     s.arrow(2 * pca1$co, add.p = T) 
     dev.off()
     par(mfrow = c(1,1))
     olympic2=olympic$tab 
     olympic2[,c(1,5,6,10)]=-olympic2[,c(1,5,6,10)] 
     pca2 <- dudi.pca(olympic2, scan = F)
     
### Singular VALUE DECOMPOSITION (SVD)
     # take a matrix and decompose it
     # also named Principal Component Analysis
          # must scale variables (divide by varience)
          # must also center variables
     
     
############################################################################################
############################################################################################
############################################################################################          
     
##################################
### Supervized Learning (1)
### K-Nearest Neighbours
##################################  
     
# If you have a new product, how should you spend your advertising money to generate 
     # the most sales?
# Idea: predict the level of sales from TV, radio and newspaper 
# Input variables (covariates, independent variables, predictors, features):
     # TV��� TV
     # RADIO��� radio
     # NEWSPAPER��� newpaper
# Output variable (response, dependent variable):
     # SALES
     
# Formula: sales = f(TV, RADIO, NEWSPAPER) + NOISE
     # INPUTS: X = (X1, X2, ... , Xp)^T
     # OUTPUT: Y
     # RELATIONSHIP: Y = f(X) + e
     
# REGRESSION: Y has continuous scale (QUANTITATIVE)
# CLASSIFICATION: Y has categorical values (QUALITATIVE)
     
# EG: we want to predict the annual income (income) of an individual based on years of 
     # education (years of education)
     # what if we include seniority as well
     
# Why estimate f?
     # PREDICTION
          # EG: We have a new product with a set advertising budget TV, radio and newspaper). 
                        # What will its sales be?
          # EG: Alice has 16 years of education and 0 years of seniority. 
                        # What will her income be?
          # Two-Step PREDICTION:
                  # STEP 1: use data (X1, Y1) ... (Xn, Yn) to estimate f with f HAT
                  # STEP 2: feed new input X through f HAT to get estimated output  
                        # Y HAT = f HAT (X)
                  # How accurate is Y HAT?
                        # Y - Y HAT = e + f(X) - f HAT (X)
                                # e = irreducible error
                                # f(X) - f HAT (X) =  reducible error
          # MEAN SQUARED ERROR (MSE) to measure success
                  # E(Y - Y HAT)^2 = (f(X) - f HAT (X))^2 + Var(e)
     # INFERENCE
          # EG: If you have a new product, how should you spend your advertising money to generate the most sales?
                    # Which media contribute to sales? 
                    # Which gives the biggest boost? 
                    # If I spend more on advertising, how much should sales increase?
          # want to LEARN about the relationship between inputs and outputs
                    # how will increasing one input affect the output?
                    # is a specific combination of inputs associated with an increase in the output?
          # To answer my question, I need to estimate the relationship 
                    # Y = f(X) + e
          # How do I find f HAT using (x1,y1),...,(xn,yn)?
                    # 1. select a statistical model
                          # PARAMETRIC MODEL = described by a finite number of parameters
                                # EG:     
                                        # GAUSSIAN DISTRIBUTION
                                        # BERNOULLI DISTRIBUTION
                                        # LINEAR MODEL
                                # CHARACTERISTICS:
                                        # few parameters
                                        # well-described interaction between inputs, parameters and output
                                        # limited flexibility
                          # NON-PARAMETRIC MODEL = NOT described by a finite number of parameters
                                # EG: K-NEAREST NEIGHBORS (KNN)
                                      # average the values of the k closest observations
                                      # classification: pick the majority label
                                            # EG: Running - recorded temp(F), wind(mph), fun(yes/no)
                                      # regression: average the values
                                            # EG: Congressional Approval
                                # CHARACTERISTICS:
                                      # MORE FLEXIBLE than parametric models
                    # 2. select the model parameters using the data

### NOTE: Why would we ever want a more restrictive model? (PARAMETRIC MODEL)
     # prevent overfitting
     # data comprehension
     # interpretability: model parameters often mean something
     # often, more interpretable models are less flexible and vice versa
     

############################################################################################
############################################################################################
############################################################################################          
     
################################
### Supervized Learning (2)
### Linear Discriminate Analysis
################################
     
### Discremination for Continuous Explanatory Variables     
     # Discriminant functions (CANONICAL ROOT)
           # are the essence of the output from a discriminant analysis
           # are the linear combinations of the standardized independent variables which
                 # yield the biggest mean differences between groups
     # DICHOTOMY RESPONSE (2 classes) ---- ONE DISCRIMINANT FUNCTION
     # K CLASSES TO PREDICT           ---- K-1 DISCREMINENT FUNCTIONS
     # Successive discriminant functions are ORTHOGONAL to one onether (like PCA)
           # BUT they are DIFFERENT from PCA
           # BECAUSE they MAXIMIZE the differences between the values of response between classes
                   # NOT the TOTAL VARIANCE
     # INPUT DATA DOES NOT HAVE TO BE CENTERED AND STANDARDIZED, like we did with PCA
          # SCALLING DOES NOT AFFECT the outcome of the final discriminant analysis
     # DISCRIMINAT FUNCTION
          # a latent variable which is created as a linear combination of discriminating variable
                  # L = B1X1 + B2X2 + ... BpXp + c
                         # B = discriminant coefficients
                         # X = discriminant variables
                         # c = constant
                  # similar to multiple regression
                  # HOWEVER "B's" are DISCRIMINAT COEFFICINT which MAXIMIZE the distance 
                         # between the means of the criterion (dependent) variable
     
### DISCRIMINANT FUNCTIONS ESTIMATED BY:
     # ORDINARY LEAST-SQUARES METHOD
          # VARINCE COVARIANCE MATRIX HAS TWO PARTS:
                # the variance WITHIN each class
                # variability BETWEEN clases
          # DISCRIMINAT SCORE (called DA score):
                # the value resulting from applying a discriminant function formula to the data
                # the Z score is the discriminant score for standardized data
                # if discriminant score =< CUTOFF than is ZERO
                # if discriminant score > CUTOFF than is ONE
                # if groups are EQUAL, than CUTOFF = mean of the two centroids
                # if groups are UNEQUAL, than CUTOFF = weighted mean
                # UNSTANDARDIZED DISCRIMINANT COEFFICIENTS:
                      # used in the formula for making clasifications in DA
                # STANDARDIZED DISCRIMINANT COEFFICIENTS:
                      # used to compare the relative importance of the independent variables
                # GROUP CENTROID:
                      # mean value for the discriminant scores for a given category
     # MAXIMUM LIKELIHOON METHOD
     
### MAHALONOBIS DISTANCE:
     # used in analyzing cases in discriminant analysis
     # if you want to analyze a new set of cases in comaprison to an existing set of cases
     # the distance between a case and the centroid for each group in attribute space
              # taking into account the covariates of the variables
     # used to compute the distance of a case X and the center of the population
              # D^2(X,miu) = (X - miu j)^(C-1) (X = miu j)
              # where C = SUM (ni - 1)Ci / SUM (ni - 1)
     # assign X to the group t which its MAHALANOBIS distance is the SMALLEST
     # the SMALLER the MAHALANOBIS DISTANCE IS, the closer the case is to the group centroid 
              # and the more likely it is to be classed as belonging to that group
     
### Implementation in R:
     lda()
     lda(formula, data, ... , subset, na.action)
     # Default S3 method:
     lda(x, grouping, prior = proportions, method, CV = FALSE, nu, ...)
     
### EG LINEAR DISCREMINATION:
     diabetees = read.table("diabetes.txt", headert = TRUE, row.names=1)
     pairs(diabetes[,1:5], pch=21, bg = c("red", "green3", "blue"))
     diab.ld = lda(diabetes[,1:5], grouping = diabetes[,6])
     diab.ld
     names(diab.ld)
     table(predict(diab.ld, diab[,1:5])$class, diab[,6])
     
### Cross-Validation:
     # To determine an estimate of the misclasification rate that is NOT biased
     # for LDA we use a LEAVE-ONE OUT CROSS VALIDATION (nfold)
     conf <- function(class.predict, class)
       { 
         confusion = table(class.predict, class) 
         return(confusion) 
        }
     library(class)
     train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3]) 
     test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3]) 
     cl <- factor(c(rep("s",25), rep("c",25), rep("v",25))) 
     knn(train, test, cl, k = 3, prob=TRUE) 
     iris.knncv2 = knn.cv(train, cl, k = 2, prob = TRUE) 
     iris.knncv4 = knn.cv(train, cl, k = 4, prob = TRUE) 
     iris.knncv8 = knn.cv(train, cl, k = 8, prob = TRUE) 
     iris.knncv12 = knn.cv(train, cl, k = 12, prob = TRUE) 
     table(cl, iris.knncv2)
     # iris.knncv2 
     # cl c s v 
     # c 47 0 3
     # s 0 50 0
     # v 5 0 45
     table(cl,iris.knncv8)
     # iris.knncv8
     # cl c s v 
     # c 47 0 3 
     # s 0 50 0 
     # v 2 0 48
     table(cl,iris.knncv12)
     # iris.knncv12
     # cl c s v 
     # c 47 0 3 
     # s 0 50 0 
     # v 3 0 47
     require(RWeka)
     classifier <- IBk(class ~ ., data = iris, control = Weka_control(K = 2))
     evaluate_Weka_classifier(classifier, numFolds = 10)
     evaluate_Weka_classifier(classifier, numFolds = 150)
     diab.ld.cv = lda(diab[,1:5],grouping=diab[,6],CV=T)
     names(diab.ld)
     table(diab.ld.cv$class,diab[,6])
     #    1 2 3 
     # 1 25 0 0 
     # 2 6 30 3 
     # 3 1 6 73
     diab.ld=lda(diab[,1:5],grouping=diab[,6])
     names(diab.ld)
     # [1] "prior" "counts" "means" "scaling" "lev" "svd" "N" [8] "call"
     table(predict(diab.ld,diab[,1:5])$class,diab[,6])
     #   1 2 3 
     # 1 26 0 0 
     # 2 5 31 3 
     # 3 1 5 73
     
############################################################################################
############################################################################################
############################################################################################          
     
#####################################
### Supervized Learning (3)
### Clasification and  Decision Trees
#####################################        

# Goal of CLASSIFICATION: 
     # find a classifier that allows us to predict the label of a new observation given 
            # a new set of features
# CLASSIFICATION IS A SUPERVISED PROBLEM:
# Training Set--INDUCTION(LEARNING ALGORITHM)-->MODEL--DEDUCTION(APPLY MODEL)-->Test Set

# CLASSIFICATION TREES:
     # splitting attributes
     # there could be more than one tree that fits the same data
     
# Decision boundary for tree     
iris = read.table("http://www.stanford.edu/~vcs/StatData/iris.data", sep=',', header=FALSE) 
names(iris) = c("sepal.length", "sepal.width", "petal.length", "petal.width", "iris.type") 
require(tree)
stree = tree(iris.type ~ ., data=iris) # default is entropy criteria
plot(stree) 
text(stree)
     
stree2 = tree(iris.type ~ petal.width + petal.length, data=iris) 
plot(stree2) 
text(stree2)    
     
# Learning the tree
     # GREEDY STRATEGY:
          # split the records based on an attribute test that optimizes certain criterion
     # WHAT IS THE BEST SPLIT:
          # previous example chose first to split on REFUND
     # HOW TO SPLIT THE RECORDS:
          # Binary OR Multi-way
          # presious example split Taxable Income at >= 80K
     # WHEN DO WE STOP? SHOULD WE CONTINUE UNTIL EACH NODE IF POSSIBLE?
          # previous example stopped with all nodes being completely homogenous
     
# CHOOSING THE BEST SPLIT:
     # need some numerical criterion to choose among possible splits
     # criterion should have HOMOGENOUS or PURE nodes
     # Common cost functions:
            # GINI INDEX
                  # GINI = 1 - (a / a+b+c)^2 - (b / a+b+c)^2 - (c / a+b+c)^2
             stree_gini = tree(iris.type ~ ., data=iris, split="gini") 
             plot(stree_gini) 
             text(stree_gini)
            # ENTROPY / DEVIANCE / INFORMATION
                  # ENTROPY = (a/a+b+c)log(a/a+b+c) + (b/a+b+c)log(b/a+b+c) + (c/a+b+c)log(c/a+b+c)
             stree = tree(iris.type ~ ., data=iris) # default is entropy criteria
             plot(stree) 
             text(stree)
            # MISCLASSIFICATION ERROR
                  # MR = 1 - max( (a/a+b+c) , (b/a+b+c) , (c/a+b+c) )

p = seq(0.001, 0.999, length=100)
plot(p, 2*(1-p)*p, type="l", col="red", xlab="p", ylab="Criterion", ylim=c(0,0.75), lwd=2)
lines(p, -p*log(p)-(1-p)*log(1-p), col="blue", lwd=2)
lines(p, pmin(p, 1-p), col="green", lwd=2)
 
### STOPPING TRAINING:
     # as trees get deeper, or if the splits are multi-way the number of data points
     # per leaf node frops very quickly
     # trees that are too deep tend to overfit the data
     # a common strategy is to "PRUNE" the tree by removing some internal nodes
     
# Pre-Pruning (rpart library):
     # these methods stop the algorithm before it becomes a fully-grown tree
     # Stop if all instances belong to the same class (kind of obvious)
     # Stop if number of instances is less than some user-specified threshold 
            # Both tree, rpart have rules like this
     # Stop if class distribution of instances are independent of the
            # available features (e.g., using 2 test)
     # Stop if expanding the current node does not improve impurity
            # measures (e.g., Gini or information gain). This relates to cp in rpart
require(rpart) 
     
#                              PREDICTED CLASS
#                             YES         NO
# ACTUAL CLASS    YES          TP         FN
#                  NO          FP         TN

     # ACCURACY = (TP + TN) / (TP + TN + FP + FN) = 1 - Misclassification Rate
     # PRECISION = TP / (TP + FP)
     # SPECIFICITY = TN / (TN + FP) = TNR
     # SENSITIVITY = TP / (TP + FN) = TPR
     
# Evaluating a Classifier:
     # HOLDOUT:
          # split into test and training (1/3 test, 2/3 training)
     # RANDOM SUBSAMPLING:
          # repeated replicates of holdout, averaging results
     # CROSS VALIDATION:
          # partition data into K disjoint subsets
          # for each subset S, train an all but S, and test on S
     # STRATIFIED SAMPLING:
          # may be helpful to sample so Yes/No class is roughly equaly in training data
     # 0.632 BOOTSTRAP:
          # combine training error and bootstrp erros
     
############################################################################################
############################################################################################
############################################################################################          
     
################
### Final Review
################   
     
# Data Examples = framing the course
     # Focus is statistical thinking in the context of big data, widely available data
     # Developing tool kit
          # using R and R Studio
          # expression/order of operations
          # how variables work/ what output to expect/ assigment
          # calling build in functions
          # objects in R
                # data types
                      # vector: logical vectors, factors (levels), 
                      # functions: for querying the data
                      # data frames
                      # list (indexing)
                      # matrices and arrays
                # subsetting
                      # position/exclusion/logical/name/all
                # logical
                # Booleon Algebra
                # creating vectors: concatanete/rep/seq/sort/order
     # Graphics and vizualization
          # data types: qualitatice/quantitative
          # vizualization as an itterative process
          # plotting tools in R: rug plot, histogram, density, plot, boxplot, dot plot, mosaic plot
          # Understading distributions visually:
                # mode, long tail, symetry properties, skewness, outliers, missing data (big gaps)
                # pie VS rectangles (how people vizualize information)
          # Commands to adjust and thread plot
          # Using color: Brewer Color Package
          # Decision about scale, comparing different plot, which is your baseline, layout, captions
          # Efficiency in presentations:
                # parsemonious VS info rich
                # decide the message
    # Reading Data in R
          # read.table(), read.csv()
          # scan()
    # Apply function:
          # sapply(), lapply()
          # apply() = matrices
          # tapply() 
    # Writing our own functions:
          # are different from scripts
          # orphan function or anonymous function
          # sintax, documentation, and commenting for writing functions 
          # reproducibility of your code
          # transparency
    # Flow control
          # IF ELSE IF
          # FOR LOOPS
          # WHILE LOOPS
    # Simulations
          # deriving distributions
          # STEPS:
              # 1. fully define a numerical experiment (median, mean, etc)
              # 2. implement the experiment in R - write a function for it
              # 3. vary the inputs of that function
                        # for each combination of inputs repreat the experiment some B times (needs to be large B)
              # 4. state or plot the results
     # Random Number Generation:
          # in general is pseudo random in computers and what does R do
     # EXAMPLES:
          # Biham-Middlenton-Levine traffic model - early model has its faults
          # Behavior of median
          # Changes in static webpages - how to deal with text data
     # Matching/Merging Text Data:
          # EG: counties, state of the union speeches, text mining web data (web logs), spam filtering in an email
          # R functions:
                # regular expressions:
                      # literal
                      # character class 
                      # modifiers
                # meta characters
                      # wild cards
                # greedy matching
      # Web scraping:
          # unstructured text: 
          # structured text: Weblogs, emails
          # read.lines()
          # read.fwf()  - fixed width format
      # Parsing HTML:
          # JSON structures -  Java Script Object Notation
                # Components:
                    # 1. colon separated name: value
                    # 2. ordered array of data values 
          # XML:
                # syntax
                # what is well formed XML
                # tree representation
          # KML:
                # homework
     # Representation of Data on the WEB
          # colors (actual simbols used) - hex, rgb
          # ascii, xlsx (displaying meta characters in different operating systems -  look up END OF LINE on wikipedia)
     # Tree Structure in HTML
          # tables
          # lists ordered and unordered
          # build a webpage
          # paragraphs
          # headers
          # images
          # anchors
          # links
      # CSS - cascading style sheets
          # call inside HTML
          # more efficient formating
      # UNIX:
          # originates from 1960's
          # file structures OR processes
          # scripting in UNIX
          # sed - match and change expresion when we work with text
          # awk - usefull when working with column data
          # R is in unix
          # redirection
                # standard input
                # standard output
                # chmod --- here other commands
      # Text Mining:
          # "bag of words" approach
          # document  similarity
                # frequency of terms (words)
                # frequency of documents (terms)
          # distance between two documents
          # similarity matrix
          # multidimensional scaling (information has 100 var and rescaling to smaller number of dimensions)
          # agglomerative clustering
          # measures of similarity between two groups
                  # single linkage
                  # complete linkage
                  # average linkage
          # vizualizing these clusters
                  # dendrograms
      # XML and XPATH:
          # XML:
                # XML package in R: build in function for reading XML in R
                # parsing/create XML in R/ input
                # xmlApply()
                # creating data frames from XML
          # XPATH:
                # finding data within an XML document when XML is well formed
                # SYNTAX: 
                      # axis::nodetest[predicate]  - predicate = attributes that you try to match on
                      # use "unix" file structure notation     $ cd /home/stat4026
      # SQL - Structured Query Language:
          # bringing this structured query language data into R
          # quering the database server
          # SELECT statement
          # introduction of relational databases/datastructures
                # identifying keys in a dataset
                # joining tables
      # Web Caching:
          # Simulations: package cacher in R
      # Principal Components Analysis: is a dimensionality reduction technique
          # Exploit the structure in the covariance matrix with math
          # the math is Singular Value Decomposition (SVD)
          # understanding structure in data
          # compress data
          # keep only principal component that explain most variance
     # Supervized learning:
          # K-Nearest Neighbours
                # understanding how close they are to different neighbours
          # Linear Discriminate Analysis
                # Discriminate Functions 
          # Decision Trees
                # Classifing data hierarchically
