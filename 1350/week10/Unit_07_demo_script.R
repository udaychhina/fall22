#Unit 7 - Demo Script
#Author: Carl Gladish
#Date: Nov 3, 2021 (modified July 27, 2022)

#set working directory
setwd(Sys.getenv("MATH_1350_ROOT"))

#sample data and sample statistics for Latency example
Latency <- c(30,5,92,42,27)
Xbar.Latency <- mean(Latency)
Var.Latency <- var(Latency)

#import X.fail data again 
data <- read.csv("Data/Lab_06_Data_Failures.txt")
X.fail <- data$X.fail

hist(X.fail,breaks=seq(-0.5, 10.5,1),freq=FALSE,
     xlab="X.fail",ylab="Density",main="Distribution of X.fail",
     xaxp=c(0,10,10))

#find the median of the raw data set
quantile(X.fail, 0.5) 

#simulate 10^4 samples of size n=10 and calculate sample 
# median for each
n.sims <- 10^4
n.sample <- 10
median.vals <- c()

for(i in 1:n.sims){
  this.sample <- sample(X.fail, n.sample)
  median.vals[i] <- quantile(this.sample,0.5)
}

#find the mean of all the sample medians
mu.median <- mean(median.vals)

#plot the distribution of sample medians to understand 
# what is happening with the sample medians
hist(median.vals,breaks=seq(-0.25, 4.25, 0.5),
     freq=FALSE,
     xlab="Sample Median",ylab="Density",
     main="Histogram of 10^4 sample medians")

#add vertical lines to show the position of the population
#median and the mean of all sample medians
lines(c(median.X.Fail, median.X.Fail), 
      c(0, 1), type="l",col="black",lty=2) #black, dotted

lines(c(mu.median, mu.median), 
     c(0, 1), type="l",col="red",lwd=2)  #red, solid


## Critical values
# find z_0.025
z0.025 <- qnorm(1 - 0.025)
z0.025

#Check area
pnorm(z0.025) - pnorm(-z0.025)

#More critical z values
z0.05 <- qnorm(1 - 0.05)
pnorm(z0.05) - pnorm(-z0.05)

z0.005 <- qnorm(1 - 0.005)
pnorm(z0.005) - pnorm(-z0.005)


#CPU Example 
sig <- 0.62 #deg C
n <- 106
Xbar <- 42.5

#95% confidence
alpha <- 0.05  #which makes 1 - alpha = 95%
z_crit <- qnorm(1 - alpha/2)
E <- z_crit * sig / sqrt(n)
limit.lower <- Xbar - E
limit.upper <- Xbar + E

#99% confidence
alpha <- 0.01   #which makes 1 - alpha = 99%
z_crit <- qnorm(1 - alpha/2)
E <- z_crit * sig / sqrt(n)
limit.lower <- Xbar - E
limit.upper <- Xbar + E


#Phone.Brand Example
library(readxl)

data <- read_excel("Data/F2021_MATH_1350_Data.xlsx")

barplot(table(data$Phone.Brand))

#remove NA values
Phone.Brand <- data$Phone.Brand[!is.na(data$Phone.Brand)]
x.Apple <- sum(Phone.Brand == "Apple")
n <- length(Phone.Brand)
phat.Apple <- x.Apple/n
qhat.Apple <- 1 - phat.Apple

#95% confidence
alpha <- 0.05 
z.crit <- qnorm(1 - alpha/2)
E <- z.crit*sqrt(phat.Apple * qhat.Apple / n)
limit.lower <- phat.Apple - E
limit.upper <- phat.Apple + E

#one-step calculation (slightly different answer, but also correct)
prop.test(x.Apple, n, conf.level=0.95)

#90% confidence
alpha <- 0.1 
z.crit <- qnorm(1 - alpha/2)
E <- z.crit*sqrt(phat.Apple * qhat.Apple / n)
limit.lower <- phat.Apple - E
limit.upper <- phat.Apple + E

#one-step calculation (slightly different answer, but also correct)
prop.test(x.Apple, n, conf.level=0.90)

#critical t values
t0.025 <- qt(1 - 0.05/2, df=25-1)
t0.025
pt(t0.025,24) - pt(-t0.025, 24) #confirm area


#BCIT Height example
sample.Height <- data$Height[!is.na(data$Height)]
hist(sample.Height)
n <- length(sample.Height)
Xbar <- mean(sample.Height)
s <- sd(sample.Height)

alpha <- 0.05
t.crit <- qt(1 - alpha/2, df=n-1)
E <- t.crit*s/sqrt(n)
limit.lower <- Xbar - E
limit.upper <- Xbar + E

#you can also find the conf. int. in one step
t.test(sample.Height, conf.level=0.95)

## Sample size BCIT computers
alpha <- 0.04
z.crit <- qnorm(1 - alpha/2)
E <- 0.25
sig <- 0.5
n.size <- ceiling((z.crit*sig/E)^2)


##Sample size left-handedness
alpha <- 0.05
z.crit <- qnorm(1 - alpha/2)
E <- 0.01
n.size <- ceiling((z.crit/E)^2*0.25)

