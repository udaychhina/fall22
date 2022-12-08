#Unit 05 Demo Script
#Author: Carl Gladish
#Date: Oct 13, 2021 (modified Jan 27, 2022)

#Gambling game simulation
# x        P(X = x)
# $0.00   1/8
# $0.50   6/8
#-$2.00   1/8

n.sims <- 10^5
winnings <- c()

for(i in 1:n.sims){

  coin.flips <- sample(c("H","T"), 3, replace=TRUE)
  n.heads <- sum(coin.flips=="H")
  if(n.heads == 0){
    winnings[i] <- 0
  }else{
    if(n.heads == 3){
      winnings[i] <- -2.0
    }else{
      winnings[i] <- 0.5
    }
  }
}
  
hist(winnings,breaks=seq(-2.25,0.75,0.5),xlim=c(-2.5,1),
     xaxp=c(-2.5, 1, 7),xlab="X (Winnings $)",
     freq=FALSE, col="Pink",
     main="Probability Distribution of Winnings")  

mean(winnings)

#Website hits per minute#

X.vals <- c(0, 1, 2, 3, 4, 5, 6, 7, 8)
P.vals <- c(0.1340, 0.2451, 0.2688, 0.2028,
            0.0944, 0.0389, 0.0118, 0.0035, 0.0007)

#calculate the mean and standard deviation of X
mu.X <- sum(X.vals * P.vals)
mu.X
sig.X <- sqrt(sum((X.vals-mu.X)^2*P.vals))
sig.X

################################
#Left-handed students example  #
################################

p.success <- 2/20

#Simulated outcomes
n.sims <- 10^5
sim.X.vals <- c() #initializing vector of 10^5 zeros

for (i in 1:n.sims){
  #produce a sample of 4 students
  this.sample <- sample(c("L","R"), 4,
                        replace=TRUE,
                        prob=c(p.success, 1-p.success))
  
  sim.X.vals[i] <- sum(this.sample=="L") #count how many L there are
}

#probability histogram of X
hist(sim.X.vals,breaks=seq(-0.5,4.5,1),freq=FALSE,
     xlab="x (number of left-handed students)",
     ylab="P(x)",
     main="Simulated Probability Histogram of X")

#calculate mean and s.d. for X
mu.X <- mean(sim.X.vals)
mu.X
sig.X <- sqrt(1/(n.sims-1)*sum((sim.X.vals - mu.X)^2))
sig.X

#theoretical probabilities for X = number of left-handed students
P.binom.vals <- dbinom(0:4, 4, p.success)

#overlay a plot of these on the experimental prob histogram
lines(0:4, P.binom.vals,
     xlab="x = number of successes",
     ylab="P(X=x)",
     "p",pch='X',col="red",xlim=c(-0.5, 4.5))

##############
# Coin Flips #
##############

p <- 0.5
n <- 100

#P(X=45) from the mathematical formula
p.45heads <- choose(100,45)*p^45*(1-p)^55
p.45heads

#P(X=45) using the built-in binomial distribution function
p.45heads <- dbinom(45, n, p)
p.45heads

#P(X<=45) using dbinom
pbinom(45, n, p, lower.tail=TRUE)

#probability histogram for X
X.vals <- 0:100
P.vals <- dbinom(X.vals, n, p)

plot(X.vals, P.vals,
     xlab="x = number of heads",
     ylab="P(X=x)",
     main="Probability Histogram for X (n=100 coin flips)",
     type="h", col="blue",xlim=c(20,80))

#calculate mean and standard deviation
mu.X <- sum(X.vals * P.vals)
mu.X
mu.X <- n*p
mu.X

sig.X <- sqrt(sum((X.vals-mu.X)^2*P.vals))
sig.X
sig.X <- sqrt(n*p*(1-p))
sig.X

###########################################
#plot a variety of binomial distributions #
###########################################

#set up a 2 x 2 grid for showing graphs
par(mfrow=c(2,2))

#upper left graph
p <- 0.5
n <- 40
X.vals <- 0:n
P.vals <- dbinom(x.vals, n, p)
plot(X.vals, P.vals,
     xlab="x = number of successes",
     ylab="P(X=x)",
     main=paste("Binom. Dist. (n = ",n,", p=",p," )",sep=""),
     type="h",lwd=3, col="blue",xlim=c(0,40))

#upper right graph
p <- 0.25
n <- 40
X.vals <- 0:n
P.vals <- dbinom(x.vals, n, p)
plot(X.vals, P.vals,
     xlab="x = number of successes",
     ylab="P(X=x)",
     main=paste("Binom. Dist. (n = ",n,", p=",p," )",sep=""),
     type="h",lwd=3, col="blue",xlim=c(0,40))

