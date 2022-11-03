# Author: Uday Chhina
# Date: 23 Sept, 2022
# Lab 3

library(readxl)
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week3/Lab3")
data = read_excel("F2021_MATH_1350_Data.xlsx")

#Part one
#a
success = sum(data$Eye.Colour == "Brown" & data$Owns.Car == "Yes")
p.a = success / length(data$Set)
p.a

#b
browneyes = sum(data$Eye.Colour == "Brown")
ownsCar = sum(data$Owns.Car == "Yes" & data$Eye.Colour == "Brown")
p.b = ownsCar / browneyes
p.b

#c
wearsGlasses = sum(data$Wears.Glasses == "Yes" | data$Wears.Glasses == "Sometimes")
p.twoStudents = (wearsGlasses / length(data$Set)) * ((wearsGlasses - 1) / (length(data$Set) - 1))
p.twoStudents


#1c using simulation
S = c(rep("G", 34), rep("N", 25))
n.trials = 10^5

both.glasses = c()

for (i in 1:n.trials) {
  two.students = sample(S, 2, replace = FALSE)
  both.glasses[i] = (sum(two.students == "G") == 2)
}

table(both.glasses)
sum(both.glasses) / n.trials

# Part 2
#a
n.trials = 1000000
die = c(1, 2, 3, 4, 5, 6)

roll1 = sample(die, n.trials, replace = TRUE)
roll2 = sample(die, n.trials, replace = TRUE)
roll3 = sample(die, n.trials, replace = TRUE)
roll4 = sample(die, n.trials, replace = TRUE)

x.bar = (roll1 + roll2 + roll3 + roll4) / 4

hist(x.bar,
     freq = FALSE,
     breaks = seq(1, 6, 0.25),
     xaxp = c(1, 6, 5),
     col = "skyblue",
     main = "Histogram of X (mean of 4 die rolls)",
     xlab = "Mean of the 4 die rolls")


#b
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode = getmode(x.bar)

#c
sum(3 <= x.bar & x.bar <= 4)/sum(table(x.bar))


#Part 3
age = c(21, 19, 19, 25, 23, 27, 43, 24, 19, 22)
age
#a
length(age[which(age <= 22)]) / length(age)

#b
choose(5,4)/choose(10,4)

#c

sample1 <- sample(age, 10^6, replace = TRUE)
sample2 <- sample(age, 10^6, replace = TRUE)
sample3 <- sample(age, 10^6, replace = TRUE)
sample4 <- sample(age, 10^6, replace = TRUE)

sample.mean <- (sample1 + sample2 + sample3 + sample4) / 4

n.sims = 10^6
x.bar = c()
is.unique = c()

for (i in 1:n.sims){  
  this.sample <- sample(age, 4, replace=FALSE)
  x.bar[i] <- mean(this.sample)
  is.unique[i] = length(table(this.sample)) == 4
}

hist(x.bar, 
     freq = FALSE,
     col = "lightgreen",
     main = "Probability of sample mean",
     xlab = "Mean age")

#d
sum(x.bar <= 22) / 10^6

#e
sum(is.unique) / 10^6

