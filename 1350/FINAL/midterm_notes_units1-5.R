####### MIDTERM ######
# Shanti Stein-Gagnon
#Math 1350: TOTAL NOTES


#options(scipen=999)

#NOTE: this is not to be run, mostly quick codes and notes
#copy paste this stuff into a working files as needed
#use help(function name) to check how to use things

#import files (WILL BE ON TEST)
library(readxl)

#set working directory
setwd("./")

#read Excel data
data <- read_excel("FILENAMEHERE.xlsx")

#if the file has a name field add skip = 1 attribute to the read_excel()



###########
##R NOTES##
###########
#the functions that will make your life better zone


##NORMAL DISTRIBUTIONS
#P(X < 5) OR P(X <= 5)
#pnorm(X, mean, sd)


#P(X > 5) OR P(X >= 5)
#1-pnorm(X, mean, sd)

#calculate the probability density at X = y
#X = dnorm(y,mean,sd)


#find the percentile probability:
#qnorm(percentile as a decimal, mu, sigma)




##BINOMIAL DISTRIBUTIONS

#calculate P(X = x) of a Binomial Distribution with:
#dbinom(x,n,p)
#this will be the output of P(X=x) = (nCx)*p^x*q^(n-x)



#Calculate P(X <= x) of a Binomial Distribution with:
#pbinom(x,n,q)


#Calculate P(X > x) of a Binomial Distribution with:
#1-pbinom(x,n,q)

#Calculate P(X >= x) of a Binomial Distribution with:
#1-pbinom(x-1,n,q)




###POISSON DISTRIBUTIONS

#find P(X <= y)
#ppois(y, lambda)

#find P(X > y)
#1 - ppois(y, lambda)

#P(X = x):
#dpois(x, lambda)

#P(X >= x)
#ppois(x-1, lambda)




###For a hybrid system
#two parallel connected with a series
#F = (Fa Intersect Fb) Union (Fc Intersect Fd)
#P(Fa)xP(Fb) + P(Fc Intersect Fd) - P((Fa Intersect Fb) intersect (Fc Intersect Fd))
#P(Fa)*P(Fb) + P(Fc)*P(Fd) - (P(Fa)*P(Fb)*P(Fc)*P(Fd)) 
#find the complement of everything and multiply


##Find cards without replacement loop
# x.vals <- 0:4
# 
# for (i in 1:length(x.vals)){
#   p.of.x <- (choose(4,x.vals[i])*choose(48, (5-x.vals[i])))/(choose(52,5))
#   print(p.of.x)
# }

# Birthday Problem:
# To calculator 2 birthdays for n number of people 
# N = people in the room
# 1 - 365Pn/365^n



###############
### UNIT 1  ###
###############




######Tables

# Histograms = hist(file$arribute, attribute = "value")
# Bar = barplot(table(file$arribute)
# Pie = pie(table(file$arribute)


###HISTOGRAMS#####

# hist(data, xlab="this is the x", ylab="this is the y",
#      main="look at this tile", breaks=seq(0,100,10))

#Set breaks with breaks=c(1,2,3,4,5) OR breaks=seq(1,5,1)
#The seq function does seq(start, end, increment)
#The c function will take the given breaks as listed
#Xaxp = c(start, end, ticknumbers) is use to make ticks

#Pie charts are not recommended (can't see numbers and compare exact values)
#use bar charts by default



#freq = FALSE for relative freq (density)




####Vocabulary#####

##Variable (grid data term) = X
#a column name, an attribute such as age that we can record about an individual


##Individual (grid data term)
#set of variables all grouped together, such as a person, 
#theses are the rows


##Population = N
#The complete set of individual elements we want to know about
#example: all citizens of Canada

##Sample = n
#a subset of individual elements we want to know about
#example: all CIT students


##Data
#The specified measurements of X (or multiple variables) that we obtain


##Statistic
#A number that describes or summarizes a sample
#Example: The average age of math 1350 students at BCIT


##Categorical Data (aka Qualitative)
#When The value of X is a type of word or character
#Example: names, gender, eye colour

##Numerical Data
#The characteristic variable has a numerical value
#Example: age, siblings, height


##Contingency table
#a two way table that is often used to represent two categorical variables in relation to
#each other


##Histogram (definitions)
#Similar to a bar chart but the categories are classes (intervals of number)
#these cover the range of all possible values


#lower class limit
#the smallest value of a class


#Upper Class limit
#The largest value of the class

#class mark
#the number at the center of a class (average of the lower and upper class limits)


#Class Boundaries
#The numbers in between the upper-class limit for one class 
#and the lower class limit for the next class (generally a decimal like .5 when the class limits are whole)

