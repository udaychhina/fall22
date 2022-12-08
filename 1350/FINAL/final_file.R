#lab1 Lab 1350                              
#Jacky
# Sep/09/2022



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


#Question 1: Chapter1
#1) a) [1 mark] Which of the following could not be the population of interest?
#(Circle the correct answer.)
#i. All students in set D
#ii. All students in MATH 1350
#iii. All students at BCIT
#iv. All students in Canada
#The answer is A, as set D already exist in Set D


#b)b) [1 mark] Which of the following is not a statistic pertaining to this data?
#(Circle the correct answer.)
#i. 𝑛 = sample size
#ii. 𝐼𝑄𝑅 = sample inter-quartile range of Age
#iii. 𝑠
#2 = sample variance of Siblings
#iv. 𝜇 = population mean of Height
# The answer = mew population mean of height 




# definitions 
# why are pie chat bad ?
#   it's hard to accurately compare slices
#   the 3D perspective makes some segments look larger


#mode of data is highest frequency
#class mark is midpoint of modal class
#class limits are upper  and lower values
#class boundaries are between limits of 2 classes
#unormal data means Z score  (-2 of z score < z < 2 of z score)
#class width is upper boundary - lower boundary =  a single number
#modal class = most frequent class 
#mode = the most frequently occurring number found in a set of numbers.
#out lier   Q2-IQR*1.5     Q3 +IQR* 1.5
#X bar = avg
#s =  Stdev
#μ = popuilation mean
#s^2 = variance
#σ(sigma) = STD of population 
# to get percentile use quantile() The 95th percentile is a number that is greater than 95% of the numbers in a given set
# pnorm converts z scores to percentile
# qnorm converts percentile(p value) to Z scroe 
#percentile = the intergrated area of a distribution graph (0.5 percentile = 50 percent = at Stander deviation)
#
# sknewness use skewness formulor sk = 3(mean - median)/std
#
qnorm(0.98956)
pnorm(2.31)



#set Working folder
setwd("E:/BCIT CIT WORKS/1350Math2(R)")

#read data
library(readxl)
data= read_excel("MATH_1350_Lab_01_Data.xlsx")
data$Age

#finds Avg of age
mean(data$Age, na.rm=TRUE)

#table phone brand
y = table(data$Phone.Brand)
y

#sample size 
Tsample=sum(y)
Tsample

#sample proportion for iphone
p=28/Tsample
p

#create pie chart

pie(table(data$Phone.Brand),main = "phone brands",col = c(rgb(1,0.3,0.2),rgb(0.5,0.3,1),rgb(0.3,0.4,0.3),
                                                          rgb(0.1,0.8,0.3),rgb(0.1,0.2,0.7),rgb(0.1,0.4,0.8),
                                                          rgb(0.1,0.4,0.7),rgb(0.4,0.5,0.3),rgb(0.3,0.2,0.7)))



#create table
table(data$Age)
#create a histogram

#minimum and maximum values
min(data$Age); max(data$Age)

#Find the frequency distribution of data$Age using class limits

class = cut(data$Age,       #data to use
            seq(17.5,35.5, 2), #lower class limits
            right=FALSE)    #do not include next lower limit value

#find frequency of each class
table(class)

#find relative frequency distribution
prop.table(table(class))


#plot a histogram of X = age
hist(data$Age, freq=TRUE,
     breaks=seq(17.5, 35.5, 2),  #the class boundaries
     col="pink", border="darkblue",
     xlab="Age (years)",
     xlim=c(18,36.5), 
     xaxp=c(17,36,19),  #set the tick marks on x axis
     ylab="Frequency",ylim =c(0,20),
     main="Histogram of Age (n=100)")

