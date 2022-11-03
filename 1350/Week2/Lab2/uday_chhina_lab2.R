# Author: Uday Chhina
# Date: Sept 21, 2022
# Assignment: Lab 2

setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week2")

#read the excel file
library(readxl)

data = read_excel("Lab2/F2021_MATH_1350_Data.xlsx")

# Part 1

incomeGoals = data$Income.Goal[!is.na(data$Income.Goal)]
z = (incomeGoals - mean(incomeGoals))/sd(incomeGoals)

hist(z, 
     breaks = "sturges",
     freq = FALSE,
     col = "red",
     main = "Z scores of Income Goals",
     xlab = "Z - scores")

#a
length(z[which(z > 1)])/length(z)
#b
1 - pnorm(1, mean = 0, sd = 1)
#c
incomeGoals[z > 2 | z < -2]


# Part 2
sibling_data = data$Siblings
siblings = sibling_data[!is.na(sibling_data)]

hist(siblings,
     col = '#CF4371',
     freq = TRUE,
     xaxp = c(0, 8, 8),
     xlab = "Number of siblings",
     breaks = seq(-0.5, 8.5, 1))
#a.
q1_sibs = quantile(siblings, .25)
q2_sibs = quantile(siblings, .50)
q3_sibs = quantile(siblings, .75)

#b.
p5 = quantile(siblings, 0.05)
p90 = quantile(siblings, 0.90)

#c.
boxplot(siblings)

# Part 3
boxplot(data$Income.Goal ~ data$Gender, 
        horizontal = TRUE,
        ylab = "Gender",
        xlab = "Income Goals",
        main = "Income goals by gender")

