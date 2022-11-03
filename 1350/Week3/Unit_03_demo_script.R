# Demo Script - Unit 03
# Carl Gladish
# Sept 23, 2021 (updated July 13, 2022)

#Example of using the function sample() to randomly
#select items from a list
sample(c(1,2,3,5,6,7,8,9,10), 25, replace=TRUE)
sample(c(1,2,3,5,6,7,8,9,10), 25, replace=FALSE)  #doesn't work


#Simulate 100,000 dice rolls of two die
n.trials <- 10^5

die1 <- sample(c(1,2,3,4,5,6), n.trials, replace=TRUE)
die2 <- sample(c(1,2,3,4,5,6), n.trials, replace=TRUE)

X <- die1+die2  #sum of the two die

#default histogram of a numerical variable
hist(X)

#a histogram with one rectangle for each integer value of X
hist(X, 
     breaks=seq(1.5,12.5,1), #first rectangle goes from 1.5 to 2.5, etc.
     xaxp=c(2,12,10),  #tick marks at each integer from 2 to 12
     freq=FALSE,   #using probability on y-axis
     col="lightblue",
     main="Probability Histogram of X = Sum of Two Dice")

#P(X = 2)
X == 2           #check each X if it equals 2
sum( X == 2)     #add up how many TRUEs there are
sum(X == 2) / n.trials   #calculate the fraction of Xs that equal 2

#P(X = 7)
sum(X == 7) / n.trials

#P(X <= 6)
sum(X <= 6) / n.trials

#P(X > 2)
sum(X > 2) / n.trials

#another way to find the probabilities
probs <- table(X)/n.trials
probs

#add up P(X=2) + P(X=3) + P(X=4) + P(X=5)+P(X=6)
sum(probs[1:5])

#Law of Large Numbers demonstration

n.coins.max <- 1*10^6
delta.n <- 500
n.coins <- 0
x.heads <- 0
p.heads <- c()

while(n.coins < n.coins.max){
  
  #flip another batch of coins
  new.flips <- sample(c("H","T"), delta.n, replace=TRUE)
  
  #find the new total number of heads
  x.heads <- x.heads + sum(new.flips == "H")
  
  #find the new total number of flips
  n.coins <- n.coins + delta.n

  #new empirical probability of heads based on all flips so far
  p.head <- x.heads / n.coins
  
  #record it to make a graph later
  p.heads <- append(p.heads, c(x.heads / n.coins ))

    
}

plot(seq(delta.n,n.coins.max,delta.n)/10^6,
     p.heads, type = "l",
     ylim=c(0.49, 0.51),
     xlab="number of coins (x 10^6)",
     ylab="proportion of heads",
     main="Demonstration of Law of Large Numbers")
lines(c(0, n.coins.max),c(0.5, 0.5),type="l",lty=1,
      col="pink")


#Simulating red and blue marbles
bag <- c(rep("R",3), rep("B",2)); bag
n.sims <- 10^5
A.occurs <- c()
B.occurs <- c()

for(i.sim in 1:n.sims){
  two.balls <- sample(bag, 2, replace=FALSE)
  A.occurs[i.sim] <- two.balls[1]=="R"  
  B.occurs[i.sim] <- two.balls[2]=="R"
}
P.A <- sum(A.occurs)/n.sims
P.B <- sum(B.occurs)/n.sims
P.AB <- sum(A.occurs & B.occurs) / n.sims

#Counting

#License plates
26*26*9*9*9*26

#Lotto 649
49*48*47*46*45*44  #sequences of 6 numbers

49*48*47*46*45*44 / (6*5*4*3*2*1) #combinations of 6 numbers
choose(49, 6)   #built-in function for combinations

#factorial
factorial(6)

#permutations of 22 students
factorial(22)

#permutations of 4 balls out of 6
factorial(6)/factorial(2)

#permutations of students
#22P22
factorial(22)
#22P3
factorial(22)/factorial(22-3)

#paths through a network with 5 nodes
factorial(5)

#combinations
# 20C3
factorial(20)/(factorial(17)*factorial(3))
choose(20, 3)

#probability of getting a flush (including straight flush,
# royal flush, any kind of flush)
4 * choose(13, 5) / choose(52, 5) 


#population of students
pop.ages <- c(18, 19, 19, 20, 21, 25, 27, 28)

#a. P(all three older than 19)
choose(5, 3) / choose(8, 3)

#b. P(median of three is greater than 19)
all.combn <- combn(pop.ages, 3)
all.medians <- apply(all.combn, 2, median) #take median of each column
sum(all.medians > 19) / ncol(all.combn) #P(median > 19)

#c. P(mean > 19) using simulation

n.sims <- 10^5
Xbar.vals <- c()

for (i in 1:n.sims){   # i indicates which simulation we are on
  this.sample <- sample(pop.ages, 3, replace=TRUE)
  Xbar.vals[i] <- mean(this.sample)
}

sum(Xbar.vals > 19) / n.sims

hist(Xbar.vals, freq=FALSE,
     xlab="Sample Mean X-bar",
     main="X-bar for 100,000 simulated samples",
     col="pink")

#another way to do the simulation which is faster
#because it avoids the for loop
samples <- matrix( sample(pop.ages, 3*n.sims, replace=TRUE), 
                   3, n.sims )
Xbar.vals <- colMeans(samples)
sum(Xbar.vals > 19)/length(Xbar.vals)


#all combinations of 3 letters selected from A,B,C,D,E
choose(5,3)
combn(c("A","B","C","D","E"), 3)

