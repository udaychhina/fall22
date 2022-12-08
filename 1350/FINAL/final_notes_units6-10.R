#shanti stein-gagnon
#Math final notes

###DATA###

#turn off sci: options(scipen=999)



###Get the file

#just go to the import file

#import a txt file:
#library(readxl)
#data <- read.delim("full path to file")

##Read CVS (with a header)
#setwd("C:/Users/fishf/OneDrive/Desktop/MATH_FINAL/FINAL/data")
#data <- read.delim("data.txt",header=TRUE,stringsAsFactors=TRUE,
#                   sep=",")
#data

#Read an Excel
#library(readxl)
#setwd("C:/Users/fishf/OneDrive/Desktop/MATH_FINAL/FINAL/data")
#data_excel <- read_excel("data.xlsx")
#data_excel


###Working with files:

#remove any points where Age or Income.Goal are missing
#data <- subset(data,
#               !is.na(Age) & 
#                 !is.na(Income.Goal))

#X rows were a condition from T row matches:
#new <- with(data, X[T == "Internal Combustion"])

#rows that meet a certain condition:
#data$Owns.Car[data$Age == "17"]


###general data manipulation
#generate a list of repeated values: rep(number, numbers) or rep(1, 3) = c(1,1,1)
#Seq(start, end, increment)
#c(1,2,3)
#data$Attribute
#n <- length(data$Attribute)
#n <- nrow(data$Attribute)
#sum(data), mean(data), sd(data), median(data) <-- this is also Q2
#roll dice: sample(1:6, numberToReturn, replace=FALSE)
#get the subset of data: with(data, attribute)



########################
#    R stuff zone      #
########################

#Binomial Distribution (these are not normally distributed and not lambda):
#P(X = y): dbinom(y,n,p)
#P(X > y): 1-pbinom(y,n,p)
#P(X < y): pbinom(y-1,n,p)
#P(X <= y): pbinom(y,n,p)
#P(X >= y): 1-pbinom(y-1,n,q)

#Lambda is for occurrences in an interval
#lambda = k/n where k = total number of successful events n = sample space
#example: 1 call every 5 minutes: lambda= 1/5
#mean=lambda, sd=sqrt(lambda)
#P(X = y): dpois(y, lambda)
#P(X > y): 1-ppois(y, lambda)
#P(X < y): ppois(y-1, lambda)
#P(X <= y): ppois(y, lambda)
#P(X >= y): 1-ppois(y-1, lambda)

#Normally Distributed Values:
#P(X = y): 0, always 
#P(X > y) and P(X >= y): 1-pnorm(X, mu, sd)
#P(X < y) and P(X <= y):  pnorm(X, mu, sd)

#calculate the percentile (this will be the x value)
#5%: qnorm(0.05, mu, sd)

#find not independent selections:
#n= sample size, N = Population size
#P(X = y): choose(N, (n-y)) * choose(n, y) / choose(N, n)

#T values and Mu test
#t <- (1-a/2, df=n-1)
#note that these will return confidence levels if used without the alternative
#One data set: t.test(data, mu=0, alternative = "greater"/"less"/"two.sided", conf.level=.95)
#Two data sets: t.test(data.1, data.2, Alternative="two.sided", conf.level=0.95)

#Find the Z values and P test
#two data points: prop.test(c(data.1, data.2), c(n1, n2), correct = FALSE)  
#One data point:prop.test(x.successes, x.length, p=0, alternative="two.tailed", correct=FALSE)
#Z (as a test statistic):
#   pbar <- (x1+x2)/(n1+n2)
#   z <- (phat1-phat2)/sqrt(pbar*(1-pbar)/n1+pbar*(1-pbar)/n2)
# can make this into a P.value: 2*pnorm(z)

#Linear Correlation coefficients:
#r <- cor(data.X, data.Y)
#rTest <- cor.test(data.X, data.Y)


