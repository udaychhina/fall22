library(readxl)

#set working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week9")

data <- read.delim("W2022_MATH_1350_Lab_06_failures.txt")
#Part 1
#A
X.vals = 0:400
n = 400
phat.values = dbinom(X.vals, 400, 0.025)
plot(X.vals, phat.values, type="h", xlim = c(0, 30))

for(i in 1:length(phat.values)){
    x <- X.vals[i]
    P <- phat.values[i]
    polygon(c(x-0.5, x-0.5, x+0.5, x+0.5),
            c(0, P, P, 0),col="pink")
}

p = 0.025
q = 1 - p
mu.x.vals = p
sig.x.vals = sqrt((p * q)/n)

#B
pbinom()

#Part 2
#A
hist(data$X.fail, freq = FALSE,
     breaks = seq(-0.5, 10.5, 1))
#B
mu.X.fail = mean(data$X.fail); mu.X.fail
sig.X.fail = sd(data$X.fail); sig.X.fail

#C
X.vals = 0:10 ; X.vals
p.vals = dpois(X.vals, mu.X.fail) ; p.vals

lines(X.vals, p.vals, type = "p", pch = "x", col="red")