#siblings sample size
sum(table(data$Siblings))
#income goal sample size
sum(table(data$Income.Goal))
#median for income goal data
options("scipen"=100)
quantile(data$Income.Goal,0.5,na.rm = TRUE)
xt=quantile(data$Income.Goal,0.5,na.rm = TRUE)
#income goal data mean
mean(data$Income.Goal,na.rm = TRUE)
xm=mean(data$Income.Goal,na.rm = TRUE)
#mode for income goal data
table(data$Income.Goal)
#range for income goal data
max(data$Income.Goal,na.rm = TRUE)-min(data$Income.Goal,na.rm = TRUE)
#stander Deviation for income goal data
sd(data$Income.Goal,na.rm = TRUE)
s=sd(data$Income.Goal,na.rm = TRUE)
#variance for income goal data
sd(data$Income.Goal,na.rm = TRUE)^2
#skewness for income goal data
(3*(xm-xt))/s
#P30 for income goal data
quantile(data$Income.Goal,0.3,na.rm=TRUE)
#IQR for income goal data
IQR(data$Income.Goal,na.rm = TRUE)

#siblings data find mean
mean(data$Siblings,na.rm = TRUE)
xm2=mean(data$Siblings,na.rm = TRUE)
#median for sibling data
quantile(data$Siblings,0.5)
xt2=quantile(data$Siblings,0.5)
#mode for sibling data
table(data$Siblings)
#range for sibling data
max(data$Siblings)-min(data$Siblings)
#std for sibling data
sd(data$Siblings)
s2=sd(data$Siblings)
#variance for siblings
(sd(data$Siblings))^2
#skewness
(3*(xm2-xt2))/s2
#P30 calculation for sibling data
quantile(data$Siblings,0.3)
#IQR for sibling data
IQR(data$Siblings)

boxplot(data$Age~data$Set,main ="boxplot",xlab="set",ylab="age")




library(readxl)
data<-read_excel("F2021_MATH_1350_Data.xlsx")







#lab2 start

#Q1
#Plot a histogram for the 𝑧-scores based on the variable 𝑋 = Income.Goal for the population of all
#students in MATH 1350, where you:
#  • use the default “Sturges” method for the breaks.
#• plot probability density on the y-axis.
#• include suitable labels and give it a title.
#• make the rectangles red.
#Then answer the questions below.

#a. What fraction of students in MATH 1350 have Income.Goal values more than one standard
#deviation above the mean?

#  b. If Income.Goal followed a normal distribution, what fraction of students would have an
#income goal more than one standard deviation above the mean?

#  c. Find any unusual values of Income.Goal.



#Q1 graph


s = sd(data$Income.Goal,na.rm = TRUE)

AVG = mean(data$Income.Goal,na.rm = TRUE)

z = (data$Income.Goal[!is.na(data$Income.Goal)] - AVG)/s

hist(z,col="RED",freq = FALSE)
#a)
t1 = sum(table(z > 1))
3/t1
#b) find prob (area) of z more then 1 // 
1 - pnorm(1, mean = 0, sd = 1)
#c) find value point to Z at 2.923....

2.92308137795738 * s + AVG 
3.31591725356494* s + AVG
4.8872607559951* s + AVG


#Q 2 

# Using the variable 𝑋 = Siblings for students MATH 1350, plot a histogram where:
# • each whole number has its own class and its own “tick mark”
# • plot frequency on the y-axis
# • use the RGB hex code #CF4371 as the colour
# Then calculate the following:

# a. The quartiles 𝑄1, 𝑄2, and 𝑄3.

# b. The percentiles 𝑃5 and 𝑃90.

# c. Determine if there are any outliers for this variable. If so, list them.




x = data$Siblings[!is.na(data$Siblings)]

#xapx = c(a,b,c) function for tick mark takes in array data where a is lower end b is upper end and c is how many steps

hist( x ,freq = TRUE ,col="#CF4371",breaks=seq(-0.5, 8.5, 1),xaxp=c(0,8,8), main="Histogram of Siblings data")

#a)
q1 = quantile(x,0.25)
q1
q2 = quantile(x,0.50)
q2
q3 = quantile(x,0.75)
q3
#b)
quantile(x,0.05)
quantile(x,0.90) 
#c)
ix = IQR(x)
ix
LowQ = q1 - ix * 1.5
LowQ
HighQ = q3 + ix *1.5
HighQ
#d)
x[x < LowQ]
x[x > HighQ]