#lower left graph
p <- 0.5
n <- 160
X.vals <- 0:n
P.vals <- dbinom(X.vals, n, p)
plot(X.vals, P.vals,
     xlab="x = number of successes",
     ylab="P(X=x)",
     main=paste("Binom. Dist. (n = ",n,", p=",p," )",sep=""),
     type="h",lwd=3, col="blue",xlim=c(60,100))

#lower right graph
p <- 0.25
n <- 160
X.vals <- 0:n
P.vals <- dbinom(X.vals, n, p)
plot(X.vals, P.vals,
     xlab="x = number of successes",
     ylab="P(X=x)",
     main=paste("Binom. Dist. (n = ",n,", p=",p," )",sep=""),
     type="h",lwd=3, col="blue",xlim=c(20,60))

#turn off the 2 x 2 grid
dev.off()

################################
# Standard Normal Distribution #
################################

#P(Z <= -0.54)
pnorm(-0.54)

#P(Z <= 1.35)
pnorm(1.35)

#P(0.5 <= Z <= 1.35)
pnorm(1.35) - pnorm(0.5)


#P(Z = 1.35)
0

#P(Z < 1.35) same as P(Z <= 1.35)
pnorm(1.35)

#P(Z >= 1.35)
1 - pnorm(1.35)


#75th percentile of Z
qnorm(0.75)


#############################
# Female Height Distribution #
#############################

mu.X <- 164.7
sig.X <- 7.1

#Plot a normal distribution (Heights)
X.vals <- seq(130, 200, 0.1)
pdf.vals <- dnorm(X.vals, mean=mu.X, sd=sig.X)
plot(X.vals, pdf.vals, type='l',xlab="X (Height, cm)",ylab="P(X)")

#shade in area between 170 and 180
polygon(c(170,seq(170,180,0.1),180),
        c(0,dnorm(seq(170,180,0.1),mu.X, sig.X), 0),
        col="pink")

#P(170 <= X <= 180)
pnorm(180, mu.X, sig.X)-pnorm(170, mu.X, sig.X)

#Find 95th percentile of female height
qnorm(0.95, mean=mu.X, sd=sig.X)

#P(164.5 <=X < 165.5)
pnorm(165.5, mu.X, sig.X) - pnorm(164.5, mu.X, sig.X)

#height of density function at x=165
dnorm(165, mu.X, sig.X)


#########################
# Left-handed Canadians #
#########################

n <- 100
p <- 0.1

#possible values of X
X.vals <- 0:100

#binomial probabilities
P.vals <- dbinom(X.vals, n, p)

#parameters
mu.X <- n*p
sig.X <- sqrt(n*p*(1-p))

#pdf of normal with same parameters
pdf.normal.vals <- dnorm(X.vals, mean=mu.X, sd=sig.X)


#plot both
plot(X.vals, P.vals, type="h",xlim=c(0,30),lwd=3,
     xlab="X (number of left-handed)",ylab="P(X)",main="Probability Histogram of X")
lines(X.vals, pdf.normal.vals, col="red",type="b")



########################
# Poisson Distribution #
########################

#Poisson distribution for X = hits to Amazon during 1-second interval
par(mfrow=c(2,1))

lambda <- 2.7E9 / (30*24*60*60)
lambda
#P(X<=100)
ppois(1000, lambda)

x.vals <- 0:2000
p.vals <- dpois(x.vals, lambda)
plot(x.vals, p.vals,
     xlab="x (visitors during 1 second)",
     ylab="P(X=x)",
     type='h',xlim=c(850,1200))

#overlay the density curve for a normal distribution
y.normal <- dnorm(x.vals, lambda, sqrt(lambda))
lines(x.vals, y.normal,col="red",lwd=3)

#make the same graph for a website with 1000 times fewer hits on average

lambda <- 2.7E6 / (30*24*60*60)
lambda
x.vals <- 0:50
p.vals <- dpois(x.vals, lambda)
plot(x.vals, p.vals,
     xlab="x (visitors during 1 second)",
     ylab="P(X=x)", lwd=5,
     type='h',xlim=c(0,10),ylim=c(0,0.4))

#overlay the density curve for a normal distribution
x.vals.normal <- seq(0,10,0.1)
y.vals.normal <-dnorm(x.vals.normal, lambda, sqrt(lambda))
lines(x.vals.normal, y.vals.normal,col="red",type="l",lwd=1)

#reset plot window
dev.off()
