# Demo Script - Unit 03
# Carl Gladish
# Sept 23, 2021 (updated Jan 13, 2022)

#Simulate 100,000 dice rolls of two die

n.trials <- 10^6
die1 <- sample(c(1,2,3,4,5,6), n.trials, replace=TRUE)
die2 <- sample(c(1,2,3,4,5,6), n.trials, replace=TRUE)

#calculate the sum of the two die
X <- die1+die2

#make a histogram with one rectangle for each integer value
hist(X, 
     breaks=seq(1.5,12.5,1),
     freq=FALSE,
     main="Probability Histogram of X = Sum of Two Dice")

#P(X = 2)
sum(X == 2) / n.trials

#P(X = 7)
sum(X==7) / n.trials

#P(X <= 6)
sum(X <= 6) / n.trials

#P(X > 2)
sum(X > 2) / n.trials

#another way to answer this question
#probs is the probability distribution of X
probs <- table(X)/n.trials

#add up P(X=2) + P(X=3) + P(X=4) + P(X=5)+P(X=6)
sum(probs[1:5])

#Counting

#factorial
factorial(6)

#permutations
#22P3
factorial(22)/factorial(22-3)

#combinations
# 20C3
choose(20, 3)


#probability of getting a flush (including straight flush,
# royal flush, any kind of flush)
4 * choose(13, 5) / choose(52, 5) 


#Suppose you have a population of students with ages:
pop.ages <- c(18, 19, 19, 20, 21, 25, 27, 28)

#a
choose(5, 3) / choose(8, 3)

#b
sum(combn(pop.ages, 3, function(x) median(x) > 19)) / choose(8, 3)

#c 
n.sims <- 10^6
n.sample <- 3

Xbars <- rep(0, n.sims)

for (i in 1:n.sims) {
  this.sample <- sample(pop.ages, n.sample, replace=TRUE)
  Xbars[i] <- mean(this.sample)
}
sum(Xbars > 19) / n.sims

#another way, which is faster because it avoids the for loop
samples <- matrix( sample(pop.ages, n.sample*n.sims, replace=TRUE), 
                   n.sample, n.sims)
Xbars <- colMeans(samples)
sum(Xbars > 19)/length(Xbars)



#all combinations of 3 letters selected from A,B,C,D,E
combn(c("A","B","C","D","E"), 3)