# Q3
# Using the variable 𝑋 = Income.Goal, plot side-by-side boxplots (each one extending horizontally)
# comparing the salary expectations for Males and Females in MATH 1350. Label axes and provide a
# suitable title. What conclusion can you draw from this graph?

boxplot(data$Income.Goal ~ data$Gender ,horizontal = TRUE,xlab = "income goal",
        ylab ="Gender",main="income goal by gender")








#lab3 
library(readxl)
data<-read_excel("F2021_MATH_1350_Data.xlsx")


# 1. Use the data in the Excel file “F2021_MATH_1350_Data.xlsx”.
# a. Suppose you randomly select one student in the course. What is the probability
# that the student has brown eyes and owns a car?
# b. Suppose you randomly select a student who has brown eyes. What is the
# probability that this student owns a car?
# c. Suppose you randomly select two students (without replacement). What is the
# probability that they both wear glasses?


#1a
sum(table(data$Set))
owncar = data$Owns.Car == "Yes"
table(owncar)
table(owncar[data$Eye.Colour == "Brown"])
p1a = 27/59
p1a


#1b
beyes = data$Eye.Colour
sum(beyes[data$Eye.Colour=="Brown"])
table(beyes)
table(beyes[data$Owns.Car =="Yes"])
p1b = 27/43
p1bs


#1c
wearg = data$Wears.Glasses
weargs = data$Wears.Glasses


sum(table(wearg[data$Wears.Glasses == "Yes"]))
sum(table(weargs[data$Wears.Glasses =="Sometimes"]))
wearglases
table(wearg)

p1c = ((29+5)/59) * ((28+5)/58)
p1c



# 2. Suppose you roll four fair dice. Let 𝑋̅ = the mean value of the four die. Use R to simulate
# 4 × 1000,000 rolls (so that you end up with 1000,000 simulated values of 𝑋̅).
# a. Plot a probability histogram (freq=FALSE) of 𝑋̅. Give it suitable labels and title.
# b. What is the most likely value of 𝑋̅? (In other words, what is the mode of 𝑋̅?)
# c. Use the experimental data to estimate the probability that 3.0 ≤ 𝑋̅ ≤ 4.0.




#2a probability samples
n.trials = 1000000
dice1 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)
dice2 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)
dice3 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)
dice4 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)

x= (dice1+dice2+dice3+dice4)/4
hist(x, breaks = seq(0.25,6.5,0.25),
     xaxp = c(0.5,6.0,10),xlab="dice sum average",
     ylab="probability",
     freq = FALSE)

#2b (ans 3.5)
max(table(x))

#2c
sum( 3 <= x  & x <= 4)/sum(table(x))


#3a
n = 4 
datastuff = c(21,19,19,25,23,27,43,24,19,22)
y = table(datastuff <= 22)
5/10





#3b
choose(5,4)/choose(10,4)
#3c
xbar = c()
ages = 0 
is_unique = 0

for (i in 1:1000000){
  ages = sample(datastuff, 4, replace=FALSE)
  if (length(unique(ages)) == 4) {
    is_unique = is_unique + 1
  }
  xbar[i] = mean(ages)

}

hist(xbar,breaks = seq(18.5,30.5,0.5),
      main=" Average probability graph",
      xlab="Mean of student agaes",
      ylab="density",
      freq = FALSE)
#3d

ansd = sum(xbar<= 22) / 1000000
ansd

#3e
ans3e = is_unique/1000000
ans3e

#end of notes
#coding

library(readxl)
data= read_excel("F2021_MATH_1350_Midterm_Data.xlsx")
table(data$Wears.Glasses)

avg = mean(data$Siblings,na.rm = TRUE)
std = sd(data$Siblings,na.rm = TRUE)


quantile(data$Siblings[!is.na(data$Siblings)],0.25)
-2*std +avg

IQR(data$Siblings)