#Linear Relation:
#lm(Y~X)= a = (intercept) and b = (1 increase of x)
#lm(Y~X1+X2...)
#Yhat <- a + b*x


#t values:
#pt(t) will return the p value of t
#qt(1-a/2, df) will be the subscript value of t converted (E values use these)

########################

#descriptive statistics:
#describe a data set
#summaries data into a few representative values

##########
# UNIT 6 #
##########



###UNIT 6: Vocab###

##Inferential Statistics:
#A type of statistics where we attempt to draw general conclusions using limited data

##Random Sampling:
#Cluster: select based on pre-determined groups, often areas (using by desk group)
#Stratified: strategically select a sub sample for each sample (one person from each desk group)
#Systematic: select every nth person, and loop back if needed (every second person on the class list)
#Self-Selected: voluntary (BAD!!)
#Random Sampling: just random, all samples have the same chance to occur (BEST)
#to get a random sample do:
#sample(data, number_to_get, replace=FALSE/TRUE)


##Central Limit Theorem (CLT):
#As the sample size increase the shape of the sampling distribution of x-bar 
#becomes more normal (see xbar sampling distribution)
#as n increase it will get narrower, closer to normal, and unchanging center


###UNIT 6: Formulas and Symbols###

##Population Measurements
#N:         Population Size
#N in R     length(data)
#P:         Proportion
#P in R     successes/population size
#Mu:        mean(data)
#S:         population SD (note that )
#S in R:    sqrt((n-1)/n) * sd(data)
#Variance: (sqrt((n-1)/n) * sd(data))^2

#Sample Measurements:
#n:     sample size: length(data)
#p-hat: Sample Proportion (x/n)
#x-bar  mean proportion mean(data)
#sd:    standard deviation sd(data)

#Summary P-hat statistic:
#If n*p >= 5 AND n*q >= 5, P-hat is normal
#Z = (phat- P) / (sqrt(p*q/n))
#the mean of p-hat = p
#the sigma of p-hat = sqrt(p*q/n)

#Exact phat:
#P(p-hat = X): dbinom(n*X, n, p)
#P(p-hat > X): 1-pbinom(n*X,n,p)
#P(p-hat < X): pbinom(n*X-1,n,p)
#P(p-hat >= X): 1-pbinom(n*X-1,n,p)
#P(p-hat <= X): pbinom(n*X, n, p)

# Mean of P-hat
# mean= p

#Standard Distribution of P-hat:
# sd= (sqrt(p*q)/n))

# P-hat Approximation of a Normal Distribution Conditions:
# n*p >= 5
# n*q >= 5

# Phat Z-statistic approximation:
# If  Phat normal holds then Z=(p_hat - mu_phat / sd_phat) 
# will be approximately normal

#Normal Approximation p-hat calculation:
#example: P(phat <= .68) ~= pnorm(.68, mean=p, sd=(sqrt(.6*.4/100)))
#P(X = y): 0
#P(X <= y) OR P(X < y): pnorm(y, mean=p, sd= (sqrt(p*q)/n)))
#P(X > y) OR P(X >= Y): 1-pnorm(y, mean=p, sd=(sqrt(p*q)/n)))


#Continuity Correction:
#Same as normal approximation, however we correct for class boundaries
#this means we + or - .5 usually
#think of it like starting from the actual boundaries on a hist



# Sampling Distribution of Xbar (sample mean):
# normal if n >= 30 OR X is normal
# Xbar created from a randomly selected sample will
# create the sampling distribution of Xbar
# as n increases Xbar becomes narrower, closer to normal, center is unchanging


#Mu of X-bar:
#Average of all possible X-bar values is the same as the average of all X values
#the mu of X-bar = mu

#Normal Approximation of X-bar:
#check that mu is normal first
#pnorm(y, mean=mu, sd = (sigma/sqrt(n)))

#Sigma of X-bar:
#sigma / sqrt(n)
#sigma X-bar is always less than sigma X

