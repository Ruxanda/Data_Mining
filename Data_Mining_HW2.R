############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 2 
############################################################################################
############################################################################################

# In this assignment you will manipulate a data frame, by taking subsets and 
# creating new variables, with the goal of creating a plot.
# DO NOT use the subset() function in R when answering these questions.
# The goal is to give you practice with [ ]

# You will work with housing data that have been made available by the San
# Francisco Chronicle. These data contain information about sales in the
# San Francisco Bay Area, including the date of sale, sale price, square
# footage and location of each house sold from April 2003 to May 2006.

# Before beginning with the housing data, you will do some warm up 
# exercises with the small family data set that we have used in class.

############################################################################################

### PART 1.  Family Data
# Load the data from the Web into your R session with the following command:
load(url("http://www.stanford.edu/~vcs/StatData/family.rda"))

objects()
# [1] "fage"  "family"  "fbmi"  "fdesiredWt" "fgender" "fheight" "fnames"  "foverWt" "fweight" 

# In the following exercises try to write your code to be as general as possible
# so that it would still work if the family had 27 members in it or if the 
# variables were in a different order in the data frame.

# (1) Q1. 
# In the past, the NHANES survey (for the family dataset) used different 
# cut-off values for men and women when classifying them as over weight.
# Suppose that a man is classified as over weight if his bmi exceeds 26
# and a woman is classified as over weight if her bmi exceeds 25.

# Write a logical expression that creates a logical vector, called OW_NHANES, where
# an element is TRUE if a member of family is over weight and FALSE otherwise

fgender
# [1] m f m m f f m f m m f m m f
# Levels: m f

table(fbmi)
# fbmi
# 18.0608937212193  20.677825110357 21.5010639538325 22.6438385926275 22.9106030059567 24.2612556349581 24.4588421417243 
# 1                1                1                1                1                1                1 
# 24.484141396238 25.1623879871136 26.0536376395866  26.664295228559 28.1879692416195 28.9498062481498 30.0491124146844 
# 1                1                1                1                1                1                1 

OW_NHANES <- (fgender == "m" & fbmi > 26) | (fgender == "f" & fbmi > 25)

table(OW_NHANES)
# OW_NHANES
# FALSE  TRUE 
#   9     5 

OW_NHANES
# [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE

table(OW_NHANES, fbmi, fgender)
# , , fgender = m
#
# fbmi
# OW_NHANES 18.0608937212193 20.677825110357 21.5010639538325 22.6438385926275 22.9106030059567 24.2612556349581 24.4588421417243
# FALSE                0               0                0                1                0                1                1
# TRUE                 0               0                0                0                0                0                0
# fbmi
# OW_NHANES 24.484141396238 25.1623879871136 26.0536376395866 26.664295228559 28.1879692416195 28.9498062481498 30.0491124146844
# FALSE               1                1                0               0                0                0                0
# TRUE                0                0                0               1                1                0                1
# 
# , , fgender = f
# 
# fbmi
# OW_NHANES 18.0608937212193 20.677825110357 21.5010639538325 22.6438385926275 22.9106030059567 24.2612556349581 24.4588421417243
# FALSE                1               1                1                0                1                0                0
# TRUE                 0               0                0                0                0                0                0
# fbmi
# OW_NHANES 24.484141396238 25.1623879871136 26.0536376395866 26.664295228559 28.1879692416195 28.9498062481498 30.0491124146844
# FALSE               0                0                0               0                0                0                0
# TRUE                0                0                1               0                0                1                0

# If we look at the table by gender and by BMI we can confirm that the OW_NHANES vector is constructed correctly

############################################################################################

# (4) Q2. 
# Here is an alternative way to create the same vector that introduces 
# some useful functions and ideas.

# We first create a numeric vector called OW_limit that is 26 for each male in
# the family and 25 for each female in the family.  To do this, create a vector 
# of length 2, called OWval, where the first element is 26 and second element is 25.

OWval <- c(26, 25)
OWval
# [1] 26 25