#for U4 probility 

#Dice functions

# simulation for finding P(sum) for rolling x no. of dice
rolls = 10^5
dice = 2
sides = 6

get_prob = function(rolls, dice, sides) {
  p_total = 0
  
  for (i in 1:rolls) {
    roll_outcome = sum(sample(1:sides, dice, replace = TRUE))
    
    if (roll_outcome == 6){
      p_total = p_total + 1
    } 
  }
  return(p_total/rolls)
}

get_prob(rolls, dice, sides)





#poker fucntions
get_prob <- function(sims, hand_size, num_cards){
  # create a vector of all card values
  cards <- c(rep(1:13,4))
  
  # run simulations
  successes <- 0
  for (i in 1:sims){
    # draw a hand of size hand_size
    hand <- sample(cards, hand_size, replace=FALSE)
    
    # check if hand has at least num_cards of the same value
    counts <- table(hand)
    if (any(counts >= num_cards)) successes <- successes + 1
  }
  
  # return probability of success
  return(successes/sims)
}





#U5 Discreat random variable
# when calculating discreat ramdom variable sample xbar(sample mean) are random variables so as sample std and sample population
# u= sum(xi*P(xi))   std = sqrt(sum(((x-u)^2)*P(xi))  where xi is trial number  P(xi) is probability that was record during xi trail


# in binomial distribution u = n*p and std = sqrt(npq) p is chance of success q is chance of failur q= p-1
#dbinom for calculating P(x=y) where y is integer
#ex if n = 100(trial 100 times) probity of success = 0.5 get P(X=45) (where out of 100 time get 45 success)
#syntax dbinom(45,100,0.5) (signle point value)

# in binomial distribution u = n*p and std = sqrt(npq) p is 
#pbinom for calculating P(x =< y) where y is integer (how likely are you )
#ex same as condition in previous example. but now get P( x=<45 ) (where out of 100 times get 0 to 45 success)  
#pbinom(45, 100,0.5) (p value)

#5% rule as long as n is no more then 5% of the population then the selection can be consider as independent
#when dealing with at least scenario eg: P(X >= y) we change it to 1- P(x <= Y-1)  
# (ex: P(X>= 5) meaning at least 5 success) we change it to 1- P(x <= 4)

# if following 2 condition holds then we can approximate a binomial distribution (n trials with success of p%) using a normal distribution
# with the same mu and sigma  
# condition 1. if expected number of success is at least 5 
# condition 2. if excepted number of fail is at least 5 

#Poisson distribution is for event that happens some time over a specified time interval such as: 
# X is number of occurrences of the event 
#Number of jobs arriving for service at a CPU per sec 
#Number of shoppers arriving at check-out counter per min
#Number of units being rejected by QA station per hour
#nUmber of bits in arriving in error at a network node per min

#continuity correction means add 1 more precition to the probibilty eg if P(phat <= 0.68) apply continuity correction is now 0.685 
#while going the otherway P(phat >= 0.68 ) apply continuity correction is now 0.675

#probability density function (pdf) for Poisson is f(X,λ) = (λ^x * e^-λ)/x!
# λ is average of occurrence over many trials
#R syntax dpois(x,λ)
# u(mean) = λ
# std = sqrt(λ)
#dpois for P(X= some nunber) 
#ppois for accumulative P(x <= or >= num )
# qpois(p(area),lamda, lower.tail = True)
#chebyshev
#
#k is z score(how far is it from std) it gives you at least % 
#
#
#
#
#at leas is 1-p-value


#1a
mu = 200 * 0.797
sigma = sqrt(200 * 0.797 * 0.203)
X.vals = 0:200
P.vals = dbinom(X.vals,200,0.797)


plot(X.vals, P.vals, type="h",
     xlim=c(100, 200),
     main="Probability Histogram for X (n=200 students)",
     xlab="x = # of vaccinated students", ylab="P(X=x)",
     col="black")

