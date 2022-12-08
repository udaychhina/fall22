#1a
n <- 400
p <- 0.025
q <- 1-p
phat <- 2.5 / 400
x.vals <- 0:400
p.vals <- dbinom(x.vals, 400, 0.025)
mu.X = 2.5
sig.X = sqrt(p*q/n)

lines(x.vals / 400, p.vals * 400, col="red", lwd=1)

plot(x.vals/400, p.vals*400, type="h", xlim =c(0, 0.1), main = "Sampling Distribution for n=400"
     , xlab = "Samples that require tech support", ylab = "Density")

trials = 10^6
phat_vals = c()

for (i in 1:trials) {
    sample = sample(c("Y", "N"), n, prob=c(p, q), replace=TRUE)
    phat_vals[i] = sum(sample == "Y") / n
}

mean_phat = mean(phat_vals)
mean_phat
sd_phat = sd(phat_vals)


#1b
pbinom(3, n, p)  - pbinom(2, n, p)

#1c
#i
pnorm(0.03, mean_phat, sd_phat) - pnorm(0.02, mean_phat, sd_phat)

#ii
pnorm(0.035, mean_phat, sd_phat) - pnorm(0.025, mean_phat, sd_phat)


#2

data <- read.delim("C:\\Users\\eddie\\Documents\\W2022_MATH_1350_Lab_06_failures.txt")

hist(data$X.fail, freq= FALSE, breaks = seq(-0.5, 10.5, 1),
     xlab = "Hard Drive Failures", ylab="Density Population", 
     main="Histogram for hard drive failures per hour")

mu.X.fail = mean(data$X.fail)

sig.X.fail = sd(data$X.fail)

X.vals <-  0:10
lambda <- mu.X.fail
p.vals <- dpois(X.vals, lambda)

lines(X.vals, p.vals, type = "p", pch="x", col="red")


#3
#a
failures <- read.delim("C:\\Users\\eddie\\Documents\\W2022_MATH_1350_Lab_06_failures.txt")$X.fail
n.trials = 10^5
xbar <- c()
n = 50

for (i in 1:n.trials){
    this.sample = sample(failures, n, replace=TRUE)
    xbar[i] = mean(this.sample)
}

hist(xbar, xlim=c(0, 3), breaks = seq(0.5, 3.5, 0.1), col = "red", freq=FALSE, xlab="Xbar(failures)", ylab = "Density",
     main = "Histogram for X.fail where n = 50")

#b

failmean = mean(failures)
sdfail = sd(failures)
sdxbar = sdfail / sqrt(n)

#c
x.vals = seq(0.5, 3.5, 0.1)
y.vals = dnorm(x.vals, mean(xbar), sd(xbar))
lines(x.vals, y.vals, type = "l", col = "blue")

#d

interval <- sdfail / sqrt(n)

interval <- 2 * interval

posint <- 1.5 + interval
negint <- 1.5 - interval