# Now, create the OW_limit vector by subsetting OWval by position, where the 
# positions are the numeric values in the gender variable 
# (i.e. use as.numeric to coerce the factor vector to a numeric vector)
# Notice that we can "subset" a vector of length 2 by a much longer vector.

OW_limit <- OWval[as.numeric(fgender)]
OW_limit
# [1] 26 25 26 26 25 25 26 25 26 26 25 26 26 25
fgender
# [1] m f m m f f m f m m f m m f
# Levels: m f

# Here we can observe that for the "m" level of fgender inside the OW_limit the values are 26
# And for the "f" level of fgender inside the OW_limit the values are 25

# Finally, use OW_limit and the bmi vector in family to create the desired logical vector, 
# and call it OW_NHANES2.

OW_NHANES2 <- fbmi > OW_limit

table(OW_NHANES2)
# OW_NHANES2
# FALSE  TRUE 
#   9     5 

OW_NHANES2
# [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
OW_NHANES
# [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE

# If we compare OW_NHANES with OW_NHANES2 we can deternime that the two vectors are identical

############################################################################################

# (1) Q3.
# Use the vector OW_limit and each persons height to find the weight 
# that he/she would have if their bmi was right at the over weight cut off (26 for men and 
# 25 for women). Call this weight OW_weight

OW_limit
# [1] 26 25 26 26 25 25 26 25 26 26 25 26 26 25
fheight # here HEIGHT is in inch
#  a  b  c  d  e  f  g  h  i  j  k  l  m  n 
# 70 64 73 67 64 68 68 65 68 71 67 66 66 62 
fweight # here WEIGHT is in pounds
# [1] 175 125 185 156 105 190 185 124 175 215 166 140 150 125

### BMI FORMULA: BMI = ( mass(lb) / (height(inch))^2 ) * 703
### So the formula for WEIGHT is : mass(lb) = ( BMI * (height(inch))^2 ) / 703

OW_weight <- floor( ( OW_limit * (fheight)^2 ) / 703 )
OW_weight # this is the weight at which individual will be considered overweight
# a   b   c   d   e   f   g   h   i   j   k   l   m   n 
# 181 145 197 166 145 164 171 150 171 186 159 161 161 136 

# Make the following plot of actual weight against the weight at which they would be over weight

png ("HW2_plot1_weight.png", height=400, width=600)

plot(x = family$weight, y = OW_weight, xlab = "Actual Weight", ylab = "Overweight Projection", 
     pch = 19, type = "p", main = "Actual weight and overweight weight")
abline(a = 0, b = 1)

dev.off()

############################################################################################
############################################################################################
############################################################################################

### PART 2.  San Francisco Housing Data

# Load the housing data into R.
load(url("http://www.stanford.edu/~vcs/StatData/SFHousing.rda"))

### (5) Q4.

### What is the name and class of each object you have loaded into your workspace?

### Your code below
objects()
# [1] "cities"  "housing"
class(cities)
# [1] "data.frame"
class(housing)
# [1] "data.frame"

### Your answer here
# Inside the SFHousing.rda I was able to find two data frames named: cities and housing

###########################

### What are the names of the vectors in housing?

### Your code below
length(housing)
# [1] 15
names(housing)
# [1] "county"  "city"  "zip"  "street"  "price" "br" "lsqft"  "bsqft"  "year" "date" "long" "lat"    
#[13] "quality" "match" "wk"     

### Your answer here
# the housing data frame has 15 variables inside it and their names are listes above

###########################

### How many observations are in housing?

### Your code below
dim(housing)                 # [1] 281506     15

length(housing$county)       # [1] 281506
length(housing$city)         # [1] 281506
length(housing$zip)          # [1] 281506
length(housing$street)       # [1] 281506
length(housing$price)        # [1] 281506
length(housing$br)           # [1] 281506
length(housing$lsqft)        # [1] 281506
length(housing$bsqft)        # [1] 281506
length(housing$year)         # [1] 281506
length(housing$date)         # [1] 281506
length(housing$long)         # [1] 281506
length(housing$lat)          # [1] 281506
length(housing$quality)      # [1] 281506
length(housing$match)        # [1] 281506
length(housing$wk)           # [1] 281506