#Mean t statistic:
#if either the X is normal OR n >= 30 then:
# t = (X-bar - mu of X-bar / sd of X-bar)


##normal approximation of sampling distributions:
#X-bar conditions: X is normal OR n >= 30
#P-hat: n*q >= 5 AND n*p >= 5


#Z of a normal sample:
#phat z = (phat - p) /(sqrt(p*q/n))
#mu z = (Xbar - mu) / (sigma/sqrt(n))





################
###  UNIT 7  ###
################

### General Vocab ###


##Biased/Unbiased Estimation:
#The characteristic of the mean of large amounts of sample data does not accurately represent the outcomes of the population data.
# For example, on average Median (Q2) is a biased sample value as higher numbers than the population median are more likely to occur.



## A list of population parameters and the corresponding point estimator:
# Mean: mu is estimated with X-bar (unbiased)
# Variance: sigma^2 is estimated with s^2 (unbiased)
# Standard Deviation: Sigma is estimated with s (biased)
# Proportion: P estimated with p-hat (unbiased)
# Difference in means: mu2 - mu1 is estimated with X-bar2 - X-bar1 (unbiased)
# Difference is proportion: p1 - p2 is estimated with p-hat1 - p-hat2 (unbiased)
# Median: sample median is biased for higher values


##Confidence Intervals General:
# A range of values that is likely to contain the true value of the population parameter
# Point estimates are the center of the interval
# The distance from the center to each endpoint is called a margin of error
# ??? | - x - | ??? 
# The center here would typically be X-bar with the endpoints being +/- E
# The lower limit is on the left and the upper limit is to the right


##Population Parameter:
# The measurement that we are attempting to determine in a confidence interval
# often P or Mu



## Point Estimation:
# point estimates are values determined with sample data that are used
# to estimate an understanding of population data.
# the best estimation of mu is xbar, the best estimation of sigma^2 is s^2


## Confidence Level (Interval estimation):
# 1-a
# Z[a/2]
# the percentage that determines the likelihood of error in a confidence interval or
# hypothesis test


### FORMULAS/SYMBOL Index ###

# find the standard normal variable Z:
# to find this for Z do a=1-level
# Z[a/2] = qnorm(1-a/2)
# 95% = 1.96
# 90% = 1.6449
# P(-z[0.025] <= Z <= z[0.025]) = 1.96
# this means there is a 95% probability that -1.96 < z_phat < 1.96
# and -1.96 < (x_bar - mu) / (sigma/sqrt(n)) < 1.96

## Population Variance: Sigma^2:
# (sqrt((n-1)/n) * sd(data))^2

## sample Variance: s^2:
# var(data)

## Lower limit:
# Central Point (either phat or xbar) - E

## Upper Limit:
# Central Point + E

## Measurements of Xbar:
# mean_xbar = mu
# sigma_xbar = sigma/ sqrt(n)
# Z = (X-bar - Mu)/ (sigma/ sqrt(n))

#E of xbar (known sigma):
#e_xbar <- qnorm(1-a/2) * (sigma / sqrt(n))

## Measurements of P_hat:
# mean_phat = population p
# sigma_phat = sqrt(p*q*n)

#E of Phat
# E_phat <- qnorm(1-a/2) * (sqrt(phat * qhat / n))

## Confidence Interval: a:
# 1- alpha = Interval
# a = 1-Interval

## Critical Z-value: Z(alpha/2)
# this number will always be positive. If it's negative make it positive
# a = 1 - conf.level
# z[a/2] = qnorm(1-a/2)
# A critical z value is the number separating sample statistics
# That are likely to occur from those that are unlikely to occur
# Written with Z and a numerical proportion as a decimal subscript
# We can find the value of critical Z with the table
# 90% = 1.6449
# 95% = 1.96


## t Statistic: t:
# the formula to identify the t statistic is (X_bar - mu)/(s/sqrt(n))
# with df = n-1
# the shape of this follows a t distribution (shorter fater, depends on n)


