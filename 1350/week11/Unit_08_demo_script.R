#Unit 08 - Hypothesis Testing, One Parameter
#Author: Carl Gladish
#Date: Nov 12, 2021 (modified July 27, 2022)

## Age of Students ###

#Population parameter mu = population mean age
#Claim:  mu >= 26

#Hypotheses
#H0: mu >= 26
#H1: mu < 26

#population mean assumed by the null hypothesis
mu <- 26  #we assume H0 is true for now

#sample data
X.Age <- c(26,28,29,19,22,23,20,17,24,22,22,24,18,23,37,31,
           30,21,32,19,29,20,28,19,19,30,22,28,28,25,28,28)


#calculate sample statistics
xbar <- mean(X.Age)
s <- sd(X.Age)
n <- length(X.Age)

#plot a histogram of the sample data
hist(X.Age,breaks=seq(0.5,40.5,1),
     xlim=c(15,42),xaxp=c(15,40,25),
     xlab="Age",main=paste("Histogram of Age, n =",n))

#overlay the mean value on the histogram
lines(c(xbar,xbar),c(0,15),col="black",lty=2)

#show mu on the histogram, just to illustrate
lines(c(mu,mu),c(0,15),col="red",lty=1)

#the t-statistic for this sample data
t <- (xbar - mu)/(s/sqrt(n))
t

#Here the P-value is from the left tail since H1
# has < in it.
p.value<- pt(t, df=n-1) #P(t <= -1.4911)  left tail!!!!


#since the P-value is greater than 5%, we fail to 
#reject the null hypothesis

#Conclusion:
# (Basic): The average age of BCIT students is at least 26.
# (Technical): There is insufficient evidence to reject 
# the claim that the average age of BCIT students is at least 26.

#using the t.test function
X.Age

t.test(X.Age, alternative="less", mu=26)

## Android phone example 

# Test the claim that Android's market share in 2020
# is the same as in 2019 (87%)

#Parameter: p = proportion of Android users in 2020
#H0: p = 0.87
#H1: p != 0.87

p <- 0.87 #according to H0
q <- 1-p

#Sample Data
n <- 1000
x <- 895
p.hat <- x/n

#test statistic
z <- (p.hat - p)/sqrt(p*q/n)
z
#Calculate P-value
1-pnorm(z) #right tail
p.value <- 2*(1 - pnorm(z)) #two-tailed value
p.value

#Since p.value < 0.05, we will reject H0
#Conclusion:
#(Basic) The Android market share has changed.
#(Technical) There is sufficient evidence to reject
# the claim that Android market share has not changed
# from 2019 to 2020.

#alternative solution, using prop.test
prop.test(895, 1000, p=0.87,                 #x, n, p
          alternative="two.sided")          #"less", "greater"
                             

prop.test(895, 1000, 0.87,                 #x, n, p
          alternative="two.sided",         #"less", "greater"
          correct=FALSE)                   #no continuity correction


## Left-handed students example ##
# Test the claim that 10% of BCIT students are left handed.

#Parameter: p = proportion of left-handed students
#H0: p == 0.1
#H1: p != 0.1

#sample data
n <- 50
x <- 7
p.hat <- x/n

p <- 0.1 #parameter according to H0
q <- 1-p

#test statistic
z <- (p.hat-p)/sqrt(p*q/n)

#p-value (two-tails)
p.value <- 2*(1-pnorm(z))

#using prop.test
prop.test(7, 50, p=0.1, alternative="two.sided",correct=FALSE)
prop.test(7, 50, p=0.1, alternative="two.sided",correct=TRUE)

## File transfer Example###

#parameter of interest: mu = mean transfer time
#claim: mu = 12.44 seconds

#H0: mu = 12.44  (this is the claim)
#H1: mu != 12.44

mu <- 12.44

#sample statistics
n <- 20
xbar <- 13.71
s <- 2.65

#test statistic
t <- (xbar - mu)/(s/sqrt(n))

#P-value
p.value <- (1-pt(t, df=n-1)) * 2 #two-tailed
p.value #0.0453

#since 0.0453 < 0.05, we reject H0
#Conclusion:
#(basic) The mean transfer time is not 12.44 seconds.
#(technical): There is sufficient evidence to reject
# the claim that the mean transfer time is 12.44 sec.

#You can't use t.test for this example, since we don't have
#the raw sample data

