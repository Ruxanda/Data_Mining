############################################################################################
############################################################################################
### APPLIED DATA MINING
### HOMEWORK 5 
### Using the bootstrap
############################################################################################
############################################################################################

### We will use the bootstrap technique to generate confidence intervals

### 1. Suppose we have a sample of data from an exponential distribution 
# with parameter lambda
# In this case we can use Maximum Likelihood to estimate the parameter lambda, which gives 
# lambda.hat = 1/mean(X). As the number of  observations increases, this estimate for lambda 
# becomes normally distributed. We can form a (100 - alpha)*100% confidence interval for
# lambda using an estimate for the variance of lambda, var(lambda) = (lambda.hat)^2 / n.
# This gives an estimate of the confidence interval for lambda.hat as: 
# lambda.hat +/- z(1-alpha/2)*lambda.hat/sqrt(n)

### 1a. (1) Generate 100 observations of test data, with lambda = 3. Remember
# to set your seed before carrying out any computations.
set.seed(50) # arbitrary number in order to replicate results
Lambda = 3
n = 100
ExponentialSample <- rexp(n=n, rate=Lambda)
head(ExponentialSample) 
# [1] 0.139151398 0.277260004 0.008774593 1.067704255 0.133275194 0.097562415

# 1b. (1) What is the mean of your test data?
mean(ExponentialSample) # [1] 0.3819106

# 1c. (1) What is your estimate lambda.hat?
LambdaHat <- 1 / mean(ExponentialSample)
LambdaHat # [1] 2.618414

# 1d. (1) Generate the upper and lower limits of the confidence region using the formula 
# given above.  Give your code and the limits it  produced below.
CIlow <- LambdaHat - qnorm(0.975) * LambdaHat / sqrt(n)
CIlow # [1] 2.105214
CIhigh <- LambdaHat + qnorm(0.975) * LambdaHat / sqrt(n)
CIhigh # [1] 3.131613
CI <- paste0("Confidence Interval = [", CIlow, ", ", CIhigh, "]")
CI # [1] "Confidence Interval = [2.10521405461703, 3.13161336896409]"

############################################################################################

### 2. Now suppose we are not using the maximum likelihood estimate for lambda, or we do not 
# want to use the asymptotic distribution to form our confidence intervals as we did above. 
# We could use the bootstrap to estimate the distribution of lambda.hat and create bootstrap 
# confidence intervals for lambda.

### 2a. (1) Form a set of bootstrap estimates of our parameter by generating B random samples 
# as you did once in 1a but use lambda.hat since we do not know the true lambda in this case 
# (keep n=100). Set B=1000, and again set your seed.
set.seed(50)
Lambda = 3
n = 100
B = 1000
ExponentialSample <- rexp(n=n, rate=Lambda)
LambdaHat <- 1 / mean(ExponentialSample)

### 2b. (1) Get a new estimate for lambda.hat from each of the bootstrap samples in 2a. 
# You'll want to create a matrix to receive each value. You should have 1000 estimates for 
# lambda.hat now.
set.seed(50)
BootstrapSample <- matrix(nrow=B, ncol=1)
for (i in 1:B)
  {
  BootstrapSample[i] <- 1 / mean(rexp(n=n, rate=LambdaHat))
  }
head(BootstrapSample)
#          [,1]
# [1,] 2.285363
# [2,] 2.529823
# [3,] 3.018889
# [4,] 2.491027
# [5,] 2.481049
# [6,] 2.408687
tail(BootstrapSample)
#              [,1]
#  [995,]  2.590934
#  [996,]  2.604237
#  [997,]  2.557797
#  [998,]  2.569846
#  [999,]  2.626410
# [1000,]  2.257958

