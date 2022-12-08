#Unit 08 - Hypothesis Testing, One Parameter
#Author: Carl Gladish
#Date: Nov 12, 2021 (modified March 7, 2022)


## Age of Students ###

#Population parameter mu = population mean age
#Claim:  mu >= 26

#Hypotheses
#H0: mu >= 26
#H1: mu < 26

#population mean assumed by the null hypothesis
mu <- 26

#sample data
X.Age <- c(26,28,29,19,22,23,20,17,24,22,22,24,18,23,37,31,
           30,21,32,19,29,20,28,19,19,30,22,28,28,25,28,28)


#calculate sample statistics
xbar <- mean(X.Age)
s <- sd(X.Age)
n <- length(X.Age)
xbar
s
n

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
P.value <- pt(t, df=n-1) #P(t <= -1.4911)  left tail!!!!
P.value

#since the P-value is greater than 5%, we fail to 
#reject the null hypothesis

#Conclusion:
# (Basic version) The average age of BCIT students is at
#least 26.
# (Technical version): There is insufficient evidence
# to reject the claim that the average age of BCIT 
# students is at least 26.

#using the t.test function
t.test(X.Age, alternative="less", mu=26)

###Android phone example####

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
P.value <- (1 - pnorm(z))*2 #two-tailed value
P.value

#Since P.value < 0.05, we will reject H0
#Conclusion:
#(Basic) The Android market share has changed.
#(Technical) There is sufficient evidence to reject
# the claim that Android market share has not changed
# from 2019 to 2020.

#alternative solution, using prop.test
prop.test(895, 1000, 0.87,                 #x, n, p
          alternative="two.sided",         #"less", "greater"
          correct=FALSE)                   #no continuity correction

prop.test(895, 1000, 0.87,                 #x, n, p
          alternative="two.sided",         #"less", "greater"
          correct=TRUE)                   #with continuity correction


###Broken Windows Example###
#Test the claim that the proportion of broken windows in general 
#is 8% or less

#Parameter: p = proportion of broken windows
#H0: p <= 0.08
#H1: p > 0.08

#sample data
n <- 1600
x <- 160
p.hat <- x/n

p <- 0.08 #parameter according to H0
q <- 1-p

#test statistic
z <- (p.hat-p)/sqrt(p*q/n)

#P-value (right tail)
P.value <- 1-pnorm(z)

#using prop.test
prop.test(160, 1600, p =0.08, alternative="greater", correct=TRUE)

###File transfer Example###

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
t

#P-value
P.value <- (1-pt(t, df=n-1)) * 2 #two-tailed
P.value #0.0453

#since 0.0453 < 0.05, we reject H0
#Conclusion:
#(basic) The mean transfer time is not 12.44 seconds.
#(technical): There is sufficient evidence to reject
# the claim that the mean transfer time is 12.44 sec.

#You can't use t.test for this example, since we don't have
#the raw sample data
