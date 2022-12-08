#Shanti Stein-Gagnon
#A01229344
#Date: March 22, 2022

#set up
options(scipen=999)
setwd("C:/Users/fishf/OneDrive/Desktop/TERM_TWO/MATH1350/Lab9")

data <- read.delim("car_data.txt",
                   header=TRUE,stringsAsFactors=TRUE,
                   sep=",")
data.tab <- table(data)

#Question one 

X1.Int.Comb <- with(data, X[T == "Internal Combustion"])
X2.Hybrid <- with(data, X[T=="Hybrid"])

#plot histogram
par(mfrow=c(2,1))
hist(X1.Int.Comb, breaks=seq(-0.05, 24.95, 2),
     xlim=c(0, 25), main="Internal Combustion Fule Consumption", xlab = "Fule Consumption (L/100km)", col="#CFA333")
hist(X2.Hybrid, breaks=seq(-0.05, 24.95, 2),
     xlim=c(0, 25), main="Hybrid Fule Consumption", xlab = "Fule Consumption (L/100km)", col="#00A333")

#sample statistic
xbar1.1 <- mean(X1.Int.Comb)
xbar2.1 <- mean(X2.Hybrid)
s1.1 <- sd(X1.Int.Comb)
s2.1 <- sd(X2.Hybrid)
n1.1 <- length(X1.Int.Comb)
n2.1 <- length(X2.Hybrid)
xbar1.1 
xbar2.1
s1.1
s2.1
n1.1
n2.1

#hypotheses:
#H0: mu1 - mu2 <= 0
#H1: mu1 - mu2 > 0

#test test statistic
t.1 <- (((xbar1.1 - xbar2.1) - 0 )/ sqrt((s1.1^2)/ n1.1 + (s2.1^2)/n2.1))
t.1

#get the p value, right tailed
1 - pt(t.1, min(n1.1, n2.1)-1)

#t test
t.test(X1.Int.Comb, X2.Hybrid, alternative="greater")


#conclusion p-value < 0.05, reject the h0
#we have sufficient evidence to support the claim that internal
#combution engines have higher fuel combution than hybrids


#Question 2
#import data
A1.Electric <- with(data, A[T == "Electric"])
A2.Hybrid <- with(data, A[T=="Hybrid"])

#draw histogram
par(mfrow=c(2, 1))
hist(A1.Electric, breaks=seq(-0.05, 24.95, 2),
     xlim=c(0, 25), main="Electric Car Acceleration",xlab = "Fule Consumption (L/100km)", col="#88EE22")
hist(A2.Hybrid, breaks=seq(-0.05, 24.95, 2),
     xlim=c(0, 25), main="Hybrid Car Acceleration", xlab = "Fule Consumption (L/100km)", col="#F0A333")

#Hypothesis:
#H0: mu1 - mu2 = 0 <- claim
#H1: mu1 - mu2 != 0 <- two tailed

#confidence interval with t.test
t.test(A1.Electric, A2.Hybrid, Alternative="two.sided", conf.level=0.9)

#conclusion:
#based on the results of this test, there is sufficient
#evidence to reject the claim that electric and hybrid are equivalent

#Question 3

#get the data:


#this is data for 1
Hybrid.suv <- with(data, S[T == "Hybrid"])
hybrid.suv.true <- length(Hybrid.suv[Hybrid.suv == "TRUE"])
hybrid.suv.true
n1.3 <- length(Hybrid.suv)
phat1 <- hybrid.suv.true / n1.3
n1.3
phat1

#this is data for 2
Electric.suv <- with(data, S[T == "Electric"])
Electric.suv.true <- length(Electric.suv[Electric.suv == "TRUE"])
Electric.suv.true 
n2.3 <- length(Electric.suv)
phat2 <- Electric.suv.true / n2.3
n2.3
phat2


#hypothesis:
#h0: p1 - p2 <= 0
#h1: p1 - p2 > 0



pbar <- (hybrid.suv.true+Electric.suv.true)/(n1.3+n2.3) #pooled proportion
qbar <- 1-pbar

#test statistic and P-value
z <- (phat1-phat2)/sqrt(pbar*qbar/n1.3+pbar*qbar/n2.3)
z
P.value <- 1-pnorm(z)
P.value

#prop test
prop.test(c(hybrid.suv.true,Electric.suv.true), c(n1.3, n2.3), correct = FALSE)

#by hand
E <- qnorm(1-0.05/2)*(sqrt(phat1*(1-phat1)/n1.3+phat2*(1-phat2)/n2.3))
E
limit.lower <- (phat1-phat2)-E
limit.upper <- (phat1-phat2)+E


limit.lower
limit.upper