### 2c. (2) Now look at the sampling distribution for lambda.hat, using the hist function. 
# Remember your graphing techniques to make the plot look professional.
# Does the distribution look normal?
setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 5")
png ("HW5_hist.png", height=600, width=800)
require(ggplot2)
require(ggthemes)
p <- ggplot(data=data.frame(BootstrapSample), aes(x=BootstrapSample))
p + xlab("Bootstrap Samples") + ylab("Count") +
  ggtitle("Sampling distribution for Lambda Hat") + 
  geom_histogram(fill = "lightblue", color="darkgrey", binwidth=.05) +
  theme_economist() + scale_color_economist() 
dev.off()
# The sampling distribution for Lambda Hat is quite simmetrical  

### 2d. (1) Find the quantiles of the sampling distribution you created, for a 5% region.
Quantiles <- quantile(x=BootstrapSample, probs=c(0.025, 0.975))
Quantiles
#     2.5%    97.5% 
# 2.180779 3.248000 

### 2e. (1) Calculate the bootstrap confidence interval boundaries, lower and upper.
CIbootstrapLOW <- 2 * LambdaHat - Quantiles[2]
CIbootstrapLOW
#    97.5% 
# 1.988828 
CIbootstrapHIGH <- 2 * LambdaHat - Quantiles[1]
CIbootstrapHIGH
#     2.5% 
# 3.056049 
CIbootstrap <- paste0("Confidence Interval = [", CIbootstrapLOW, ", ", CIbootstrapHIGH, "]")
CIbootstrap 
# [1] "Confidence Interval = [1.9888277812459, 3.05604860645945]"

### 2f. (1) Calculate an estimate of the standard error of lambda.hat using your
# collection of bootstrap estimated parameters. What is your confidence interval?
SEbootstrap <- sqrt(var(BootstrapSample))
SEbootstrap
#           [,1]
# [1,] 0.2699522
CIbootstrapLOW_SE <- LambdaHat - qnorm(0.975) * SEbootstrap
CIbootstrapLOW_SE
#          [,1]
# [1,] 2.089317
CIbootstrapHIGH_SE <- LambdaHat + qnorm(0.975) * SEbootstrap
CIbootstrapHIGH_SE
#         [,1]
# [1,] 3.14751
CIbootstrap_SE <- paste0("Confidence Interval = [", CIbootstrapLOW_SE, ", ", CIbootstrapHIGH_SE, "]")
CIbootstrap_SE 
# [1] "Confidence Interval = [2.08931714778768, 3.14751027579344]"

############################################################################################

### 3a. (5) We made some decisions when we used the bootstrap that we can now question. 
# Repeat the above creation of a confidence interval for a range of values of data
# (we had our sample size fixed at 100) and a range of bootstrap values (we had B 
# fixed at 1000). Suppose the sample size varies (100, 200, 300, .... , 1000) and 
# B varies (1000, 2000, ... , 10000). You will likely find it useful to write
# functions to carry out these calculations. Your final output should be 
# upper and lower pairs for the confidence intervals produced using the bootstrap
# method for each value of sample size and B.

###########################################
### REPLICATE - B is a range, n is a range
###########################################

rm(list=ls()) # empty environment
set.seed(50) # set the seed
Lambda <- 3 # lambda stayes the same
n <- seq(from=100, to=1000, by=100) # create ranges for n
B <- seq(from=1000, to=10000, by=1000) # create ranges for B

MYrate <- matrix(rep(NA, length(n)), nrow=length(n)) # create empty matrix for the exponential rate
for (i in 1:length(n)) { MYrate[i] = 1 / mean(rexp(n=n[i], rate=Lambda)) }

BootstrapSampleReplicated <- matrix(rep(NA, length(B))) # create empty matrix for the replicated sample
for (i in 1:length(n)) { 
  for (j in 1:length(B)) {
    BootstrapSampleReplicated[[j]][i] = list(matrix(replicate(n=B[j], 
             expr = 1 / mean(rexp(n=n[i], rate=MYrate[i]))), nrow=B[j], ncol=n[i]))
  } }