### Your answer here
# Using the dim() function we can that the data frame has 281506 observations and 15 variables
# We can confirm by using the length() function for each of the 15 vectors inside the housing data frame (281,506 observations)

###########################
### Explore the data using the summary function. 
summary(housing)

#                county                 city             zip            street              price                br       
# Santa Clara County :70424   Oakland      : 14730   94565  :  4595   Length:281506      Min.   :   22000   Min.   :1.000  
# Alameda County     :60410   Santa Rosa   :  9917   94509  :  4302   Class :character   1st Qu.:  400000   1st Qu.:2.000  
# Contra Costa County:59381   Fremont      :  9414   95123  :  4023   Mode  :character   Median :  530000   Median :3.000  
# Solano County      :23404   San Francisco:  8137   95687  :  3652                      Mean   :  602000   Mean   :3.024  
# San Mateo County   :22558   Evergreen    :  7947   94533  :  3472                      3rd Qu.:  700000   3rd Qu.:4.000  
# Sonoma County      :21676   Antioch      :  7726   (Other):261457                      Max.   :20000000   Max.   :8.000  
# (Other)            :23653   (Other)      :223635   NA's   :     5                                                        
#
#      lsqft               bsqft              year           date                          long             lat       
#  Min.   :       19   Min.   :    122   Min.   :   0   Min.   :2003-04-27 03:00:00   Min.   :-123.6   Min.   :36.98  
#  1st Qu.:     4000   1st Qu.:   1121   1st Qu.:1954   1st Qu.:2004-02-08 03:00:00   1st Qu.:-122.3   1st Qu.:37.50  
#  Median :     5760   Median :   1430   Median :1971   Median :2004-10-24 03:00:00   Median :-122.1   Median :37.77  
#  Mean   :    65939   Mean   :   1624   Mean   :1966   Mean   :2004-11-01 19:06:12   Mean   :-122.1   Mean   :37.78  
#  3rd Qu.:     7701   3rd Qu.:   1882   3rd Qu.:1985   3rd Qu.:2005-07-24 03:00:00   3rd Qu.:-121.9   3rd Qu.:38.00  
#  Max.   :418611600   Max.   :1868120   Max.   :3894   Max.   :2006-06-04 03:00:00   Max.   :-121.5   Max.   :38.85  
#  NA's   :21687       NA's   :426       NA's   :9202                                 NA's   :23316    NA's   :23316  
#
#                                    quality                    match              wk            
# QUALITY_ADDRESS_RANGE_INTERPOLATION      :170719   Exact           :197044   Min.   :2003-04-21  
# gpsvisualizer                            : 31084   Relaxed         : 30570   1st Qu.:2004-02-01  
# QUALITY_CITY_CENTROID                    : 20473   Relaxed; Soundex: 23338   Median :2004-10-18  
# QUALITY_EXACT_PARCEL_CENTROID            : 17208   Soundex         :  2573   Mean   :2004-10-26  
# QUALITY_ZIP_CODE_TABULATION_AREA_CENTROID: 14980   1               :  2244   3rd Qu.:2005-07-18  
# (Other)                                  :  3726   (Other)         :  2421   Max.   :2006-05-29  
# NA's                                     : 23316   NA's            : 23316                       

###########################
### Describe in words two problems that you see with the data.
### Write your response here:

# First, we can observe that on some of the variables we have some issues with missing data
# For the lsqft, long, lat, quality, match vectors almost 10% of the data is missing
# Even though we have street names and zip codes for these houses, they were not matched correctly to lat and long coordinates
# We need to make a decision about how to decide address this issue: if want to impute or not

sum(as.numeric(is.na(housing$county)))    # [1] 0
sum(as.numeric(is.na(housing$city)))      # [1] 0
sum(as.numeric(is.na(housing$zip)))       # [1] 5
sum(as.numeric(is.na(housing$street)))    # [1] 0
sum(as.numeric(is.na(housing$price)))     # [1] 0
sum(as.numeric(is.na(housing$br)))        # [1] 0
sum(as.numeric(is.na(housing$lsqft)))     # [1] 21687
sum(as.numeric(is.na(housing$bsqft)))     # [1] 426
sum(as.numeric(is.na(housing$year)))      # [1] 9202
sum(as.numeric(is.na(housing$date)))      # [1] 0
sum(as.numeric(is.na(housing$long)))      # [1] 23316
sum(as.numeric(is.na(housing$lat)))       # [1] 23316
sum(as.numeric(is.na(housing$quality)))   # [1] 23316
sum(as.numeric(is.na(housing$match)))     # [1] 23316
sum(as.numeric(is.na(housing$wk)))        # [1] 0