## Critical T value:
# we can get the critical t value with tz/2 = qt(1-a/2, df=n-1)
# these will be exchanges with the z value in a confidence test
# E <- qt(1-a/2, df=n-1) * (s/sqrt(n))


## Using T distributions to find Confidence Intervals of Mu:
#  use t instead of Z if sigma is unknown and we only have s
#  X-bar - ta/2 * (s/sqrt(n)) < mu < x-bar + ta/2 * (s/sqrt(n))


## Margin of Error: E
# (X_bar): Can be found with a T-score and s: E <- qt(1-a/2, df=n-1) * (s/sqrt(n))
# (X_bar): with a Z_score and Sigma: E <- qnorm(1-a/2) * (sigma/sqrt(n))
# (P_hat): Z-score and s: qnorm(1-a/2) * (sqrt(p*q/n))

## Determine n before the gathering of data:
# n = ( qnorm(1-a/2)  * sigma/E)^2
# We will need to estimate sigmas value (pop std.dev)
# Always round up or use the pessimistic approach of 0.5
# 1-a = the desired confidence level
# E = the desired margin of error




################
###  Unit 8  ###
################

#turn off sci: options(scipen=999)

### VOCAB AND GENRAL UNIT 8

#Hypothesis:
#a claim about a population parameter (mu or P)

#Hypothesis Steps:
#Step 0: gather sample data (n,p-hat,x-bar,|x|,s)
#Step 1: write hypothesis (find parameter type P/mu, h0, h1, point to the claim)
#Step 2: find test statistic (P is z and Mu is t)
#Step 3: convert to P.value (must be normal, right tail: > left: < two:!=)
#Step 4: write conclusion

#Tails:
#left tail: H1 < (this is the default)
#right tail: H1 > (1- converted test statistic)
#two tailed: H1 != (default*2)

#Significance Level:
#the default is 5%, denoted "a"
#this represents what we consider unlikely
#if the P.value is below this, null is rejected

#Null hypothesis:
#H0, the assumed hypothesis that always contains equality
# == >= <=

#Alternative hypothesis
#the inverse of the null hypothesis, contains inequality
# != > <

#Type 1 Error:
#when a true null hypothesis is rejected
#alpha = P(type 1 error)
#so if we have a 90% significance level than there is a 10% chance we reject a true null
#avoid by making "a" bigger or larger sample

#Type 2 Error:
#when a false null is accepted
#beta = P(type 2 error)
#avoid by making "a" bigger or larger sample

#Conclusions:
#(claim H0)Reject H0: "There is sufficient evidence to reject the claim that ..."
#(claim H0)Accept H0: "There is not enough evidence to reject the claim that..."
#(claim H1)Reject H0: "There is sufficient evidence to support the claim that..."
#(claim H1)Accept H0: "There is insufficient evidence to support the claim..."

### FORMULAS AND SYMBOLS UNIT 8

#Z (for hypothesis P):
#Z = (p-hat - null P) / sqrt(null P* (1-null P) / n)

#T (for hypothesis Mu):
#T = (x-bar - null Mu) / ( s / sqrt(n) )
#note that s/sqrt(n) is standard error

# Assuming the test statistic is normal:
# there are a list of criteria
# for Z:
# first verify that n*p >= 5 AND n*q <= 5
# the sample must be a simple random sample
# when there are two samples these conditions must hold for both
# for T:
# or for mu: X is normal or n >= 30
# these must be true for both samples if comparing data


#P-value of Z tails (P):
#left: pnorm(z) 
#right: 1-pnorm(z)
#two (negative z): pnorm(z)*2
#two (positive z): (1-pnorm(z))*2

#P-value of T tails (Mu):
# left: pt(t, n-1)
# right: 1-pt(t, n-1)
# two tailed (negative t): pt(t, n-1)*2
# two tailed (positive t): (1-pt(t, n-1))*2

