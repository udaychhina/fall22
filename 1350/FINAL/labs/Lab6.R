#Shanti Stein-Gagnon
#A01229344
#2/22/2022

#Question One

#a
p = 0.025
n = 400
q = 1-p


one.valX <- 0:n
P.vals <- dbinom(one.valX, n, p)


plot(one.valX, P.vals, type="h",
     xlab="X = number of Brown-eyed students",
     ylab="P(X)")

plot(one.valX/n, P.vals*n, type="h",
     xlab="p-hat (sample proportion of tech support )",
     ylab="Probability Density",
     main="Sampling Distribution of p-hat, n=400",
     xlim=c(0, 0.07),col="blue")

for(i in 1:length(one.valX)){
  xi <- one.valX[i]
  pi <- P.vals[i]
  polygon(c(xi-0.5, xi-0.5,xi+0.5, xi+0.5)/n,
          c(0, pi, pi, 0)*n,col="pink")
}
norm.X <- seq(-.01,.1,0.001)
mu.pHat <- p
sig.pHat <- sqrt(n*p*q)/n

norm.P.vals <- dnorm(norm.X, mu.pHat, sig.pHat)

lines(norm.X, norm.P.vals, col="blue", lwd=2)

#b
pbinom(12, n, p) - pbinom(8, n, p)

#c
#i
pnorm(12/n, mu.pHat, sig.pHat) - pnorm(8/n, mu.pHat, sig.pHat)

#ii
pnorm(12.5/n, mu.pHat, sig.pHat) - pnorm(7.5/n, mu.pHat, sig.pHat)

#Question Two
library(readxl)

data <- read.delim("C:/Users/fishf/OneDrive/Desktop/TERM_TWO/MATH1350/Lab6/failures.txt")

hist(data$X.fail, freq=FALSE, breaks=seq(-.5,10.5,1), xaxp=c(-2,10,12), xlab="Number of failures",
     ylab="probability density", main="Rate of Hard Drive Failure, N=1000000")

#b
mu <- mean(data$X.fail[!is.na(data$X.fail)])

#different sd because population
sd <- sqrt((10^6-1)/10^6) * sd(data$X.fail)

fail.norm <- seq(0,10.0,1)


lines(fail.norm, dpois(fail.norm,mu), type="p", pch="x", col="red")

#Question Three
  
trail <- 10^5
x.mean <- c()
for (i in 1:trail){
  x.mean[i] <- mean(sample(data$X.fail,50))
}

hist(x.mean, freq=FALSE, breaks=seq(.5,2.5,0.1))

mu.Xbar <- mean(x.mean)
sd.Xbar <- sd(x.mean)
three.x <- seq(0,10.0,0.02)

#question 3, C
lines(three.x, dnorm(three.x, mu.Xbar, sd.Xbar), type="l", col="red")

#question 3, D
qnorm(0.95,mu.Xbar, sd.Xbar)

#checking
pnorm(1.783293, mu.Xbar, sd.Xbar)

