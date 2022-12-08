#Unit 10 Demo Script
#Author: Carl Gladish
#Data: Nov 21, 2021 (modified July 27, 2022)

setwd(Sys.getenv("MATH_1350_ROOT"))

library(readxl)

#Import the data
data <- read_excel("Data/F2021_MATH_1350_Data.xlsx")

#remove any points where Age or Income.Goal are missing
data <- subset(data,
               !is.na(Age) & 
               !is.na(Income.Goal) &
                Income.Goal < 2.5e5) #excluding "outliers"

#define X and Y for convenience
X <- data$Age
Y <- data$Income.Goal

#sample size
n <- nrow(data)

#make a scatter plot of Age and Income.Goal
plot(X, Y)
plot(X, Y, type="p",  #type "p" (for point) 
     pch=16,
     xlab="X (Age)",ylab="Y (Income Goal)",
     main=paste("Age and Income.Goal for MATH 1350 Students (n = ",n,")",sep=""),
     xaxp=c(15, 35, 20)) #,yaxp=c(0, 8, 8))

#lm means "linear model"
model <- lm(Y~X)
model$coefficients
abline(model, col="red", lwd=3, lty=2) #add a line yhat = a + bx


#Linear Correlation Coefficient for Height and Weight of n=5 students
X <- c(150, 155, 160, 160, 175)
Y <- c(65,  72,  68,  80,  85)
n <- length(X)

#scatter plot
plot(X,Y, type="p",pch=19,
     xlab="X (height in cm)",ylab="Y (weight in kg)",
     main="Height and Weight, n = 5")

#calculate r from the formula
r <- (n*sum(X*Y) - sum(X)*sum(Y)) / 
  (sqrt(n*sum(X^2)-(sum(X))^2)*sqrt(n*sum(Y^2)-(sum(Y))^2))


#calculate r directly using R
cor(X,Y)

#test for significance "by hand"
t <- r/sqrt((1-r^2)/(n-2))

p.val <- 2*(pt(-abs(t), n-2))
p.val

#test of significance using built in cor.test function
res <- cor.test(X, Y)
res$p.value

#regression line
b <- (n*sum(X*Y)-sum(X)*sum(Y))/(n*sum(X^2)-(sum(X))^2)
a <- (sum(Y)*sum(X^2)-sum(X)*sum(X*Y))/(n*sum(X^2)-(sum(X))^2)

#regression line using lm
lm(Y ~ X)
model <- lm(Y ~ X)
model$coefficients
coefficients(model)[[2]]

#add the regression line to the plot
abline(model, col="red")

#use R to predict Weight of a person who is 160cm, 165cm, or 170cm
predict(model, data.frame(X=c(160, 165, 170)))

## Multi-linear Regression Example

#remove any points where Age, Height, or Siblings are missing
data2 <- subset(data, !is.na(Age) & 
                      !is.na(Siblings) & 
                      !is.na(Height))

#sample size
n <- nrow(data2)

#extract the variables being considered
X1 <- data2$Age
X2 <- data2$Height
Y  <- data2$Siblings

#determine the multi-linear model
model <- lm(Y~X1+X2)

coefficients(model)
summary(model)
a <- coefficients(model)[[1]]
b1 <- coefficients(model)[[2]]
b2 <- coefficients(model)[[3]]

#predicted number of siblings if X1=22 and X2=145
y.hat <- a+b1*22+b2*145
y.hat


## COVID-19 example from March 2020
dates <- seq(15,31)
cases <- c(341, 441, 598, 727, 873, 1087, 1328, 1470, 2091,
             2792, 3409, 4043, 4757, 5655, 6320, 7448, 8612)

plot(dates, cases, type="p", col="blue", 
     xlab="days since March 15", ylab="Cases",
     main="Number of COVID-19 cases in Canada for March, 2020")

model <- lm(cases~dates)
coefficients(model)
abline(model,col="red")

#nls = "nonlinear least squares"
exp.model <- nls(cases~A*exp(B*dates), start=list(A=1, B=0.5))
summary(exp.model)

A <- coef(exp.model)[["A"]]
B <- coef(exp.model)[["B"]]

x <- dates
y <- A*exp(B*dates)
lines(x,y, type="l", col="blue" )

#cases will reach 100,000 when?
# We must solve the equation 100000 = A*exp(B*x)
x <- log(100000/A)/B
x