#class width
#The distance from one class boundary to the next class boundary
#note that 20-30 is actually 20-29 in scope but still 10 in width


#measures of center
#Methods used are: Mean, Median, Mode
#these tell us what a typical value will be

#measures of spread
#methods used: range, standard deviation, variance, inter-quarterly range
#tells us how much variability (spread) there is around the center


#empirical rule
#Describes the spread of data in terms of standard deviation
#only applies to normally distributed values
#SEE INFLECTION POINT


#Inflection Point (the measurements of empirical rule)
#Located sigma away from the middle and is the steepest point of a normal distribution
#1 sigma = 68%, 2=95%, 3=99.7%


#####UNIT 1: Symbol/Formula Index#######

#Variable: (often) X
#A characteristic

#Size: n for Sample, N for population
#number of occurrences or samples

#Mean: X-bar (drawn with an X and a straight line on top), Average
#FORMULA: X-bar = sum/size

#Mode: the modal value of X
#The value that occurs most frequently
#table is out, table(x)
#If two modes then= bi modal,
#If more than two= multi-modal
#If no repeated values=no mode

#Sample Proportion: p-hat (^p) for sample, p for population
#the fraction of individuals who fall into a specific category
#formula: p-hat = x/n (sample) OR p=x/N (population)



#Relative frequency
#Divide frequency (number of occurrences) by sample size
#This will be a list of fractions total = 100%


#Probability: P(values) = frequency/n
#P(value one | value two) = 1/2 = 50%
#P(value one) = 1/10 = 10%


#class limits:
#The range (lower-higher) WRITTEN AS TWO NUMBERS


#range:
#Range = max(x)- min(x) WRITTEN AS ONE NUMBER

#Sample Standard Deviation: s
#USE sd(x)
#Written as a big crazy formula, ignore it, the big crazy formula tells lies
#If you want to do it by hand:
#take a datapoint, subtract the mean, raise the result to an exponent of two, 
#repeat for each data point and add them all together, 
#then divide by sample size minus 1, and square root the total


#Population Standard Deviation: sigma
#USE sqrt((n-1)/n) * sd(x)
#this is sightly different from sample as the minus one doesn't happen
#If you want to do it by hand:
#take a datapoint, subtract the mean, raise the result to an exponent of two, 
#repeat for each data point and add them all together, 
#then divide by sample size, and square root the total


#Variance: s^2
#same process as the steps for sd, however you don't sqrt it at the end
#s^2 for sample, sigma^2 for pop


#Chebyshev's Theorem: 1-1/k(sd out)2
#A theory that states that:
#The fraction of the population occurring within K standard deviations of the mean
#must be at least 1-1/k^2
#For example 1-1/2^2 =0.75 so at least 75% of the population is within 
#2 standard deviations



#Skewness: sk
# Formula is 3*(mean - median)/standard deviation
# If -1.0 < Sk < 1.0, then the data is not significantly skewed.
# If Sk < -1, then the data is skewed left
# If SK > +1 then data is right-skewed
# Formula is 3*(mean - median)/standard deviation
# if mean>median then it may skew right (but it also may not)
# if mean<median it may skew left




###########
# UNIT 2  #
###########



###VOCAB

#Normal Variables
#A variable with normally distributed Numerical values


#Empirical Rule
#In a normally distributed value, the percentage of how many individuals fall 
#within a certain range. 68% = 1sd, 95% = 2sd, 99.7% = 3sd

#Quartiles: Q
#Percentiles in multiples of 25 (quarters)


#Quantiles
#What both percentiles and quartiles are
#a form of data percentage division


#Interppolation Method
#The system for calculating Qantiles as used by R

#Parameters of Z
#Mean z will always be 0
#sd of z will always be 1


###FORMULAS AND SYMBOLS

#Z Score: z
#A number assigned to a data point that can be used to compare its
#relationship relative to other data in its set, aka standard scores
#Formula: z= (x-mean)/sd

#Variable: X
#A characteristic relating to an individual
#Can be determined with the values of Z
#formula: X = mean + z*sd


#Usual/Unusual values
#In normal distribution anything -2 <= z <= 2 is usual
#anything -2>z>2 is unusual



#Percentiles: Pk or kth-percentile
#Function For this= quantile(data$value, k, na.rm = TRUE)
#A value that divides the data or population into two parts:
#the lower k% of the values and the upper (100-k)% of the values
#Formula: L = (k/100)*n
#where L = location index, n = sample size, and k = percentile number
# if L is not a whole number round up and the value of Pk
# is the Lth score counting up from the lowest
# If L is a whole number then the value of Pk is midway between the Lth score 
# and the next highest score in the original set of data. 
# Find Pk by adding the Lth score and the next higher score 
# and dividing the total by two (aka find the mean)

