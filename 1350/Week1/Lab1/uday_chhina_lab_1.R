#Author: Uday Singh Chhina
#Date: September 9, 2022
#Student Number: A01210638

#load the library to read excel files
library(readxl)

#set the working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week1")

#read the file in after cleaning the data
data <- read_excel("Data/MATH_1350_Lab_01_Data.xlsx")

#PART 1
#create the color palette function for the pie chart
palette = colorRampPalette(c("cornflowerblue", "white"))

#create the pie chart for the Phone Brands
pie(table(data$Phone.Brand), col = palette(7), 
    main = "Distribution of Phone Brands")

#calculate the proportion of the iPhone users
#number of iPhone users
iphoneUsers <- c(table(data$Phone.Brand))["Apple"]
#number of total users
totalUsers <- length(data$Phone.Brand)
propAppleUsers <- iphoneUsers / totalUsers

#PART 2
#get the data without the NA values
histData <- data$Age[!is.na(data$Age)]

#create the histogram
hist(histData, xlab = "Age (Years)",
     main = "Distribution of Age, n = 58",
     freq = TRUE,
     breaks = seq(17.5, 35.5, 2),
     xaxp = c(17, 36, 19),
     col = "pink")

#PART 3

#income goal data excluding the missing values
incomeData <- data$Income.Goal[!is.na(data$Income.Goal)]

#sample size
length(data$Siblings)
length(incomeData)

#sample mean
mean(data$Siblings)
mean(incomeData)

#sample median
median(data$Siblings)
median(incomeData)

#mode
names(sort(-table(data$Siblings)))[1]
names(sort(-table(incomeData)))[1]

#range
max(data$Siblings) - min(data$Siblings)
max(incomeData) - min(incomeData)

#standard deviation
sd(data$Siblings)
sd(incomeData)

#variance
var(data$Siblings)
var(incomeData)

#skewness
3 * (mean(data$Siblings) - median(data$Siblings)) / sd(data$Siblings)
3 * (mean(incomeData) - median(incomeData)) / sd(incomeData)

#30th percentile
quantile(data$Siblings, 0.30)
quantile(incomeData, 0.30)

#inter-quartile range
IQR(data$Siblings)
IQR(incomeData)