for(i in 1:length(X.vals)) {
  x = X.vals[i]
  P = P.vals[i]
  polygon(c(x-0.5, x-0.5, x+0.5, x+0.5),
          c(0, P, P, 0),col="#00AA55")
}

norm.P.vals = dnorm(X.vals, mu, sigma)
lines(X.vals, norm.P.vals, col="blue",lwd=1,lty=1)

#1b
pbinom(165, 200,0.797)-pbinom(154, 200,0.797)

#1c
#p1 = x at 0.740
p1 = 200*0.74
#p2 = x at 0.855
p2 = 200*0.855

pbinom(171, 200,0.797) - pbinom(147,200,0.797)


#2
lamda = 1.56
dpois(0,lamda)



#3a
dbinom(4, size=4, prob=1/4)

#3b
trials = 250000
deck = c(rep("A", 4), rep("N", 48))
success = c(0, 0, 0, 0, 0)

for(i in 1:trials) {
  hand = table(sample(deck, 5, replace=FALSE))
  
  if("A" %in% names(hand)) {
    success[hand["A"] + 1] = success[hand["A"] + 1] + 1
  } else {
    success[1] = success[1] + 1
  }
}

success[5] / trials

X.vals = 0:4
P.vals = success / trials

plot(X.vals, P.vals, type="h",
     xlim=c(-1, 5),
     main="Probability Histogram for X",
     xlab="x = # of Aces drawn", ylab="P(X=x)",
     col="white")

for(i in 1:length(X.vals)) {
  x = X.vals[i]
  P = P.vals[i]
  polygon(c(x-0.5, x-0.5, x+0.5, x+0.5),
          c(0, P, P, 0),col="#7b5c00")
}

norm.P.vals = dnorm(X.vals, mu, sigma)
lines(X.vals, norm.P.vals, col="yellow",lwd=1,lty=1)




#U6 sampling Distribution and central limit theorem
#Why take sample? we take sample because test could be destructive, or accurate population data is too expensive to collect (or too difficult)
#or population is infinite.

#Terminology
#a number that summarize a population is a parameter eg:(u(mu)= pop(population).mean or σ(sigma)= pop.std) or p = pop.proportion <-- fix number
#a number that summarize a sample is a statistic eg: Xbar = mean ,phat sample proportion, S = sample.std,n = sample size <-- has random varibility

#phat (is approximate normal)
# FIVE(5)different sampling method
# 1. Cluster sampling: randomly pick a group
# 2. Stratified sampling: pick 1 or more individual from each sub group
# 3. Systematic sampling: eg: pick every 5th person in a large population <-- this is not the same as simple random sampling
# note 1 to 3 are real world acceptable way to collect sample ( here below are bad)
# 4.Ask volunteer: self-selected sample (has bias (error))
# 5. simple random sampling <--( Best in theory  method to pick samples )
# ^ simple random sampling every possible subset has the same chance of happening
# R syntax: sample(classlist,5,replace) <-- this pick 5 student from class list 


#assign a range of numbers 1 to 25  x = 1:25 --> (list[1,2,3 -> 25])
#continuity correction means add 1 more precition to the probibilty eg if P(phat <= 0.68) apply continuity correction is now 0.685

 
#phat = x/n where x number of success in sample n is sample size
#mean u-phat of all possible sample proportion is the total population
#std of phat = sqrt((p*q)/n) 
#Phat is nornal as long as np >=5 and nq <= 5 


#xbars (is approximate normal )
# what is this x-bar Bullshit ? think of if as if we were to measure something several times you will get different sample mean.
# such as MOA of a rifle. If we mesure once is avg is 1.3 MOA 2nd time might be 1.4 or lower. that why this variant exist

#uxbar = ux // (mean of all potential xbar) = (means of individual measurement)
#std-xbar(std of all possible xbars) = std-x/sqrt(n)
# the shape of distribution of x bar is normal as long as (n is bigger then 30)
# or x is normal


#L6

