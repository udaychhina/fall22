#Demo script for Unit 01 - Descriptive Statistics
#Author: Carl Gladish
#Date: Sept 2021 (Revised June 20, 2022)

library(readxl)

#set the working directory of RStudio 
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week1")

#read in the sample of BCIT student ages
data <- read.delim("Data/BCIT_Sample_Age.txt")

#raw data
data$Age

#minimum and maximum values
min(data$Age); max(data$Age)

#Find the frequency distribution of data$Age using class limits
# 15 - 19
# 20 - 24
# 25 - 29
# ... and so on...
# 50 - 54

which.class <- cut(data$Age,       #data to use
                   seq(15, 55, 5), #lower class limits
                   right=FALSE)    #do not include next lower limit value

#find frequency of each class
table(which.class)

#find relative frequency distribution
prop.table(table(which.class))


#plot a histogram of X = age
hist(data$Age, freq=TRUE,
     breaks=seq(14.5, 54.5, 5),  #the class boundaries
     col="lightblue", border="darkblue",
     xlim=c(10, 55), xlab="Age (years)",
     xaxp=c(10,55,9),  #set the tick marks on x axis
     ylab="Frequency",
     main="Histogram of Age (n=100)")

#Median example
vals <- c(20, 40, 53, 64, 75, 82, 99)
median(vals)

vals <- c(12, 23, 27, 30, 70, 80, 90, 91)
median(vals)


#statistics of X=Age
mean(data$Age) #mean

Age.sorted <- sort(data$Age)
Age.sorted
sum(Age.sorted[c(50,51)])/2 #median based on sorted data
median(data$Age)  #direct method to get median value

names(which.max(table(data$Age)))[[1]] #mode of Age
mode(data$Age) #Note that the function mode() is not correct!!!

#Standard deviation example
vals <- c(18, 20, 21, 22, 24)

xbar <- sum(vals)/5
sqrt((1/4)*((18-xbar)^2 + 
              (20-xbar)^2+
              (21-xbar)^2+
              (22-xbar)^2+
              (24-xbar)^2))  #using the formula for s

sd(vals)  #direct method

#percentiles
sort(data$Age)
quantile(data$Age, 0.25)
quantile(data$Age, 0.53)  #not quite equal to 24.5 which is OK


#load the data for MATH 1350 students in September 2021
data <- read_excel("Data/F2021_MATH_1350_Data.xlsx")

#histogram of Student Ages with
#class boundaries: 4.5, 9.5, 14.5, 19.5, ...
hist(data$Age, 
     breaks=seq(14.5, 39.5, 5),
     xaxp=c(15, 40, 5),   #setting the "tick marks"
     freq=TRUE,axes=TRUE,
     col="pink",border="purple", 
     main="Histogram of Student Ages",
     xlab="Age (years)")

#What if there are missing values in X?
mean(data$Age)

#filter out NA values
!is.na( data$Age)
Age <- data$Age[! is.na( data$Age) ]
mean(Age)

#or a direct method 
mean(data$Age, na.rm = TRUE)

#boxplot of Age for MATH 1350 students in Fall 2021
boxplot(data$Age, horizontal =TRUE,
        range=0,  #whiskers go out to true min/max values
        xlab="Age (years)",
        main="Boxplot of Age for MATH 1350 Students",
        col="lightblue",border="black")

boxplot(data$Age, horizontal =TRUE,
        range=1.5,  #values more than 1.5xIQR beyond box are "outliers"
        xlab="Age (years)",
        main="Boxplot of Age for MATH 1350 Students",
        col="lightblue",border="black")

outlier.lower <- quantile(Age, 0.25)-1.5*(quantile(Age,0.75)-quantile(Age,0.25))
outlier.upper <- quantile(Age, 0.75)+1.5*(quantile(Age,0.75)-quantile(Age,0.25))

#outliers for Age
Age[ Age < outlier.lower | Age > outlier.upper]

n <- sum(!is.na(data$Age));n

#side-by-side boxplots
boxplot(Age~Set, data=data,
        xlab="Set", ylab="Age (years)",
        main="Age by Set for MATH 1350 students (n=57)",
        col=c("lightgreen","lightblue","pink"))

#skewness
Sk <- 3*(mean(Age)-median(Age))/sd(Age)
Sk

#Summarizing and Presenting Categorical Variables

#calculate frequency table for Eye colours
table(data$Eye.Colour)

#convert this to a relative frequency table
prop.table(table(data$Eye.Colour))
round(prop.table(table(data$Eye.Colour)),4)

#bar plot of Eye colour frequencies
barplot(table(data$Eye.Colour),
        xlab="Eye Colour", ylab="Frequency",
        main="Distribution of Eye Colours in MATH 1350",
        col="pink")

#bar chart of Eye colour relative frequencies
barplot(prop.table(table(data$Eye.Colour)),
        xlab="Eye Colour", ylab="Relative Frequency",
        main="Distribution of Eye Colours in MATH 1350",
        col="pink")

#pie char of same data
pie(table(data$Eye.Colour),main="Distribution of Eye Colours")

#sample proportion of students with Brown eyes
x.success <- sum(data$Eye.Colour == "Brown")
n.sample <- sum(!is.na(data$Eye.Colour))
p.hat <- x.success / n.sample; p.hat


#pulling out just the Eye.Colour and Wears.Glasses columns of data
data[c("Eye.Colour","Wears.Glasses")]

#two-way table for Eye color and Glasses
table(data[c("Eye.Colour","Wears.Glasses")])

n.size <- nrow(data); n.size

#proportion with Black eyes
sum(data$Eye.Colour == "Black")/ n.size

#proportion "Sometimes" wear glasses
sum(data$Wears.Glasses == "Sometimes") / n.size

#proportion Brown eyes AND "Yes" wears glasses
sum(data$Eye.Colour=="Brown" & data$Wears.Glasses=="Yes") / n
  
#proportion of Brown eyes among students who "Yes" wear glasses
sum(data$Eye.Colour=="Brown" & data$Wears.Glasses=="Yes") /
  sum(data$Wears.Glasses=="Yes")

#proportion of "Yes" wear glasses among students with Brown eyes
sum(data$Eye.Colour=="Brown" & data$Wears.Glasses=="Yes") /
  sum(data$Eye.Colour=="Brown")
