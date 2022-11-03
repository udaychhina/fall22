# Unit 04 - demo script
# Carl Gladish
# Sept 30, 2021 (Updated July 25, 2022)


## Two Aces, using probability laws ##
1 - choose(48, 5)/choose(52, 5)

## Two Aces example, using simulation ##
deck.cards <- c(rep("A",4), rep("B",48))
n.hands <- 10^5
n.success <- 0

#Simulate selecting 5 cards over and over using a for loop
for (i in 1:n.hands){
  #draw 5 cards, no replacement
  hand <- sample(deck.cards, 5, replace=FALSE)

  #if at least 1 Ace, success
  if(sum(hand=="A")>=1){
    n.success <- n.success+1  
  }
}

#P(at least one ace)
n.success/n.hands



## Birthday problem ##

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