#Q1
#2.5% cus will require tech support first 1 year. 
#400 units is ramdomly selceted  phat = proportion of uniuts in the sample need repair
n = 400
p = 0.025
q = 1-p
phat = 2.5 / 400
x.vals = 0:400
p.vals = dbinom(x.vals, 400, 0.025)
mu.X = 2.5
sig.X = sqrt(p*q/n)

plot(x.vals/400, p.vals*400, type="h", xlim =c(0, 0.1))
lines(x.vals / 400, p.vals * 400, col="red", lwd=1)

trials = 10^6
phat_vals = c()

for (i in 1:trials) {
  sample = sample(c("Y", "N"), n, prob=c(p, q), replace=TRUE)
  phat_vals[i] = sum(sample == "Y") / n
}

mean_phat = mean(phat_vals)
sd_phat = sd(phat_vals)



#1b
pbinom(3, n, p)  - pbinom(2, n, p)

#1c
#i
pnorm(0.03, mean_phat, sd_phat) - pnorm(0.02, mean_phat, sd_phat)

#ii
pnorm(0.035, mean_phat, sd_phat) - pnorm(0.025, mean_phat, sd_phat)



#Q2
setwd("E:/BCIT CIT WORKS/1350Math2(R)")
data = Lab_06_failures
max(data)
hist(data$X.fail,freq = FALSE,breaks = seq(-0.5,10.5,1),ylab="probility", xlab="error detected",main="HDD error over 1 hour")
mu.fail = mean(data$X.fail) # this is also lambada
std.fail = sqrt(mu.fail)
xval = 0:10
p.val = dpois(xval,mu.fail)

lines(xval,p.val,type ="p",pch="x",col="red")




#Q3 
data = Lab_06_failures
data$X.fail
n.trials = 10^5
xbar = c()
n = 50

for (i in 1:n.trials){
  this.sample = sample(data$X.fail, n, replace=TRUE)
  xbar[i] = mean(this.sample)
}

hist(xbar, xlim=c(0, 3), breaks = seq(0.5, 3.5, 0.1), col = "red", freq=FALSE, xlab="Xbar(failures)", ylab = "Density",
     main = "Histogram for X.fail where n = 50")

#b

failmean = mean(data$X.fail)
failmean
sdfail = sd(data$X.fail)
sdfail
sdxbar = sdfail / sqrt(n)
sdxbar

#c
x.vals = seq(0.5, 3.5, 0.1)
y.vals = dnorm(x.vals, mean(xbar), sd(xbar))
lines(x.vals, y.vals, type = "l", col = "blue")

#d

interval = sdfail / sqrt(n)

interval = 2 * interval

posint = 1.5 + interval
posint
negint = 1.5 - interval
negint


#U7 Estimation
# statistic steps:firs collect  Raw data--> Sample statistic --> make inferences to your sample statistic.
# every population parameter has some best estimate statistic.

#point estimator 

#best estimator 
#for mean(population (u)) is mean(sample population(x-bar)) UNBIASED mean of population is equal to sample population

#Stander deviation(s) is BAIASED
#median is BAISED
#if a graph is tailed to right sample median tend to be high
#if a graph is tailed to left sample median tend to be low
#if a graph is a normal distribution sample median tend to be tracking the truth 

#Confidence intervals (interval estimate)
# Confidence intervals  = X-bar - E(margin of error) and X-bar + E(margin of error)
# the Limit of the conf. int is X-bar - E and  X-bar + E
# X-bar is normal as long as original X is normal or n is bigger than 30
# p-hat is normal as long as np bigger than 5 and nq is bigger then 5.
 

#according to central limit theorem Xbar and p hat z scores are normal variables

#confident level = 1-alpha
#alpha = 1-confident level
# critical value is a stander normal probability value. Critical Z is Z of (alpha/2) (use qnorm(1-z(alpha/2)) to get crit Z)
#eg: 
#if confidence level is 95 %  1-alpha = 0.05
#crit Z = z of 0.025 <--(alpha/2). crit Z = qnorm(1-0.025)
#to get margin of error of normal distribution in 1 setp use prop.test()
#example 58 student 28 of them uses apple confident level is 95% find margin of error
#syntax(<uses apple>,<total sample size>,conf.level=<confident level>)