Quantiles <- matrix(data=rep(NA, length(B)), nrow=length(B)) # create empty matrix for quantiles
CIbootstrapLOW <- matrix(data=rep(NA, length(B)), nrow=length(B)) # create empty matrix for LOW CI
CIbootstrapHIGH <- matrix(data=rep(NA, length(B)), nrow=length(B)) # create empty matrix for HIGH CI
BootstrapMean <- matrix(data=rep(NA, length(B)), nrow=length(B)) # create empty matrix for means
for (i in 1:length(n)) { 
  for (j in 1:length(B)) {
    BootstrapMean[[j]][i] = list(matrix(mean(x=BootstrapSampleReplicated[[j]][[i]])))
    Quantiles[[j]][i] = list(quantile(x=BootstrapSampleReplicated[[j]][[i]], probs=c(0.025, 0.975)))
    CIbootstrapLOW[[j]][i] = list(2 * MYrate[i] - Quantiles[[j]][[i]][2])
    CIbootstrapHIGH[[j]][i] = list(2 * MYrate[i] - Quantiles[[j]][[i]][1])
  } } 

# Chech the results of the function above: 
as.vector(unlist(CIbootstrapLOW))
#  [1] 1.986545 2.635199 2.505384 2.480468 2.826240 2.763281 2.803264 2.620883 2.883102 2.789076
# [11] 2.003785 2.636515 2.480744 2.467398 2.830230 2.758654 2.798724 2.628920 2.876679 2.779984
# [21] 2.009487 2.679514 2.451599 2.476486 2.818324 2.755846 2.792683 2.628596 2.871185 2.781769
# [31] 2.017888 2.661881 2.470259 2.485204 2.824473 2.759339 2.803251 2.620598 2.876569 2.777232
# [41] 2.027150 2.657645 2.471082 2.474628 2.820270 2.760637 2.814686 2.622272 2.878648 2.780272
# [51] 2.009668 2.658802 2.468379 2.482124 2.817625 2.752645 2.806668 2.622519 2.877598 2.787776
# [61] 2.027593 2.676032 2.486420 2.477408 2.825421 2.751595 2.803050 2.625347 2.877303 2.786079
# [71] 2.024391 2.667623 2.458824 2.474019 2.820255 2.756588 2.806970 2.622115 2.877307 2.780078
# [81] 2.015584 2.659922 2.468540 2.476923 2.812704 2.759499 2.793750 2.623532 2.873793 2.783029
# [91] 2.015696 2.660640 2.483003 2.477945 2.812919 2.757560 2.805365 2.623659 2.880907 2.782027

as.vector(unlist(CIbootstrapHIGH))
#  [1] 3.049461 3.567741 3.122782 3.011634 3.358161 3.236316 3.239840 3.020594 3.297145 3.131194
# [11] 3.052979 3.542191 3.098254 3.023079 3.377703 3.251290 3.264456 3.018622 3.280023 3.157135
# [21] 3.069617 3.563988 3.107917 3.033613 3.366236 3.250890 3.262740 3.020017 3.285120 3.158241
# [31] 3.078122 3.555854 3.114639 3.022662 3.371644 3.242352 3.264937 3.019423 3.282091 3.153807
# [41] 3.058587 3.553164 3.115703 3.018532 3.356333 3.233319 3.262803 3.016303 3.283671 3.150580
# [51] 3.069751 3.545083 3.111327 3.022979 3.361709 3.237856 3.250910 3.022084 3.277872 3.159981
# [61] 3.070184 3.547006 3.120459 3.023573 3.364095 3.245456 3.250926 3.019939 3.277539 3.156815
# [71] 3.064284 3.546784 3.105747 3.012454 3.367767 3.237682 3.257096 3.020379 3.280536 3.154530
# [81] 3.048408 3.544517 3.110716 3.023032 3.363204 3.238108 3.246711 3.020574 3.278025 3.154524
# [91] 3.059454 3.551050 3.103504 3.026446 3.364632 3.241173 3.251891 3.015696 3.280968 3.153879

