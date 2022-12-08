#Author: Shanti Stein-Gagnon
#Date: Jan 07, 2022
#Purpose: Lab 1 challange questions

library(readxl)

#set working directory
setwd("C:/Users/fishf/Desktop/schoolstuff/Term 2/Stats/labs/")

#read Excel data
lab1 <- read_excel("W2022_MATH_1350_Lab_01_Data.xlsx")

#generate pie chart
jpeg("Pie_Phones.jpeg", quality = 300)
pie(table(lab1$Phone.Brand),
          col= rainbow(length(table(lab1$Phone.Brand))),
          main="Relative Frequency of Phone Brands, n=59")
dev.off()
          
#calculate sample proportion

#total apple user count
applers <- table(lab1$Phone.Brand)[1]

#total count
totalCount <- sum(table(lab1$Phone.Brand))

#find sample as a %
sample <- applers/totalCount*100



#generate histogram
jpeg("Hist_Ages.jpeg", quality = 300)
hist(lab1$Age,
    breaks = seq(17.5, 35.5, 2),
    xaxp = c(16, 36, 20),
    freq=TRUE,axes=TRUE,
    main = "Age of CIT Class, n=58",
    col = "pink",
    xlab = "Student Ages (years)",
    ylab = "Frequency of Age") #don't forget to do some recalculations, Nan is present

dev.off()

#part 3 calculations

#n
nSiblings <- length(lab1$Siblings[! is.na(lab1$Siblings)])
nIncome <- length(lab1$Income.Goal[! is.na(lab1$Income.Goal)])

#mean
meanSiblings <- sum(lab1$Siblings)/nSiblings

realIncome <- lab1$Income.Goal[! is.na(lab1$Income.Goal)] # filter out the NA values
meanIncome <- sum(realIncome)/nIncome

#median
median(lab1$Siblings, na.rm=TRUE)
sort(lab1$Income.Goal)[round(length(lab1$Income.Goal)/2)]

#mode
table(lab1$Siblings) #look at the tables manually
table(lab1$Income.Goal)

#range
max(lab1$Siblings) - min(lab1$Siblings)
max(lab1$Income.Goal, na.rm=TRUE) - min(lab1$Income.Goal, na.rm=TRUE)

#sample standard deviation
sd(lab1$Siblings)
sd(lab1$Income.Goal, na.rm=TRUE)

#sample Variance
var(lab1$Siblings)
var(lab1$Income.Goal, na.rm=TRUE)
