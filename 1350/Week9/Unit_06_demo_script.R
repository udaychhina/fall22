#MATH 1350 Unit 06 Prep
#Carl Gladish
#Feb 21, 2022 (modified July 27, 2022)

library(readxl)

#set working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week9")

#load YVR air temperatures
YVR_Air_Temps <- read.delim("YVR_Air_Temps.txt")

mean(YVR_Air_Temps$Jan.Temp[YVR_Air_Temps$Year <= 1980])

xbar1 <- with(YVR_Air_Temps,
              mean(Jan.Temp[Year <= 1980]) )

sd1 <- with(YVR_Air_Temps,
              sd(Jan.Temp[Year <= 1980]) )

xbar2 <- with(YVR_Air_Temps,
              mean(Jan.Temp[Year >= 2000]) )

sd2 <- with(YVR_Air_Temps,
            sd(Jan.Temp[Year >= 2000]) )

#difference in mean January temperatures for two periods
xbar1 - xbar2

#plotting the air temperature data for the two time periods
with(YVR_Air_Temps,
    plot(Year[Year <= 1980],
         Jan.Temp[Year <= 1980],'b',
         col="blue",
         xlim=c(1935, 2022), ylim=c(-6.5, 7.5),
         xlab="Year",
         ylab="January Temp (deg C)",
         main="January Climate Change at YVR"))

with(YVR_Air_Temps,
     lines(Year[Year > 2000],
          Jan.Temp[Year > 2000],'b',col="red"))


abline(a=xbar1, b=0, col="lightblue",lty=2)
abline(a=xbar2, b=0, col="pink",     lty=2)


#We will cover this in detail in Unit 09
t.test( with(YVR_Air_Temps, Jan.Temp[Year <= 1980]),
        with(YVR_Air_Temps, Jan.Temp[Year >= 2000]),
        alternative="less")


## Example of selecting an SRS from a class list

data <- read_excel("Data/F2021_MATH_1350_Data.xlsx")

#N.pop is the number of students in the data frame
N.pop <- nrow(data)

#we are going to randomly select 10 rows from the data frame
n.sample <- 10

#pick the random rows
n.rows <- sample(1:N.pop, n.sample, replace=FALSE)

#use the random set of rows as the row index
#(column index stays blank to select all of the columns)
data[n.rows, ]



## Brown eyes among BCIT students

n <- 100 #sample size
p <- 0.6 #population proportion

#to get p-hat = 0.6, we need to get X=60 students
# with brown eyes.
dbinom(60, n, p)

#the distribution of p-hat comes from the binomial distribution:
X.vals <- 0:n  #number of Brown eyes in sample
P.vals <- dbinom(X.vals, n, p)

#distribution of X
plot(X.vals, P.vals, type="h",
     xlab="X = number of Brown-eyed students",
     ylab="P(X)")

#distribution of p-hat
plot(X.vals/n, P.vals*n, type="h",
     xlab="p-hat (sample proportion of Brown eyes)",
     ylab="Probability Density",
     main="Sampling Distribution of p-hat, n=100",
     xlim=c(0, 1),col="blue")

#This for-loop just creates a rectangle for each "bar" in the
#histogram. It is just there to improve the appearance.
for(i in 1:length(X.vals)){
  xi <- X.vals[i]
  pi <- P.vals[i]
  polygon(c(xi-0.5, xi-0.5,xi+0.5, xi+0.5)/n,
          c(0, pi, pi, 0)*n,col="pink")
}

#P(0.55 <= phat <= 0.65) is the same as
#P(  55 <=  X   <= 65)
pbinom(65, n, p) - pbinom(54, n, p)


## Here I will generate the sampling distribution of p-hat by
# simulating 1 million random samples of 100 students
p <- 0.6
q <- 1-p
n <- 100

n.sims <- 10^6
p.hat.vals <- c() #store all p-hat values

for (i in 1:n.sims){
  this.sample <- sample(c("B","O"), n,
                        prob=c(p, q),replace=TRUE)
  
  p.hat.vals[i] <- sum(this.sample=="B")/n
}

#parameters of p-hat distribution
mu.phat <- mean(p.hat.vals)
sig.phat <- sd(p.hat.vals)


#the histogram should look the same as the probability 
#histogram created just above
hist(p.hat.vals)
hist(p.hat.vals, freq=FALSE,
     xlim=c(0.3, 0.9),
     breaks=seq(0.295, 0.905,0.01),col="pink")

#overlay normal
X.vals.norm <- seq(0.3, 0.9,0.01)
pdf.vals.norm <- dnorm(X.vals.norm, mean=mu.phat,
                       sd=sig.phat)
lines(X.vals.norm, pdf.vals.norm, col="black",lwd=2)



#Empirical P
sum(p.hat.vals <= 0.68)/n.sims

#Exact value P(phat <= 0.68)
pbinom(0.68*100, 100, 0.6)
pbinom(floor(0.68*n), n, p)

#Normal approx of P(phat <= 0.68)
pnorm(0.68, mean=mu.phat, sd=sig.phat)

#with "continuity correction"
pnorm(68.5/100, mean=mu.phat, sd=sig.phat)
pnorm((0.685 - mu.phat)/sig.phat)