# Second, we can observe some inconsistencies with the year vector, because as we could observe from 
# an excerpt from the summary(housing) function from above
#        year       
#    Min.   :   0   
#    1st Qu.:1954  
#    Median :1971     
#    Mean   :1966   
#    3rd Qu.:1985  
#    Max.   :3894  
#    NA's   :9202
# The range of the year vector is from 1 to 3894, clearly this variable has been miscoded
# To investigate further we can look to see the class of the year vector, and we can observe that is a integer 
class(housing$year)         # [1] "integer"
# Next, we can table() the year to see the distribution of the data
table(housing$year)
# 0    1    2    3    4    5   10   17   18   20   35   36   37   41   42   43   44   49   50   51   52   53   54   55   57   58 
# 2    3    4    4    3    7    1    1    1    1    1    1    1    3    3    1    1    1    2    1    1    1    4    4    2    4 
# 59   60   61   62   63   64   65   66   67   69   70   71   72   73   74   75   76   77   78   79   80   81   82   83   84   85 
# 2    6    2    1    4    2    1    5    2    4    2    4    4    2    4    3   11    9    8    2    2    1    3    2    1    3 
# 86   87   88   89   90   91   92   93   94   95   96   97   98   99 1870 1880 1885 1887 1888 1889 1890 1892 1893 1895 1896 1897 
# 7    5    8   18    5    2    2    4    1    2    2    2    2    3    1    5    8    4    1    5   18    5    5   26   14    2 
# 1898 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 
# 9  143   28   12   11 1450  743  643  456  778  267 1340  287  968  410  522  770  545  349  613  290 1575  501 1146 1059 1719 
# 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 
# 2096 1488 1086  947  685 1037  466  416  194  257  572  690  739 1135 1296 2033 2243 2105 1375 1241  871 1818 3170 3159 2769 4587 
# 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 
# 4257 3894 3904 4767 5820 4158 2821 3422 4877 4227 3669 3669 4325 4019 4000 2864 2286 3556 3740 5361 7321 6254 5648 4266 3272 4192 
# 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 
# 5265 4682 4912 4085 3836 2606 3031 5051 5474 5242 4266 6103 5764 4971 3469 3252 2927 3270 3743 3410 3900 4106 4000  365 3220 2654 
# 2003 2004 2005 3860 3880 3881 3885 3894 
# 2169  361  162    1    1    1    1    1

# We can observe clearly that there are years from 0 to 99 that are clearly miscoded
# Also, the housing data has years for years 3860 to 3894, clearly again miscoded
# We need to make a decission about how we will deal with these inconsistencies before the analysis

############################################################################################

# (1) Q5.
# We will work with houses in Albany, Berkeley, Piedmont, and Emeryville only.
# Subset the data frame so that we have only houses in these cities,
# and keep only the variables city, zip, price, br, bsqft, and year.
# Call this new data frame BerkArea. This data frame should have 4059 observations
# and 6 variables. Remove from your workspace the housing and cities objects.

MyCities = c("Albany", "Berkeley", "Piedmont", "Emeryville")
BerkArea <- housing[housing$city %in% MyCities, c("city", "zip", "price", "br", "bsqft", "year")]
head(BerkArea)
#        city   zip  price br bsqft year
# 16   Albany 94706 465000  2  1120 1924
# 17   Albany 94706 730000  3  1181 1935
# 18   Albany 94706 349000  2  1170 1988
# 19   Albany 94706 365000  2  1170 1988
# 21 Berkeley 94710 264000  2   774 1908
# 22 Berkeley 94705 525000  4  2009 1917

