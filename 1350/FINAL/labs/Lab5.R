#shanti stein-gagnon
#A01229344, set B
#Feb 11th, 2022


#Question 1, a

p <- 0.797
n <- 200

X.vals <- 0:200
P.vals <- dbinom(X.vals, n, p)

plot(X.vals, P.vals,
     xlab="number of Students",
     ylab="P(X=x)",
     main="Probability Histogram of Student Vaccination",
     type="h", col="blue",xlim=c(120,200))

mu.X <- n*p

sig.X <- sqrt(n*p*(1-p))

norm.P.vals <- dnorm(X.vals, mu.X, sig.X)

lines(X.vals, norm.P.vals, col="blue", lwd=2)

#Question 1 B

quest.b <- pbinom(165, n, p) - pbinom(154, n, p)


#Question 1 C

p_hat_a_total <- 200*.74-1
odds_p_hat_a <- pbinom(p_hat_a_total,n, p, lower.tail=TRUE)

p_hat_b_total <- 200*.855
odds_p_hat_b <- pbinom(p_hat_b_total,n,p, lower.tail = TRUE)

#P(0.74 <= p <= 0.855)
p_range <- odds_p_hat_b - odds_p_hat_a
p_range

#Question 2

#Question 2 part A, P(X = 0)
dpois(0, 1.5)


#Question 2 part b
#find the number of errors, m, such that P(X>m) is <5%
1- ppois(4, 1.5)


#Question 2 part c

lambda <- 1.5

x.vals <- 0:7
p.vals <- dpois(x.vals, lambda)



plot(x.vals, p.vals, type="h", xlab="number of errors",
     ylab="Probability of number of errors", main="Harddrive errors in an hour")

for(i in 1: length(x.vals)){
  xi <- x.vals[i]
  pi <- p.vals[i]
  polygon(c(xi-0.5, xi-0.5, xi+0.5, xi+0.5),
          c(0, pi, pi, 0), col="orange")
}


mu <- lambda
sigma <- sqrt(lambda)

x.vals.normal <- seq(0,10,0.1)
pdf.y.vals <- dnorm(x.vals.normal, mean=mu, sd=sigma)

lines(x.vals.normal, pdf.y.vals, col = "blue")

#question 3

#question 3 a, what is the probability density of getting 4 aces
#drawing 5 cards, use replacement

p.aces <- 4/52
n.aces <- 5

ace_vals <- c(rep(0,7))

for (i in 0:7){
  ace_count <- choose(5, i)*(p.aces^i)*((1-p.aces)^(5-i))
  ace_vals[i] <-ace_count
  print(paste(i, ":", ace_count))
}
plot(ace_vals, type="h", xlab="number of aces",
    ylab="likelyhood of ace number", main="odds of getting aces with replacement")

#question 3 choose 
options(scipen=999)

zero_ace <- choose(48,5)/ choose(52,5)
one_ace <- choose(4,1)*choose(48,4)/choose(52,5)
two_ace <- choose(4,2)*choose(48,3)/choose(52,5)
three_ace <- choose(4,3)*choose(48,2)/choose(52,5)
four_ace <- (choose(4,4)*choose(48,1))/choose(52,5)

total_aces <- c(zero_ace, one_ace, two_ace, three_ace, four_ace)
print(total_aces)
plot(total_aces, type="h", xlab="number of aces",
     ylab="likelyhood of ace number", main="odds of getting aces without replacement")
















