#Unit 02 - Lab 2
#Author : Shanti Stein-Gagnon
#A01229344, Set B
#Jan 11th, 2022

#importing the data and set my working directory
library(readxl)
setwd("C:/Users/fishf/Desktop/schoolstuff/Term2/Stats/labs/lab2/")
data <- read_excel("MATH_1350_F2021_Data.xlsx")


#Question One
#find the standard deviation and mean (mu and sigma)
#for income
mu <- mean(data$Income.Goal, na.rm = TRUE)
stand <- sd(data$Income.Goal, na.rm = TRUE)

#get the z scores
z_income <- (data$Income.Goal - mu)/ stand

#sizes of pop N
n_income <- sum(table(data$Income.Goal), na.rm = TRUE) #this is 50

#draw the histogram
hist(z_income, breaks = "Sturges",
     freq = FALSE, main = "Z-scores of Income Goals for MATH 1350, n=50",
     xlab="Income Goal (Z-score)", ylab = "Probability Desnsity",
     col = "red")

#part a
sum((data$Income.Goal-mu)>stand, na.rm = TRUE) #3 so it's 3/50

#part b
#Unusual values: z < -2 or z > 2
data$Income.Goal[(z_income < -2.0 | z_income > 2.0) & !is.na(z_income)] #3


#Question Two
#get the size value
N_sibling <- sum(table(data$Siblings), na.rm = TRUE)

#removing the NAN values
sib_data <- na.omit(data$Siblings)

#draw hist
hist(sib_data, main = "Histogram of Student Siblings, n= 58",
     freq=TRUE, breaks = seq(0, 9, 1), xaxp = c(0,9,9), right=F,
     col = "#CF4371", xlab = "Number of Siblings")

#part a
q1 <- quantile(data$Siblings, 0.25, na.rm = TRUE)
q2 <- quantile(data$Siblings, 0.5, na.rm = TRUE)
q3 <- quantile(data$Siblings, 0.75, na.rm = TRUE)

#part b
siblings_p5 <- quantile(data$Siblings, 0.05, na.rm = TRUE)
siblings_p90 <- quantile(data$Siblings, 0.90, na.rm = TRUE)

#part c
IQR <- q3-q1
lower <- q1 - IQR*1.5
upper <- q3 + IQR*1.5
outliers <- data$Siblings[(upper < data$Siblings | 
                            lower > data$Siblings) & !is.na(data$Siblings)]
#question 3
options(scipen = 999) #removing the scientific notation. I find it hard to read.
boxplot(data$Income.Goal~data$Gender, horizontal = TRUE,
        main = "Gender Differences In Goal Incomes, n=49",
        xlab = "Income Goal ($)", ylab = "Gender") #run a plot=FALSE for n values