dim(BerkArea)             # [1] 4059   6
names(BerkArea)           # [1] "city"  "zip"   "price" "br"    "bsqft" "year" 

# We can observe that the newly created data frame ("BerkArea") has 6 variables with 4,059 observations

############################################################################################

# (2) Q6.
# We are interested in studying the relationship between price and size of house, but first
# we will further subset the data frame to remove the unusually large values.
# Use the quantile function to determine the 99th percentile of price and bsqft
# and eliminate all of those houses that are above either of these 99th percentiles
# Call this new data frame BerkArea, as well. It should have 3999 oobservations.
# As in part 1, write your code so that it is very general and does not depend on the 
# actual numeric value for these quantiles.

summary(BerkArea$price)
#   Min.  1st Qu. Median   Mean   3rd Qu.  Max. 
# 120000  450000  610000  698000  804000 8250000 

summary(BerkArea$bsqft)
#    Min. 1st Qu.  Median   Mean   3rd Qu.  Max.    NA's 
#    320    1023    1292    1521    1882    7468       7 

# By looking at the summary of price and bsqft we can observe that between the thirs quantile 
# and the maximum there are significant differences, which might indicate the presence of outliers

QuantPrice <- quantile(x=BerkArea$price, probs=0.99, na.rm=TRUE)   # 99%  2285500 
QuantBsqft <- quantile(x=BerkArea$bsqft, probs=0.99, na.rm=TRUE)   # 99%  4035.76 

BerkArea <- BerkArea[BerkArea$price <= QuantPrice & BerkArea$bsqft <= QuantBsqft, ]

head(BerkArea)
#        city   zip  price br bsqft year
# 16   Albany 94706 465000  2  1120 1924
# 17   Albany 94706 730000  3  1181 1935
# 18   Albany 94706 349000  2  1170 1988
# 19   Albany 94706 365000  2  1170 1988
# 21 Berkeley 94710 264000  2   774 1908
# 22 Berkeley 94705 525000  4  2009 1917

dim(BerkArea)          #  [1] 3999    6
names(BerkArea)        #  [1] "city"  "zip"   "price" "br"    "bsqft" "year" 


# We can observe that the newly created data frame ("BerkArea") has 
# 6 variables with 3,999 observations

summary(BerkArea$price)
#   Min. 1st Qu.  Median    Mean  3rd Qu.    Max.      NA's 
# 120000  450000  605000  668700  800000   2275000       7 

summary(BerkArea$bsqft)
#   Min.  1st Qu.  Median    Mean   3rd Qu.    Max.    NA's 
#   320    1016    1280      1480    1844     4000       7 

# Also, if run the summary of price and bsqft we can confirm that the maximum values now are below the 
# previous values of the 99th percentile
# NEW MAXIMUM PRICE (2275000) < OLD 99th PERCENTILE PRICE (2285500)
# NEW MAXIMUM BSQFT (4000) < OLD 99th PERCENTILE BSQFT (4035.76)

############################################################################################

# (1) Q7.
# Create a new vector that is called pricepsqft by dividing the sale price by the square footage
# of the house.  Add this new variable to the data frame.

BerkArea$pricepsqft <- BerkArea$price / BerkArea$bsqft
head(BerkArea)
#        city   zip  price br bsqft year pricesqft
# 16   Albany 94706 465000  2  1120 1924  415.1786
# 17   Albany 94706 730000  3  1181 1935  618.1202
# 18   Albany 94706 349000  2  1170 1988  298.2906
# 19   Albany 94706 365000  2  1170 1988  311.9658
# 21 Berkeley 94710 264000  2   774 1908  341.0853
# 22 Berkeley 94705 525000  4  2009 1917  261.3240
dim(BerkArea)   # [1] 3999    7

# By looking at the first observation of the data frame we can observe that pricesqft was created correctly
# Also, the data frame has still 3,999 observations, however, it has now 7 variables

############################################################################################

# (1) Q8.
# Create a vector called br5 that is the number of bedrooms in the house, except
# if this number is greater than 5, it is set to 5.  That is, if a house has 5 or more
# bedrooms then br5 will be 5. Otherwise it will be the number of bedrooms in the house.

