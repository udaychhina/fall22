#Unit 02 - Demo Script
#Author : Carl Gladish
#Sept 15, 2021 (updated July 7, 2022)

library(readxl)

#load data from all three sets of MATH 1350
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350")

#Our World in Data graph
mu_women <- 164.7 
sigma_women <- 7.1 

mu_men <- 178.4
sigma_men <- 7.6

#the exact probability P(164.7 < X < 171.8) for women
pnorm(171.8, mu_women, sigma_women) - pnorm(164.7, mu_women, sigma_women)


#Standard Normal Variable Z

#P(0 <= Z <= 1)

#a) Height of rectangle at x = 0.5 is
y_height <- 1/sqrt(2*pi)*exp(-1/2*0.5^2)
area_rectange <- y_height * 1

#b) table gives 0.8413 - 0.5000 = 0.3413

#c) using R
pnorm(1) - pnorm(0)

#################################################
##  How to plot a standard normal distribution ##
#################################################

#The next several lines (up to the integrate command) are just
#for your information. You don't need to know it for quizzes/tests.

#define a sequence of x values
x.vals <- seq(-4, 4, 0.1)

#define the density function f(x)
f <- function (x) 1/sqrt(2*pi) * exp(-1/2*x^2)

#calculate the y values that go with the x values 
y.vals <- f(x.vals)

#plot a line graph connecting the (x,y) points
plot(x.vals, y.vals, type="l",
     main = "Density Function of a Standard Normal Distribution")

#just as an example, shade in the region between x = 0 and x = 1
x_shade <- seq(0, 1, 0.1)
y_shade <- f(x_shade)

polygon(c(x_shade, 1, 0),
        c(y_shade, 0,  0), col="pink")

#Use R to calculate the area that was just shaded
integrate(f, 0, 1)   
######################################################

#More Z examples

#P(Z <= 1.96)
pnorm(1.96)

#P( -1.96 < Z <= 1.96)
pnorm(1.96) - pnorm(-1.96)

#P( Z = 1.96) = 0

#P( Z < 1.96 ) = same as P( Z <= 1.96)
pnorm(1.96)

#P( Z > 1.96) = 1 - P(Z <= 1.96)
1 - pnorm(1.96)


#P25 (25th percentile of Z)
qnorm(0.25)

#P75 (75th percentile of Z)
qnorm(0.75)
qnorm(0.75, mean=0, sd=1) #same thing


#read in Excel data for MATH 1350 students     
data <- read_excel("Week2/F2021_MATH_1350_Data.xlsx")

#cleanse any NA values from Height
Height <- data$Height[ !is.na(data$Height) ]

#sample size
n <- length(Height)

#find mu and sigma for Height (ignoring NA values)
xbar <- mean(Height)
s <- sd(Height)

#z-score for a student of height x=165
z1 <- (165 - xbar)/s
z1
#x for a student with z-score = -1.25
x1 <- xbar + (-1.25)*s
x1

#z-scores for Height
Z <- (Height - xbar)/ s    #all Height values at once


#histogram of Height values
hist(Height)
hist(Height,  breaks = "Sturges", #seq(149.5, 194.5, 5),
     xlim=c(140,200),
     xlab="Height (cm)", ylab = "Frequency",
     main=paste("Distribution of Height for students in MATH 1350",
                " ( n =", n, ")"))

#histogram of Z values for Height

hist(Z)
hist(Z, breaks = "Sturges",
     xlim=c(-3, 3),
     xlab="Z", ylab = "Frequency",
     main="Distribution of z-scores of Height in MATH 1350")


#count number of Z-scores greater than 0
Z > 0
sum( Z > 0 )

#probability (i.e., proportion) of students with Z > 0
sum( Z > 0 ) / n

#proportion of students where -1.0 < Z < 1.0
sum( -1.0 < Z & Z < 1.0) / n
  
#proportion of students where -2.0 < Z < 2.0
sum( -2.0 < Z & Z < 2.0) / n

#sum of all Z-scores
sum( Z )


#Women's Height Example Continued
#P(170 <= X <= 180)
(180 - mu_women)/sigma_women
(170 - mu_women)/sigma_women
pnorm(2.15493) - pnorm(0.7464789)

#alternatively:
pnorm(180, mu_women, sigma_women) - pnorm(170, mu_women, sigma_women)

#P(164.5 <= X <= 165.5)
pnorm(165.5, mu_women, sigma_women) - pnorm(164.5, mu_women, sigma_women)

#P(X = 165.000) = zero

#pdf y-coordinate at x = 165.0
dnorm(165.0, mu_women, sigma_women)

#P25
qnorm(0.25, mu_women, sigma_women)

#P75
qnorm(0.75, mu_women, sigma_women)

#Ordinary (usual) heights for women
mu_women - 2*sigma_women
mu_women + 2*sigma_women

#double check that 95% of women are in this range:
pnorm( 178.9, mu_women, sigma_women) - 
  pnorm( 150.5, mu_women, sigma_women)


#Italian Soldier example
mu_soldier <- 164.3
sigma_soldier <- 6.56

#P(170 < X < 172) exact value
pnorm(172, mu_soldier, sigma_soldier) - pnorm(170, mu_soldier, sigma_soldier)

#P(X > 170.86)
1 - pnorm( (170.86 - mu_soldier)/sigma_soldier)

#99.7% of soldiers are in the range
mu_soldier - 3*sigma_soldier
mu_soldier + 3*sigma_soldier

#usual heights of soldiers are in the range
mu_soldier - 2*sigma_soldier
mu_soldier + 2*sigma_soldier

#upper limit for outliers of soldier heights
Q1 <- qnorm(0.25, mu_soldier, sigma_soldier)
Q3 <- qnorm(0.75, mu_soldier, sigma_soldier)
upper.limit <- Q3 + 1.5*(Q3-Q1)
1 - pnorm(upper.limit, mu_soldier, sigma_soldier)

#IQ distribution
mu_IQ <- 100
sigma_IQ <- 15

#unusually high
mu_IQ + 2*sigma_IQ

#Chebyshev example for men's heights
(193.6 - mu_men) / sigma_men   #+2 sigmas
(163.2 - mu_men) / sigma_men   #-2 sigmas

#Chebyshev for k = 2 standard deviations
1 - 1/2^2

#Chebyshev example using X = Age for MATH 1350 students
Age <- data$Age[ !is.na(data$Age) ]
sort(Age)
n <- length(Age); n

Z <- (Age - mean(Age))/sd(Age)
sort(Z) #can see that only one student is not within 3 sigmas

x_usual <- sum( Z >= -3.0 & Z <= 3.0 )
p_usual <- x_usual / n
p_usual

1 - 1/3^2  #proportion from Chebyshev

#find values of Age that are more than 3 sigmas from mean
Age[ !(Z >= -3.0 & Z <= 3.0 )] 

#display histogram 
hist(Age)


