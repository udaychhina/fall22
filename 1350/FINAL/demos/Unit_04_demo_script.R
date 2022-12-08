# Unit 04 - demo script
# Carl Gladish
# Sept 30, 2021 (Updated Jan 20, 2022)


#This code is for simulating the probability P(both balls are red) 
#when you select two balls from a bag containing 3 reds and 2 blues.

#define a variable representing the red and blue balls
bag <- c("R","R","R","B","B")

#simulate selection n.samples times
n.samples <- 10^5

#sample size 2
n.size <- 2

#initialize a vector to record for each sample whether both balls are red
both.red <- c()

#for loop for n.samples iterations
for (i in 1:n.samples){
    #select a random sample from the bag, without replacement
    sample.i <- sample(bag, n.size, replace=FALSE)
    
    #check whether all the balls in the sample are red and store the result
    both.red[i] <- all(sample.i == "R")
}

#now tabulate which samples were all red or not
table(both.red)

#the probability that a sample of two balls is both red
num.both.red = table(both.red)["TRUE"]

#P(both red)
num.both.red/n.samples


#We can also calculate this probability using combinations. (This code 
# is more advanced and I don't expect everyone to learn it.)

combinations <- combn(bag, 2)
n.all.red <- 0

n.all.red <- 
  sum(apply(combinations,
          2,                          #apply along dimension 2 (columns)
          function(col) all(col=="R") #apply this function to each column
          ))

#probability of obtaining an all-red combination
n.all.red/ncol(combinations)


### Two Aces example, using simulation ###
deck.cards <- c(rep("A",4), rep("B",48))

n.hands <- 10^5
n.success <- 0

#run a for loop for all the simulations
for (i in 1:n.hands){
  #draw 5 cards no replacement
  hand <- sample(deck.cards, 5, replace=FALSE)

  #if at least 1 Ace, success
  if(sum(hand=="A")>=1){
    n.success <- n.success+1  
  }
}

#P(at least one ace)
n.success/n.hands



###################
#Birthday problem #
###################

#number of simulations to run for each n.people
n.sims <- 10^5

#The largest possible n to consider is 365 people, but we can safely stop at 100
n.max.people <- 100

#n.people is the number of people in the room
n.people <- 2

#record the probability for each value of n.people
prob.n <- c()

while(n.people <= n.max.people){
  #checking rooms with n.people number of people
  
  #count how many simulations have two people with the same birthday
  n.successful.sims <- 0
  
  for (i.simulation in 1:n.sims){

    #simulate a random room with n.people
    people <- sample(1:365, n.people, replace=TRUE)

    #check for non-unique birthdays in the sample
    success <- length(unique(people)) < n.people
    
    if(success) {
      n.successful.sims <- n.successful.sims + 1
    }
  }
  prob.n[n.people] <- n.successful.sims / n.sims
  
  if (n.successful.sims/n.sims > 0.5) {
    print(paste("P(repeated birthdays) = ",
                n.successful.sims/n.sims,
                " > 0.5 for n.people = ", n.people,".",sep=""))
    break
  }else{
    print(paste("P(repeated birthdays) = ",
                n.successful.sims/n.sims,
                " < 0.5 for n.people = ", n.people,".",sep=""))
  }
  n.people <- n.people + 1
}

plot(1:length(prob.n),prob.n,xlim=c(0, 50))


### Birthday Problem Using probability Laws ###

#P(repeated birthdays) = 1 - P(all unique birthdays)

n.max.people <- 365

n.people <- 2

while(n.people <= 365){
  #Calculate probability of all unique birthdays
  #P(all unique)
  p <- 365/365
  
  #multiply out the conditional probabilities
  # (365/365)*(364/365)*...*(365-n.people+1)/365
  for(i in 1:(n.people-1)){
    p <- p*(365-i)/365
  }
  
  #P(repeated)
  print(paste("P(repeated) = ", 1 - p, " for n = ",n.people))
  
  if(1 - p > 0.5){ 
    break #found the minimum n.people
  }
  #increment by 1
  n.people <- n.people + 1

}


#An exact solution for the birthday problem with 3 people
#See reference:
# https://math.stackexchange.com/questions/25876/probability-of-3-people-in-a-room-of-30-having-the-same-birthday

#n is the number of people in the room
n <- 100
m <- 365  #days in the year

sum <- 0
i.max <- floor(n/2)

for (i in 1:i.max){
  t <- choose(m, i)*choose(m-i, n-2*i) * factorial(n)/
    (2^i * m^n)
  sum <- sum+t
}

#P(at least 3 people match) with n people in the room
P <- 1 - sum
P

