#Author: Uday Chhina
#Date: Oct 25, 2022
#Assignment: Lab Challenge 05

#Part1
#a

mu = 200 * 0.797
sig = sqrt(200 * 0.797 * (1 - 0.797))

#number of vaccinated students from the sample
X.vals = seq(0, 200, 1)
#probabilities of success (X.vals)
P.vals = dbinom(X.vals, 200, 0.797)
#plot copied from demo script
plot(X.vals, P.vals,
     xlab="X (num of vaccinated students)",
     ylab="P(X)",
     main=paste("Binom. Dist. (n = ",200,", p=",0.797," )",sep=""),
     type="h",lwd=3, col="red",xlim=c(135,185))

lines(X.vals, dnorm(X.vals, mu, sig))

#b
p155 = pbinom(155, 200, 0.797)
p165 = pbinom(165, 200, 0.797)
p165 - p155

#c
prop.vals = X.vals/200
length(prop.vals[prop.vals <= 0.855 & prop.vals >= 0.740]) / 200

#Part2
#a
lambda = 1.56
dpois(0, lambda)

#b
#p = probability and x = num of errors
p = 0
x = 10
while (p < 0.05) {
    x = x - 1
    p = 1 - ppois(x, lambda)
}
dpois(0:8, lambda)

#
lambda = 1.56
X.vals = 0:60
P.vals = dpois(X.vals, lambda)

plot(X.vals, P.vals,
     xlab="X (num of errors in an hour)",
     ylab="P(X)",
     main=paste("Binom. Dist. (n = ",60,")",sep=""),
     type="h",lwd=3, col="white",xlim=c(-1,10))

for(i in 1:length(X.vals)){
    x <- X.vals[i]
    P <- P.vals[i]
    polygon(c(x-0.5, x-0.5, x+0.5, x+0.5),
            c(0, P, P, 0),col="skyblue")
}

lines(X.vals, dnorm(X.vals, lambda, lambda ^ 0.5))

#Part3
#a
#Probability of getting 4 aces
#P(X=4)
#probability of getting an ace = 4/52
(4/52)*(4/52)*(4/52)*(4/52)*(48/52)*5

#b
(4/52)*(3/51)*(2/50)*(1/49)*(48/48)*5