###one Mu t-test
#t.test(data$Attribute, mu=0, conf.level=0.95, alternative="greater"/"less"/"two.tailed")
#note that mu here will be the null and the h2 will be the alternative


#One P prop.test:
#prop.test(x,n, alternative = "two.sided, less, greater", conf.level= .95, correct=FALSE)










############
###Unit 9###
############



###General for unit 9

#Writing Claims:
#difference of two population proportions: 
  #p1 - p2 = 0 (p1 and p2 are equal)
  #p1 - p2 > 0 (p1 is larger than p2)
  #p1 - p2 < 0 (p2 is larger than p1)


#Step by Step 2 proportion test:
#Step 0 (sample data): 
  #n1, n2, x1, x2, p-hat1, p-hat2, s1,s2 (only a few may be needed)
#Step 1 (Hypotheses):
  #H0: equality
  #H1: reversed H0 inequality 
  #(mark the claim and the h1 tail)
#Step 2 (Test Statistic):
  #determines how extreme the observed difference is
  #for P use Z
  #first find p-bar: (x1+x2)/(n1+n2)
  #Z <- ((phat1 - phat2) - (p1 -p2)) / sqrt(pbar * (1-pbar) * (1/n1 + 1/n2))
  #for the (p1 - p2) part, substitute the p given by null (this is often zero for both)
#Step 3 (P-value):
  #determine the tail first
  #left: pnorm(z)
  #right: 1 - pnorm(z)
  #two: pnorm(z)*2
#Step 4 (conclusion):
  #if p is low null must go
  #check unit 8 or answer sheet for how to write a conclusion


  
###Formulas for unit 9


#P-bar:
#the pooled proportion, 
#pbar = (x1+x2)/(n1+n2)
#qbar is 1-pbar


#Z for P test statistic:
#Z = ( (phat1 - phat2) - (p1 - p2) ) / sqrt( (p-bar * (1-p-bar)) * (1/n1 + 1/n2) )

#P-value for a P test statistic:
#determine the tail first
#left: pnorm(z)
#right: 1 - pnorm(z)
#two: pnorm(z)*2

#true.data <- subset(data, Column="True")
#this will make a new data from where all the rows that match the Column are True

#nrow(data$Sample)
#returns the number of rows

#length(data$Sample)
#returns the number of entries in an array

#prop.test for two value P comparisons:
#prop.test(c(x1, x2), c(n1, n2), alternative = "two.sided, less, greater", correct=FALSE)

# Z value test statistic for two parameters:
# ((phat1 - phat2) - (p1 -p2)) / sqrt(pbar * (1-pbar) * (1/n1 + 1/n2))

#E of two p values:
#qnorm(1-a/2) * sqrt( (phat1 * phat1 / n1) + (phat2 * phat1 /n) )

#central point of two p values:
#this will be used to +/- E in a confidece interval
#used to determine range of possible P values


#t.test for two values of Mu:
#t.test(data_X, data_Y, alternative="greater")
#note that you can set the conf.level=0.95 and the mu=0

#T value of two mu:
#t <- ((xbar1 - xbar2) - (mu1 - mu2)) / sqrt( (s1^2 /n1) + (s2^2 / n2))
#note that if mu (the null hypothsis) is 0 then you can do
#t.1 <- (((xbar1.1 - xbar2.1) - 0 )/ sqrt((s1.1^2)/ n1.1 + (s2.1^2)/n2.1))

#P-value of two mu:
#df will be using the smallest n here
#p.value <- qt(t, df=min(n1-1, n2-1))
#remember to alter the value based on the tail

#E of two mu values:
#qt(1-a/2, n-1) * sqrt( (s1^2 /n1) + (s2^2 /n2))

# Central point of two mus:
# Xbar1-Xbar2
# use this with a E value +/- for the conf interval by hand



