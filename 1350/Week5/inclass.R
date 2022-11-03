card.deck <- c(rep("A", 4), rep("B", 48))
n.sims <- 10^5
x.aces <- c()

for (i in 1:n.sims) {
  this.sample <- sample(card.deck, 5, replace=FALSE)
  print(sum(this.sample=="A"))
  x.aces[i] <- sum(this.sample=="A")
  sum(sample(card.deck, 5, replace = FALSE) == "A")
}

sum(table(x.aces)[2:5])/n.sims


#solve birthday problem

n.people.max = 366
for (n.people in 2:n.people.max){
  n.sims = 10^5
  has.match = c()
  
  for (i in 1:n.sims) {
    this.sample = sample(1:365, n.people, replace=TRUE)
    has.match[i] = length(unique(this.sample)) < n.people
  }
  P.match = sum(has.match)/n.sims
  print(paste("n.people =", n.people,
              "P(match) = ", P.match))
  if (P.match >= 0.50) {
    print(n.people)
    break
  }
}


P = 1
for ( i in 1:22) {
  P = P*(365 - i)/365
}
1 - P
