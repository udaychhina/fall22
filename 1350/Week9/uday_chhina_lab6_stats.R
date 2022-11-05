library(readxl)

#set working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week9")

data <- read.delim("W2022_MATH_1350_Lab_06_failures.txt")
#Part 1
#A
X.vals = 0:400
n = 400
phat.values = dbinom(X.vals, 400, 0.025)
plot(X.vals/400, phat.values*400, type="h", xlim = c(0, 0.1),
     main = "Sampling distribution for 400 samples",
     ylab = "p values",
     xlab = "Samples requiring tech support in first year.")

lines(X.vals / 400, phat.values * 400, col="red", lwd=1)

p = 0.025
q = 1 - p
mu.x.vals = p
sig.x.vals = sqrt((p * q)/n)

#B
pbinom(3, n, p)  - pbinom(2, n, p)

#C
#i
pnorm(0.03, mu.x.vals, sig.x.vals) - pnorm(0.02, mu.x.vals, sig.x.vals)

#ii
pnorm(0.035, mu.x.vals, sig.x.vals) - pnorm(0.025, mu.x.vals, sig.x.vals)

#Part 2
#A
hist(data$X.fail, freq = FALSE,
     breaks = seq(-0.5, 10.5, 1),
     xlab = "Failures", ylab="Density", 
     main="Histogram for hard drive failures per hour")
#B
mu.X.fail = mean(data$X.fail); mu.X.fail
sig.X.fail = sd(data$X.fail); sig.X.fail

#C
X.vals = 0:10 ; X.vals
p.vals = dpois(X.vals, mu.X.fail) ; p.vals

lines(X.vals, p.vals, type = "p", pch = "x", col="red")

#Part 3
#A
n.trials = 10^5
xbar = c()
n = 50

for (i in 1:n.trials) {
    failures = sample(data$X.fail, n, replace=TRUE)
    xbar[i] = mean(failures)
}

hist(xbar, freq = FALSE,
     breaks = seq(0.5, 2.5, 0.1),
     col="steelblue1", xlab="failures", ylab = "Density",
     main = "Histogram for X.fail(n = 50)")

#B
m.xbar = mean(xbar)
sd.xbar = sd(xbar)

#C
xvals = seq(0.5, 2.5, 0.1)
yvals = dnorm(xvals, mean(xbar), sd(xbar))
lines(xvals, yvals, type = 'l', col = 'red')

#D
lowerBound = m.xbar - (2 * sd.xbar)
upperBound = m.xbar + (2 * sd.xbar)
lowerBound
upperBound