##Inter-Quartile Range: IQR
#Q3-Q1

#Outliers:
#Delete outliers if human error
#use IQR, Q3-Q1
#Lower limit = Q1 - 1.5 x IQR
#Upper Limit = Q3+1.5xIQR
#Anything not within upper and lower limits is an outlier


##Percent Between two numbers on a Normal Density distribution:
#P(lowest<x<highest) = area = widthxheight --> percent

#Z distribution:
#f(x) = (1/square(2*pie)*e to the power of - x squared/2)


###box plots
#draw with boxplot(x)
#outliers are dots
#The left side is Q1, the right side is Q3
#the line is mean, and the center of the box is the Q2 (median)




###########
# UNIT 3  #
###########



#dice:
#roll a dice with: sample(c(1,2,3,4,5,6), 1)
#roll a die n number of times: sample(c(1,2,3,4,5,6), n, replace=TRUE)

#loops:
#set up a holder variable
#X <- c()
#X <- rep(x,10)
#execute with
#for(i in 0:trials){things}

#pick up cards (without replacement):
#odds of zero aces = choose(48,5)/ choose(52,5)
#odds of 1 ace = choose(4,1)*choose(48,4)/choose(52,5)
#odds of 2 ace = choose(4,2)*choose(48,3)/choose(52,5)

#can also use P(a)xP(b)+P(b)xP(a)

####VOCAB#####

#Random Experiment
#an experiment is random if we are unable to predict or control which one
#of many possible outcomes will occur
#Combination of no way to predict and no way to change the results


#Outcome
#The measurement of X generated by a random experiment
#the result the came of the experiment (could have been another value though)

#Event
#A subset of the sample space (one or more outcomes)
#For example, the event that you roll an even with 2X die is the subset {2,4,6}

#With replacement
#Each selection is independent of the others

#without replacement
#Each selection is limited to only options that have not already been selected

#Law of large numbers
#As a simulation trails increase the relative frequency probability gets closer
#to the theoretical probability values

###Formulas/Symbol Index#####

#Probability: P(A)
#generally s/n
#what are the odds of A occurring?


#Classical probability
#P(A) = s/n
#s = the number of outcomes in event A
#n = the number of outcomes in sample space

#relative frequency probability
#Hands on using observational data
#P(A) ~= time the event occurred/number of trails

#Counting
#Determine possible outcomes for many selections with possible events per
#data point*possible events ... repeat for each
#so picking 2 numbers and a letter is 10x10x26 = 2600

#Factorial: !
#in r do factorial(X)
#The product of successive whole numbers
#So 4! = 4x3x2x1
#note that 0! = 1 (don't ask me why :)

#Permutations:
#A sequence in a specific order, the number of permutations of r is selected
#from n distinct items (order matters)
#nPr = factorial(n)/factorial(n-r)
#convert from a combination to a permutation with nPr = nCr*(r!)

#Combinations: nCr
#choose(n,r)
#Collections of items with no specified order. The number of combinations
#of r items taken from a collection of n elements is:
#nCr = factorial(n)/(factorial(n-r)*factorial(r)







###########
# UNIT 4  #
###########






####VOCAB and Formulas#####

#Complement (the not rule):
#The inverse of an event, the odds it will not occur
#Determined with 1-P(A), and written as A-bar or not A
#1-THING = inverse


#Addition Rule (the or rule):
#If A and B are events for a given random experiment:
#then P(A UNION B) = P(A) + P(B) - P(A INTERSECT B)

#Union
#P(A UNION B) = P(A) + P(B) - P(A INTERSECT B)
#Probability of A union B: P(A U B)
#this is the outcome of a OR b, (any overlap is only counted once)

#Intersection (the add rule)
#P(A n B) = P(A) x P(B)
#^^^^this only works if independent events
#Probability of A intersecting B = P(A n B)
#it's the area of both a AND b being true


#Mutually exclusive events:
#when A and B cannot occur at the same time
#|A intersect B| = 0


#Independence:
#The state in which the probability of an event is not altered when
#another event occurs.
#test with sample occurrences/n = total occurrences/N


#Series System
#USE SUCCESS RATE, this returns the rate of failure
#Union based
#line by line --> thing --> thing
#to calculate the likelihood of the system failing:
#take one item failure rate , inverse them all separately (1-fail),
#then multiply all the inverses together, then subtract 1
 

#Parallel Systems:
#USE FAIL RATE, this returns the rate of failure
#intersection based
#basically just multiply everything together
#in order for the whole system to fail all the items need to fail
#calculate P(failure rate) if independent with:
#P(F) = P(F1 intersection F2.... intersection Fk)
#If it's not an independent system then idk