### 3b. (2) Plot your CI limits to show the effect of changing the sample size and 
# changing the number of bootstrap replications. What do you conclude?

MyDataFrame <- data.frame(x = 1:length(unlist(BootstrapMean)), 
                          y = unlist(BootstrapMean), 
                          LowCI = unlist(CIbootstrapLOW), 
                          HighCI = unlist(CIbootstrapHIGH),
                          n = c(rep(100, 10), rep(200, 10), rep(300, 10), rep(400, 10), rep(500, 10), 
                                rep(600, 10), rep(700, 10), rep(800, 10), rep(900, 10), rep(1000, 10)),
                          B = c(rep(seq(from=1000, to=10000, by=1000), 10)) )
require(ggplot2)
require(ggthemes)

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 5")
png ("HW5_plot1.png", height=700, width=1000)
ggplot(MyDataFrame, aes(x = x, y = y, color = factor(n))) +
  geom_point(size = 1.5) + ylab("Confidence Intervals") + xlab("") + 
  ggtitle("Confidence Intervals as the sample size and bootstrap replications change") +
  geom_errorbar(mapping=aes(ymax = HighCI, ymin = LowCI)) +
  labs(color="Sample Size") +
  theme_economist() + scale_color_economist(10) 
dev.off()

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 5")
png ("HW5_plot2.png", height=700, width=1000)
ggplot(MyDataFrame, aes(x = x, y = y, color = factor(B))) +
  geom_point(size = 1.5) + ylab("Confidence Intervals") + xlab("") + 
  ggtitle("Confidence Intervals as the sample size and bootstrap replications change") +
  geom_errorbar(mapping=aes(ymax = HighCI, ymin = LowCI)) +
  labs(color="Bootstrap Replication") +
  theme_economist() + scale_color_economist(10) 
dev.off()

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 5")
png ("HW5_plot3.png", height=700, width=1000)
ggplot(MyDataFrame, aes(x = x, y = y, color = factor(n))) +
  geom_point(size = 1.5) + ylab("Confidence Intervals") + xlab("") + 
  ggtitle("Confidence Intervals as the sample size changes 
          ploted separately for each size of the bootstrap replication") +
  geom_errorbar(mapping=aes(ymax = HighCI, ymin = LowCI)) +
  labs(color="Sample Size") + facet_wrap(~B) +
  theme_economist() + scale_color_economist(10) 
dev.off()

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 5")
png ("HW5_plot4.png", height=700, width=1000)
ggplot(MyDataFrame, aes(x = x, y = y, color = factor(B))) +
  geom_point(size = 1.5) + ylab("Confidence Intervals") + xlab("") + 
  ggtitle("Confidence Intervals as the bootstrap replications change
          ploted separately for each sample size") +
  geom_errorbar(mapping=aes(ymax = HighCI, ymin = LowCI)) +
  labs(color="Bootstrap
       Replication") + facet_wrap(~n) +
  theme_economist() + scale_color_economist(10) 
dev.off()

setwd("~/Desktop/APPLIED DATA MINING/Homework/Homework 5")
png ("HW5_plot5.png", height=700, width=1000)
ggplot(MyDataFrame, aes(x = x, y = y)) +
  geom_point(size = 1.5) + ylab("Confidence Intervals") + xlab("") + 
  ggtitle("Confidence Intervals plotted separately for 
          each sample size and bootstrap replication") +
  geom_errorbar(mapping=aes(ymax = HighCI, ymin = LowCI)) + facet_grid(n~B) +
  theme_economist()
dev.off()

# As we increase the Bootstrap replications the confidence intervals decrease
# We can observe a dramatic decrease in confidence levels between 1000 and 4000 replications,
# however, after 4000 replication we have diminishing returns when we increase the
# number of replications we perform
# The increase in sample size does not have that much effect on the size of the confidence
# intervals

############################################################################################