table(BerkArea$br, useNA='always')
#   1    2    3    4    5     6    7    8   <NA> 
#  495 1603 1154  542  149   31   12    6     7 

BerkArea$br5 <- NA
BerkArea$br5[BerkArea$br == 1] <- 1
BerkArea$br5[BerkArea$br == 2] <- 2
BerkArea$br5[BerkArea$br == 3] <- 3
BerkArea$br5[BerkArea$br == 4] <- 4
BerkArea$br5[BerkArea$br >= 5] <- 5

table(BerkArea$br5, useNA='always')
#   1    2    3    4    5    <NA> 
#  495 1603 1154  542  198     7 

# If we compare the distribution of br and br5 we can observe that the houses that have 1 to 4 bedrooms
# have the same distribution, only the houses with over 5 bedrooms (149+31+12+6=198) are combined into 
# a new category. Also, the NA's are the same number (7)

############################################################################################

# (1) Q9. 
# Use the rainbow function to create a vector of 5 colors, call this vector rCols.
# When you call this function, set the alpha argument to 0.25 (we will explain what this does later).
# Create a vector called brCols of colors where each element
# color corresponds to the number of bedrooms in the br5.
# For example, if the element in br5 is 3 then the color will be the third color in rCols.

rCols <- rainbow(n=5, s=1, v=1, start=.7, end=.1, alpha=.25)
rCols
# [1] "#3300FF40" "#CC00FF40" "#FF009940" "#FF000040" "#FF990040"

BerkArea$brCols <- NA
BerkArea$brCols[BerkArea$br5 == 1] <- rCols[1]
BerkArea$brCols[BerkArea$br5 == 2] <- rCols[2]
BerkArea$brCols[BerkArea$br5 == 3] <- rCols[3]
BerkArea$brCols[BerkArea$br5 == 4] <- rCols[4]
BerkArea$brCols[BerkArea$br5 == 5] <- rCols[5]

table(BerkArea$brCols, useNA='always')
# #3300FF40 #CC00FF40 #FF000040 #FF009940 #FF990040      <NA> 
#    495      1603       542      1154       198           7 

############################################################################################

# (1) Q10.
# We are now ready to make a plot!
# Try out the following code

png ("HW2_plot2_pricepsqft.png", height=400, width=600)

plot(pricepsqft ~ bsqft, data=BerkArea,
     main = "Housing prices in the Berkeley Area",
     xlab = "Size of house (square ft)",
     ylab = "Price per square foot",
     col = brCols, pch = 19, cex = 0.5)
legend(legend = 1:5, fill = rCols, "topright")

dev.off()

### What interesting feature do you see that you did not know before making this plot? 

# First, the colors are very helpfull to distinguish between the houses with different numbers of bedrooms 
# Also, as one would expect, as the number of square feet increases, the number of berrooms increases, with some few exceptions
# Second, we can observe that for houses below 1,000 sq feet the variability of prices per sq foot 
# is higher compared with houses over 3,000 sq feet
# As the size of the house increases the variability of prices per square foot decreases
# Also, we can determine that as the size of the house increases the price per square foot decreases
# We can confirm this by looking at the mean price per square foot by the number of bedrooms
# I decided to break dowm the price per square feet by bedrooms, because the number of bedrooms is a good indicator 
# for the size of the house in square feet
floor(mean(BerkArea$pricepsqft[BerkArea$br5 == 1], na.rm=TRUE))   # [1] 492
floor(mean(BerkArea$pricepsqft[BerkArea$br5 == 2], na.rm=TRUE))   # [1] 494
floor(mean(BerkArea$pricepsqft[BerkArea$br5 == 3], na.rm=TRUE))   # [1] 463
floor(mean(BerkArea$pricepsqft[BerkArea$br5 == 4], na.rm=TRUE))   # [1] 417
floor(mean(BerkArea$pricepsqft[BerkArea$br5 == 5], na.rm=TRUE))   # [1] 390
# These numbers confirm what we clearly saw in the plot that as the size of the house increases the price per
# square foot decreases

############################################################################################