#load student data
data <- read_excel("Data/F2021_MATH_1350_Data.xlsx")

#define a function to calculate sigma from population data
pop.sd <- function(X) sqrt(sum((X-mean(X))^2)/length(X))

X.height <- data$Height[!is.na(data$Height)]
N <- length(X.height)
mu.X <- mean(X.height)
sig.X <- pop.sd(X.height)   #population standard deviation
s.X <- sd(X.height) #note that sd(X) gives a different value

hist(X.height,breaks=seq(149.5, 194.5,5),freq=FALSE,
     col="Pink",
     xlim=c(140, 200),
     xaxp=c(140,200,12),
     xlab="X = Height (cm)",ylab="Density",
     main="Histogram of Height (N = 58)")

#overlay a normal distribution on the histogram
x.vals <- 140:200
lines(x.vals, dnorm(x.vals, mean=mu.X, sd=sig.X),col="black")

#simulate 10^5 samples of size n=4
n.sims <- 10^5
n.sample <- 4
Xbar4.vals <- c()  #to keep record of the Xbar values

for (i in 1:n.sims){
  this.sample <- sample(X.height, n.sample, replace=TRUE)
  Xbar4.vals[i] <- mean(this.sample)
}

hist(Xbar4.vals, breaks=seq(149.5, 194.5,1),col="pink",
     freq=FALSE,xlim=c(150,195),
     xlab="Xbar (cm)", ylab="Density",
     main=paste("Histogram of Sampling Distribution of Xbar for Height, n=",n.sample))

mu.Xbar4 <- mean(Xbar4.vals)
sig.Xbar4 <- sd(Xbar4.vals)

x.vals <- seq(140,200,0.5)
p.vals <- dnorm(x.vals, mean=mu.Xbar4, sd=sig.Xbar4)
lines(x.vals, p.vals,  col="black",lwd=1)

#Now find the sampling distribution of X-bar with n=25
n.sample <- 25
Xbar25.vals <- c()

for (i in 1:n.sims){
  this.sample <- sample(X.height, n.sample, replace=TRUE)
  Xbar25.vals[i] <- mean(this.sample)
}

hist(Xbar25.vals, breaks=seq(149.5, 194.5,0.5),col="pink",
     freq=FALSE,xlim=c(150,195),
     xlab="Xbar (cm)", ylab="Density",
     main=paste("Histogram of Sampling Distribution of Xbar for Height, n=",n.sample))

mu.Xbar25 <- mean(Xbar25.vals)
sig.Xbar25 <- sd(Xbar25.vals)
lines(x.vals, dnorm(x.vals, mean=mu.Xbar25, sd=sig.Xbar25),
      col="black")

#overlay the normal distribution for Xbar4
lines(x.vals, dnorm(x.vals, mean=mu.Xbar4, sd=sig.Xbar4), col="blue")

#overlay the normal distribution for X
lines(x.vals, dnorm(x.vals, mean=mu.X, sd=sig.X), col="red")


#IQ problem
mu.X <- 100
sig.X <- 15
n.sample <- 20
sig.Xbar <- sig.X/sqrt(n.sample)

#plot the distribution
x.vals <- 60:140
pdf.X <- dnorm(x.vals, mu.X, sig.X)
pdf.Xbar <- dnorm(x.vals, mu.X, sig.Xbar)

plot(x.vals, pdf.X, col="black", type="l",ylim=c(0, 0.12),
     xaxp=c(60,140,16),
     xlab="X-bar", ylab="Density",main="Probability Density for X and X-bar")  
lines(x.vals, pdf.Xbar, col="red", type="l")
legend("topright",
       legend=c("X", "Xbar"),
       lty=c(1,1),
       col=c("black","red"))

#P(95 <= X <= 105)
pnorm(105, mu.X, sig.X) - pnorm(95, mu.X, sig.X)

#P(95 <= Xbar <= 105)
pnorm(105, mu.X, sig.Xbar) - pnorm(95, mu.X, sig.Xbar)

#Weight of groups of Students
mu <- 156.2 #pounds
sig <- 24.5 #pounds

n <- 36

#P(Xbar >= 165)
1 - pnorm(165, mu, sig/sqrt(n))


# Checking that X-bar is normal for X = height of students
data$Height
X <- data$Height[!is.na(data$Height)]

N <- length(X) #population size
mu.X <- mean(X)

pop.sd <- function(X) sqrt(sum((X-mean(X))^2)/length(X))
sig.X <- pop.sd(X)
sig.X
sd(X)

n.sims <- 10^5
n.sample <- 30
Xbar.vals <- c()

for(i in 1:n.sims){
  this.sample <- sample(X, n.sample, replace=TRUE)
  Xbar.vals[i] <- mean(this.sample)
}
Xbar.vals
Z <- (Xbar.vals - mu.X)/(sig.X/sqrt(n.sample))
Z
hist(Z, freq=FALSE,breaks=seq(-5.5,5.5,0.2),col="palegreen",
     xlab="Z",ylab="Probability Density",
     main="Histogram of Z with Standard Normal pdf")

X.vals <- seq(-5,5,0.1)
pdf.vals <- dnorm(X.vals)
lines(X.vals, pdf.vals ,col="black",type="l",lwd=1)


