# Mike Picus
# A00858855


library(readxl)

setwd("C:\\Users\\misha\\OneDrive\\Desktop\\School\\sem2\\1350 - MATH")

f2021 = read_excel("F2021_MATH_1350_Data.xlsx")

f2021 = subset(f2021,
                !is.na(Siblings)&
                  !is.na(Income.Goal))

# 1) Consider the variables π = Siblings and π = Income.Goal
X = f2021$Siblings
Y = f2021$Income.Goal

#a. Create a scatter plot of π against π. Add labels and a title.
plot(X, Y/100000, pch=15, xaxp=c(0,3,3),
     xlab="Number of siblings", ylab="Income Goals (each 100k$)",
     main="Correlation of Siblings and Income Goal")

#b. Calculate the linear correlation coefficient π and test whether it is statistically significant.
r = cor(X,Y)
r

cor.test(X,Y)$p.value
#This indicates that the results are not statistically significant since the p.value is above significance level.

#c. Find the equation of the regression line π¦Μ = π + ππ₯. Plot the regression line on top of the
#scatter plot (use col = βredβ).

model = lm(Y/1~X)
model
abline(model, col="red")

#d. Use the regression line to predict the income goal of a student who has π₯ = 4 siblings.
y.hat = 97900 + 4*(26830)
y.hat



#2 Import the data set in the file SOCR-HeightWeight.txt, which contains the height and weight
#for a population of 25,000 people. Let π = Height.Inches and π = Weight.Pounds.
#a. Create a scatter plot of π against π. Add appropriate labels and a title.

data.2 = read.table("SOCR-HeightWeight.txt",
                     header=TRUE,stringsAsFactors=TRUE)
x.2 = data.2$Height.Inches
x.2

y.2 = data.2$Weight.Pounds
y.2

plot(x.2, y.2, xlab="Height (inches)", ylab = "Weight (Ibs)", main= "Correlation between Weight and Height")

#b. Calculate the population correlation coefficient π.
rho.2 = cor(x.2, y.2)
rho.2

#c.  Use R to simulate selecting 104 random samples (no replacement) of size π = 30 from this
#population. For each sample, find π and perform a significance test. Plot a histogram of the
#values of π obtained for the 10^4 samples. Label it appropriately.

#init values
r.vals = c()
is.sig = c()
n.sims = 10^4
n = 30
N = nrow(data.2)

for ( i in 1:n.sims){
  this.sample =sample( 1:N, n, replace=FALSE)
  X.sample = x.2[this.sample]
  Y.sample = y.2[this.sample]
  r.vals[i] = cor(X.sample, Y.sample)
  #test for significance
  is.sig[i] = cor.test(X.sample, Y.sample)$p.value < 0.05
}

hist( r.vals, xlab="Linear Correlation r", ylab="Frequency", 
      col=2022, main="Sampling Distribution of r")

#d. For what percentage of samples does the correlation indicate a positive linear correlation?
rho = mean(r.vals)
rho

sum(r.vals > 0)/n.sims

#e. For what percentage of random samples does the significance test correctly determine that
#there is a non-zero population correlation π? (This is called the power of the test.)

table(is.sig)[["TRUE"]]/n.sims

#3. In this challenge, you will use the data for MATH 1350 students to find a multi-linear model for the variable Income.Goal.

#a Find a multi-linear model for Income.Goal in terms of the other three numerical variables:
#π1 = Age, π2 = Height, and π3 = Siblings.

Y.3 = f2021$Income.Goal
X1 = f2021$Age
X2 = f2021$Height
X3 = f2021$Siblings
multi.model = lm(Y.3~X1+X2+X3)
multi.model

#b. If a studentβs Age increase by 1 year, what is the predicted change in their income goal?
multi.model[[1]][2]

#c. Predict Income.Goal for a student who is 23 years old, 147.5 cm tall, and has no siblings.
prediction = multi.model[[1]][1] + (23*multi.model[[1]][2]) + (147.5*(multi.model[[1]][3])) + (0*(multi.model[[1]][4]))
prediction         