#stop at  video 1:38:14   Lab 7 Q3 ans

# confiten interval for u(σ(singma) is unknown)

#t-distribution is wider then stander normal
#find crit t value use qt(1-alpha/2,df = n-1)

#use t.test to get E(margin of error) in 1 step using R
#syntax t.test(<sample_data>, <confident level>) 


#sample size determination (what will my confident level be if n is <x> size)
#qnorm() deals by default with areas below the given boundary value. 

#on the formula sheet sample size section 
#the formula has sigma is for confident interval of u(population mean)
#the formula has pq(q is 1-p) is for confident interval of p(chance of success)

#pessimistic approach (worse case scenario of n to get the confident interval we want ) 
#use the formula that has 1/4 on the sheet






#Using the population data for X.fail, we can observe why the formula for sample variance uses 𝑛 − 1
#instead of n

#a. Import the raw population data for X.fail into R. Calculate its population variance 𝜎^2

#Note that R does not have a built-in function for population variance!
#  b. In R, define two functions
#s.var <- function (X) (1/(length(X)-1))*sum((X-mean(X))^2)
#p.var <- function (X) (1/length(X))*sum((X-mean(X))^2)
#Simulate 105
#samples of size 𝑛 = 5 from the X.fail population data (without replacement). For
#each sample, evaluate both s.var(this.sample) and p.var(this.sample) and store
#those values as you go. Then calculate the mean of all the s.var values and all the p.var values.
#Which function, s.var or p.var,gives an unbiased estimate of the population variance?

# 1a
setwd("E:/BCIT CIT WORKS/1350Math2(R)")
failures = read.csv("failures.txt")$X.fail
mu = mean(failures)
N = sum(table(failures))
test = failures - mu
sigma = sqrt((1/N) * (sum((failures - mu)^2)))

variance = sigma ^ 2; variance

# 1b
s.var <- function (X) (1/(length(X)-1))*sum((X-mean(X))^2)
p.var <- function (X) (1/length(X))*sum((X-mean(X))^2)

trials = 10^5
n = 5
s_vals = c()
p_vals = c()

for (i in 1:trials) {
  sample = sample(failures, n, replace=FALSE)
  s_vals[i] = s.var(sample)
  p_vals[i] = p.var(sample)
}

mean(s_vals)
mean(p_vals)

#2. Suppose a sample of 10 individual hours yields the sample data:
#X.fail = 2, 2, 1, 0, 3, 1, 1, 1, 3, 2
#For each of the following, round the limits of the confidence intervals to one decimal place.
#a. Calculate a 95% confidence interval for 𝜇 = the population mean based on this sample.
#b. Calculate a 90% confidence interval for 𝜇 = the population mean based on this sample.

# 2a
x_sample = c(2, 2, 1, 0, 3, 1, 1, 1, 3, 2)
xbar = mean(x_sample)
s = sd(x_sample)
n = sum(table(x_sample))
alpha = 1 - 0.95
t_crit = qt(1 - (alpha/2), df=n-1)
E = t_crit * (s / sqrt(n))

limit_lower = xbar - E; limit_lower
limit_upper = xbar + E; limit_upper

# 2b
alpha = 1 - 0.9
t_crit = qt(1 - (alpha/2), df=n-1)
E = t_crit * (s / sqrt(n))

limit_lower = xbar - E; limit_lower
limit_upper = xbar + E; limit_upper

#3a

Defect <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
table(Defect)
n = length(Defect)
x.defect=sum(Defect==1)
phat= x.defect/n
qhat= 1-phat
#99 conif inter for p = pop prop of defect
alpha = 0.01
z.crit = qnorm(1-(alpha/2))

E= z.crit * sqrt((phat*qhat)/n)
  
lowerL = phat - E;lowerL
upperL = phat + E;upperL





