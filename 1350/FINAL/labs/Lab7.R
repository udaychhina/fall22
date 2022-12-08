#Shanti Stein-Gagnon
#A01229344, Set B
#March 1st, 2022
#MATH 1350: lab 7



#Question 1
library(readxl)

data <- read.delim("C:/Users/fishf/OneDrive/Desktop/TERM_TWO/MATH1350/Lab6/failures.txt")
data.n <- length(data$X.fail)
#1. a) pop var

data.variance <- (sqrt((data.n-1)/data.n) * sd(data$X.fail))^2
data.variance

#1. b)
var1 <- function (X) (1/(length(X)-1))*sum((X-mean(X))^2) 
var2 <- function (X) (1/length(X))*sum((X-mean(X))^2)

data.var1 <- c()
data.var2 <- c()

for(i in 0:10^5){
  samples <- sample(data$X.fail, 5, replace = FALSE)
  data.var1[i] <- var1(samples)
  data.var2[i] <- var2(samples)
}

mean.var1 <- mean(data.var1)
mean.var2 <- mean(data.var2)
mean.var1
mean.var2

#Question 2
#X here is normal

X.fails = c(2,2,1,0,3,1,1,1,3,2)

#for each of the following, round the limit to one dec

#2. a) 95% confidence interval

sig.a <- sd(X.fails)
n <- length(X.fails)
Xbar <- mean(X.fails)

t.a <- qt(1-0.025, n-1)
e.a <- t.a*sig.a/sqrt(n)

Lower.a <- Xbar - e.a
Upper.a <- Xbar + e.a
Lower.a
Upper.a

#2. b) 90% confidence interval

t.b <- qt(1-0.1/2, n-1)
e.b <- t.b*sig.a/sqrt(n)

Lower.b <- Xbar - e.b
Upper.b <- Xbar + e.b
Lower.b
Upper.b


#Question 3

Defect <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
defect.n <- length(Defect)
defect.mean <- mean(Defect)

#3. a)


s.3.a <- sd(Defect)
alpha.3.a <- 0.01 #1-alpha = 0.99
t.a.3 <- qt(1-alpha.3.a/2, defect.n-1)
e.a.3 <- t.a.3*s.3.a/sqrt(defect.n)
Lower.3.a <- defect.mean - e.a.3
Upper.3.a <- defect.mean + e.a.3
Lower.3.a
Upper.3.a