#Sample Space: |x|
#denote the length of a given sample with pipes

#The complement of an event: A-bar
#1-P(A)

#Conditional Probability Formula:
#The probability of B given A =
#P(B | A) = |A intersection B| / |A|
#This can also be written as P(A intersect B)/P(A)


#De Morgan's Law
#The complement of a union of sets is the intersection of the complement of
#each set, this means that the complement of a bunch of unions is equal to
#the individual complements all multiplied together
#(a u b)' = a' intersect b'







###########
# UNIT 5  #
###########






####VOCAB


#Random Variable:
#A variable is a number that depends on the outcomes of a random experiment

#Binomial Random Variable:
#A random variable that represents the number of successful outcomes in a sample space.


##Discrete Random Variables:
#A countable infinite or a finite number of value (often whole number)
#such as the number of people born in the last second (4)


##Continuous Random Variables:
#A non-countable number of potential outcomes these are often decimals, 
#such as the time it takes to start a computer (5.213... seconds)

#Bernoulli Trial:
#when each event has two outcomes (success and failure)


#Standard normal distribution (aka Gaussian):
#A bell curve with mu = 0 and sigma = 1


###FORMULAS

#Mean of Discrete Random Variables
#Mu = X1*P(X1) + X2*P(X2)... X3*P(X3)

#SD of a discrete random variables:
#sigma = sqrt( ((X1-mu)^2) + ((X2-mu)^2) ...)


#Binomial Distribution
#can be used to find the odds of a certain number of events occurring
#requirements: fixed number of trials, Two outcomes, 
#Independent (but see 5% rule), and Same probability of success
#n = sample size, p = P(success), q = P(failure), x=number of successes
#P(X=x) = (nCx)*p^x*q^(n-x)
#all of these combined for all possible outcomes will be 100%

#Mu of a Binomial Distribution (this is the expected number)
#mu = n*p

#SD of a binomial distribution
#sigma = sqrt(n*p*q)


#calculate P(X = x) of a Binomial Distribution with:
#dbinom(x,n,p)
#this will be the output of P(X=x) = (nCx)*p^x*q^(n-x)



#Calculate P(X <= x) of a Binomial Distribution with:
#pbinom(x,n,q)


#Calculate P(X > x) of a Binomial Distribution with:
#1-pbinom(x,n,q)

#Calculate P(X >= x) of a Binomial Distribution with:
#1-pbinom(x-1,n,q)


#5% Rule
#we can treat a value like it's independent (and therefore use binomials on it)
#so long as n/N <= 5%








####Standard Normal Distribution Area:

#P(z <= X)
#pnorm(X)
#(Answer using the table):
#just take X and find the value on the table :)

#P(x <= Z <= y)
#pnorm(y) - pnorm(x)
#Answer using the table:
#find x, find y, area = y-x

#P(z = x)
#this is 0

#P(Z < X)
#Same as P(z <= X)
#pnorm(X)

#P(Z > X) or P(Z >= X)
#1-pnorm(X)
#Answer using the table:
#find x, then 1-x



####Non-Standard Normal Distribution Area:

#P(a <= x <= b)
#With R:
#pnorm(b, mu,sd) - pnorm(a, mu,sd)
#By hand:
#z = (a-mu/sd) and z=(b-mu/sd)
#use the table to convert
#P(b) - P(a)

#find the percentile of a distribution
#with R:
#qnorm(percentile as a decimal, mu, sigma)
#By hand:
#first use the table backwards to get the z
#x= mu+(z*sd)

#calculate the probability density at X = y
#X = dnorm(y,mean,sd)



####Poisson Distribution
#applies to situation with random occurrences in a sample interval

#the random variable X is the number of occurrences
#e = 2.71828...
#lambda = k/n
#k = total number of successful events
#n = sample space

#by hand the formula to find the probability of an even occurring is:
#P(x,lambda) = ((lambda^x)*(e^-lambda))/x!
#same thing in R:
#dpois(x, lambda)

#poisson requirements:
#X is the number of occurrences in an interval
#the occurrences must be random
#the occurrences must be independent
#the occurrences must be equally likely at all times


#find P(X <= y)
#ppois(y, lambda)

#find P(X > y)
#1 - ppois(y, lambda)

#P(X = x):
#dpois(x, lambda)



#mean of poisson
#mu = lambda

#sd of poisson
#sigma = sqrt(lambda)

#variance of poisson:
#v = lambda




#differences between a poisson an binomial distribution:
#binomials depend on sample size n and probability p
#Poisson depends on lambda
#in a binomial distribution the possible values of X are 0,1, n 
#For Poisson X has no upper limit (can be more than sample space)





#you can do it, I believe in you