#U8 hypothesis testing
#if population is less then 30 or population std is unknow then use t.test
#else use prop.test
# if test Ho = 0 H1 != 0 use 2 tail test
# CI caculated from alpha is a p-value use qnorem to get Z-score
#
#clame is the usually the reject condtion
# Ha < claim left tail test   Ha > claim right tail test  Ha <= claim(at least) left tail test  
# Ha >= claim right tail test   Ha != claim 2 tail test  
# if alpha is not stated is 0.05
#
#if p-value is bigger than alpha fail to reject Ho
#if alpha is bigger then p-value reject Ho


library(readxl)
data= read_excel("F2021_MATH_1350_Data.xlsx")

# 2
# Step 0, requirements + sample data
# Parameter: mu = mean height
# Claim: mu = 175cm
height = data$Height[!is.na(data$Height)]
n = length(height)
x_bar = mean(height);x_bar
s = sd(height);s
# requirement: n >= 30 CHECK

# visualize
hist(height, xlab="Height (cm)", main="Height of Sample (n=58)")
lines(c(175, 175), c(0, 15), col="red", lwd=5)
# lines(x_value(start point,end point), y_value (startpoint,endpoint), lwd = <thickness >) 
lines (c(x_bar,x_bar), c(0, 15), col="blue", lwd=5)
#. Let 𝜇 = the mean height of BCIT students. Test the claim that 𝜇 equals 175 cm
# Step 1, hypotheses
# (null) H0: mu = 175   (claim)
# (alt) H1: mu != 175   (two.sided)

# Step 2, test statistic
# Step 3, p-value
# Step 4, conclusion
t.test(height, alternative="two.sided", mu=175)
# we reject H0 since 0.01535 < 0.05
# Basic: the mean height is not 175cm



#L10 correlation and linear Regression
#if x and y has linear correlation( slope goes positive ) r = 1 
#if x and y has linear correlation( slope goes negative ) r = -1 
# r is always between -1 and 1. it measure the strength of liner relation ship

# yhat = bx+a  (a is intercept )
#    y = mx+b
# trend line = regression line = best fit line = least squares line 
#yhat is preditited y base on certen value of x 

#remove any points where data age or income goal is missing
#   data = subset (data,!is.na(age) & !is.na(Income.Goal) & income.Goal < 2.5e5  )
#   lm(y~x) gives liner model for the data (Y~X) means Y intems of X   
#lm() out put sample:

#Coefficients:
#(Intercept)          B               
#       51939(b)     1802(m)    put in y= mx+b  y= 1802(x) + 51939

#Correlation and Liner regression  The strenght of a correlation is measured useing correlation coefficient r
#
#                     r is alway between -1 to 1
#
#                          (weak correlation)
#                            v          v
#                    -1===========0============1
#                     ^           ^            ^
#                     |           |            |
#     (perfect negative)   (no correlation)    (perfect positive)
#                                         
#                          
# if data are sample data liner correlation coefficient is denored as r
# if the data are population data liner correlation coefficient is denoted as "rho" ρ
# they use the same formulor the the formulor sheet (test about r, linera correlation coefficient)
#
#
#cor(X,Y) X,Y is a list of data
#
#
#
# sample correlation r follow its own probability distribution (t-distribution). it can vary randomly 
#
#
#while doing hypothesis test for rho use pt((t-score), df(n-2)) tp get p value
#
#mutiple liner regression lm(y~x1,x2)


### Multi-linear Regression Example

#remove any points where Age, Height, or Siblings are missing
#data2 <- subset(data, !is.na(Age) & 
#                  !is.na(Siblings) & 
#                  !is.na(Height))

#sample size
#n <- nrow(data2)

#extract the variables being considered
#X1 <- data2$Age
#X2 <- data2$Height
#Y  <- data2$Siblings

#determine the multi-linear model
#model <- lm(Y~X1+X2)

#coefficients(model)
#summary(model)
#a <- coefficients(model)[[1]];a
#b1 <- coefficients(model)[[2]];b1
#b2 <- coefficients(model)[[3]];