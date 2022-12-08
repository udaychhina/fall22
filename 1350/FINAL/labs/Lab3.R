#  Script - lab 03
# Shanti Stein-Gagnon
# A01229344, Set B
# Jan 18th, 2022


#importing the data
library(readxl)
setwd("C:/Users/fishf/OneDrive/Desktop/Term2(from_desktop)/Stats/labs/Lab3")
data <- read_excel("MATH_1350_F2021_Data.xlsx")

#Question 1

#part a: brown eyes and owns a car
brown_car_count <- sum(data$Eye == "Brown" & data$Owns.Car == "Yes")

#part b: Randomly selected brown eyes, do they own a car?
has_brown <- sum(data$Eye == "Brown")

#part c: randomly selected both wear glasses
table(data$Wears.Glasses) #29 yes, total of 58 
sum(table(data$Wears.Glasses), na.rm = TRUE)

choose(29, 2) / choose(58, 2) #choose two from population with glass / population total


#Question 2
#roll 4 fair dice 1,000,000 times, let mean = mean value of the four dice

#roll the dice a whole lot
trials <- 10^6
die1 <- sample(c(1,2,3,4,5,6), trials, replace=TRUE)
die2 <- sample(c(1,2,3,4,5,6), trials, replace=TRUE)
die3 <- sample(c(1,2,3,4,5,6), trials, replace=TRUE)
die4 <- sample(c(1,2,3,4,5,6), trials, replace=TRUE)

#mean of the rolls
#define the variable
mean_die <- rep(0, trials)
  
for (i in 1:trials){
  mean_die[i] <- (die1[i] +die2[i] + die3[i]+ die4[i])/4
}

#plot the histogram
hist(mean_die,
     freq=FALSE,
     breaks=seq(.75, 6,.25),
     xaxp = c(1,6.25,21),
     main="Probability of Dice Roll Averages",
     xlab="Mean Number Rolled",
     ylab="Density Rate")

#question 2, b
#what is the mode
table(mean_die) #look at this, it's 3.5


#question 2, c
#P(3 <= mean <= 4) (numbers are roll averages not z scores)
means_betweens <- 0

for (i in 1:trials){
  if((3 <= mean_die[i]) & (mean_die[i] <= 4)){
    means_betweens <- means_betweens +1
    }
}
estimated_probablility <- means_betweens/trials

#question 3
age_x <- c(21, 19, 19, 25, 23, 27, 43, 24, 19, 22)

#a, probability that a single student randomly selected is 22 or younger?
sum(age_x <= 22) # 5 so 50%

#simulated sample size of 4, 10^6 loops
#define the mean var
mean_ages <- rep(0, trials)
#fill it
for(i in 1:trials){
  mean_ages[i] <- mean(sample(age_x, 4, replace=FALSE))
}

#part b, plot it
hist(mean_ages,
     main= "Probability of Student Mean Ages",
     xlab= "Age(years)",
     ylab= "Density",
     freq= FALSE
) 

#part C, probability that all 4 are younger than 22
#I remade my loop for this one to help keep things separate
all_22 <- 0
for(i in 1:trials){
  counter <- 0
  total_of_4 <- sample(age_x, 4, replace=FALSE)
  for (i in 1:4){
    if(total_of_4[i] <= 22){
      counter <- counter+1
    }
  }
  
  if(counter == 4){
    all_22 <- all_22+1
  }
  
  
}
  
odds_all_22 <- all_22/trials


#question 3 part D
mean_22_true <- sum(mean_ages <= 22)
mean_22_true/trials*100

#question 3 part E, using a new generated total for readability
total_different <- 0
for(i in 1:trials){
  all_different_samples <- sample(age_x, 4)
  total_different <- total_different + sum(length(unique(all_different_samples)) == 4)
}

chance_of_odds <- total_different/trials 
