#Unit 02 - Demo Script
#Author : Carl Gladish
#Sept 15, 2021 (updated Jan 9, 2022)

library(readxl)

#load data from all three sets of MATH 1350
setwd(paste(Sys.getenv("ONEDRIVE"),
      "/Teaching/BCIT_W2022_MATH_1350/W2022_MATH_1350_Data/",sep=""))
data <- read_excel("MATH_1350_F2021_Data.xlsx")

#find mu and sigma for Height (ignoring NA values)

mu <- mean(data$Height, na.rm = TRUE)
sig <- sd(data$Height, na.rm = TRUE)

#z-score for a student of height x=165
z1 <- (165 - mu)/sig

#x for a student with z-score = -1.25
x1 <- mu + (-1.25)*sig

#z-scores for Height
Z <- (data$Height - mu)/
         sig


#histogram of Height values
hist(data$Height,  breaks = "Sturges", #seq(149.5, 194.5, 5),
     xlim=c(140,200),
     xlab="Height (cm)", ylab = "Frequency",
     main="Distribution of Height for students in MATH 1350")

#histogram of Z values for Height
hist(Z, breaks = "Sturges",
     right=TRUE,
     xlim=c(-3, 3),
     xlab="Z", ylab = "Frequency",
     main="Distribution of z-scores of Height in MATH 1350")


#count number of Z-scores greater than 0
sum( Z > 0, na.rm = TRUE)

#number of Z-score that are not NA
n <- sum( !is.na(Z) )
n

#percentage of students where -1.0 < Z < 1.0
sum( -1.0 < Z & Z < 1.0, na.rm = TRUE) / n
  
#percentage of students where -2.0 < Z < 2.0
sum( -2.0 < Z & Z < 2.0, na.rm = TRUE) / n

#sum of all Z-scores
sum( Z, na.rm = TRUE)


#unusual Height values
data$Height[ (Z < -2.0 | Z > 2.0) & !is.na(Z)]


##How to plot a standard normal distribution (See Unit 2 video)#
#define a sequence of x values
x <- seq(-4, 4, 0.1)

#define the density function f(x)
f <- function (x) 1/sqrt(2*pi) * exp(-1/2*x^2)

#calculate the y values that go with the x values 
y <- f(x)

#plot a line graph connecting the (x,y) points
plot(x, y, type="l",
     main = "Density Function of a Standard Normal Distribution")

#just as an example, shade in the region between x = -2 and x = 0
x_shade <- seq(-2, 0, 0.1)
y_shade <- f(x_shade)

polygon(c(x_shade, 0, -2),
        c(y_shade, 0,  0), col="pink")

#Use R to calculate the area that was just shaded
integrate(f, -2, 0)   
2*integrate(f, -2, 0)$value

#Find probability P(-2 < Z < 0) for a standard 
# normal variable Z
pnorm(0) - pnorm(-2)  

#Percentiles and Quantiles
#Sorted Height Values
Height.Sorted <- sort(data$Height) #automatically omits NA values
n <- length(Height.Sorted) 

#Quartiles for Height
q1 <- quantile(data$Height, 0.25, na.rm = TRUE)
q2 <- quantile(data$Height, 0.5, na.rm = TRUE)
q3 <- quantile(data$Height, 0.75, na.rm = TRUE)
p92 <- quantile(data$Height, 0.92, na.rm = TRUE)

#Boxplot of Age
boxplot(data$Age, horizontal=TRUE,
        xlab="Age",
        main="Boxplot of Student Ages in MATH 1350")

sort(data$Age)

#Side by Side plots of Age for three sets in MATH 1350
boxplot(data$Age~data$Set, horizontal=TRUE,
        xlab="Age",ylab="Set",
        main="Comparison of Age across students in all Sets")


#Outlier limits
upper_lim <- q3 + 1.5 * (q3 - q1)
lower_lim <- q1 - 1.5 * (q3 - q1)

#extract any Height values that are outside of these limits
data$Height[(data$Height < lower_lim | data$Height > upper_lim) & 
            !is.na(data$Height) ]