#mean of paired samples test
#t.test(data.x, data.y, paired = TRUE, alternative = "two.sided")
#d <- df$Mass.KG.2021 - df$Mass.KG.2020
#t <- (d.bar - 0)/(s.d / sqrt(n.d))
#P.value <- 1-qt(t,n.d-1)





















############
## UNIT 10##
############


###UNIT 10 VOCAB###

##Linear Regression Model or "line of best fit":
#draw with abline( lm(X~Y) )
#the line (that can be draw on a scatter plot) that shows the inclination of the data

##Scatter Plot:
#a plot of X-Y related dots on a chart
#plot(X, Y, pch=15)

##Correlation:
#r or rho is used to determine linear correlation
#data is correlated if the p-value of a cor.test(X, Y) is below 0.05

##Linear Regression:
#Y-hat = a+b*x is used to determine linear regression
#linear regression can also invlove more than on b*x value
#for one b*x value: lm(Y~X)
#for more than one: lm(Y~X1+X2+X3) 
#note that the x and y values here are data lists



###UNIT 10 FORMULAS###

##Linear Correlation Coefficient:
#r = cor(X, Y) or cor.test(X, Y)
#note that the X and Y here are data list samples
#r is for the sample, rho (P) is used for the population
#this number will ALWAYS be 1<= r >= -1 (if it's not you did something wrong)
#it only measures the linear relationship (other relationships may exist that we can't find with this)
#r will not change if the unit values change (like cm instead of inch)
#r does not care about the order of the pairs (X, Y) is the same as (Y, X)
#just for looking at a value, if it's like this / it will be positive
#if it's like this \ it's negative
#it it's all over the place it will be 0


# Hypotheses T-test for r:
# these have set hypotheses unless otherwise stated
# H0: p = 0 <- no correlation of the population
# H1: p != 0 <- non-zero correlation, claim, two tailed

# T test for r:
# t = r / sqrt( (1-r^2) / n-2 )

# P_value of t:
# REMEBER df - 2 here
# if t is negative: 2*( qt(t, n-2) )
# if t is positive: 2*(1-qt(t,n-2))
# remember that a small p value means the data is correlated

#Linear Model:
#lm(X~Y)
#read about it in the section below
#can use to predict the value of x
#Y-hat <- a + b*x
#a is the intercept, b is the value of 1 increase of X
#find a and b with lm(Y~X), then x is the independent variable
#for example if we wanted to find weight of someone who was 60inch we would do:
#lm(data.weight~data.height), then Yhat <- a + b*60
#can also do this with multiple values: lm(Y~X1+X2) ; Yhat <- a + b1*x1 + b2*x2 ...
#draw these to a scatter plot as a line with abline( lm(X~Y) )


##Hypothesis test for Rho:
#this will determine if the result is statistically significant
#on the exam just do cor.test(data.X, data,Y)   
#very fast :) otherwise you can suffer this:
#CLAIM: H0: rho == 0     H1: rho != 0
#T-TEST: t <- r/ ( sqrt((1 - r^2) / (n-2)) )
#P-VALUE: (!Importaint! the df=n-2 here)
#         if t is positive: 2*(1-pt(t, df=n-2))
#         else: 2*pt(t, df=n-2)



# Bonus stuff:
#   Draw non-linear lines: nlc
# exp(x) returns ex 
# Get these:
#   #import data
#   X <- c(1,2,5,6)
# Y <- c(1,2,3,7)
# #draw the model
# Exp.model <- nls(Y~A*exp(B*X), start=list(A=1, B=0.5))
# #pull out the data
# #coef only works for non-linear while coefficient() works for linears
# A <- coef(exp_reg)[["A"]]
# B <- coef(exp_reg)[["B"]]
# 
# #draw the data
# X <- dates
# Y <- A*exp(B*dates)
# lines(x,y, type="l", col="blue")
# To find the value of x with a known value of y:
#   X <- log(yValue/ A)/B















