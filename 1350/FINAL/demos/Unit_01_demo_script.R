#Demo script for Unit 01 - Descriptive Statistics
#Author: Carl Gladish
#Date: Sept 2021 (Revised Dec 28, 2021)

setwd(paste(Sys.getenv("ONEDRIVE"),
            "/Teaching/BCIT_W2022_MATH_1350/First Day Stuff/",sep=""))
library(readxl)

data <- read_excel("MATH_1350_Example_Data.xlsx")

#calculate frequency table for Eye colours
table(data$Eye.Colour)

#convert this to a relative frequency table
prop.table(table(data$Eye.Colour))
round(prop.table(table(data$Eye.Colour)),4)

#bar plot of Eye colour frequencies
barplot(table(data$Eye.Colour),
        main="Frequency of Eye Colours",ylab="Frequency")

#pie char of same data
pie(table(data$Eye.Colour),main="Distribution of Eye Colours")

#two-way table for Eye color and Glasses
data[c("Eye.Colour","Wears.Glasses")]

table(data[c("Eye.Colour","Wears.Glasses")])

#histogram of Student Ages with
#class boundaries: 4.5, 9.5, 14.5, 19.5, ...
hist(data$Age, 
     breaks=seq(4.5,54.5,5),
     xaxp=c(10,55,9),   #setting the "tick marks"
     freq=TRUE,axes=TRUE,
     col="pink",border="purple", 
     main="Histogram of Student Ages",
     xlab="Age (years)")

h <- hist(data$Age, breaks=seq(4.5,54.5,5), plot=FALSE)
h$counts
h$breaks

#pie chart of phone brands
pie(table(data$Phone.Brand),main="Relative Frequency of Phone Brands for Set Z")


#mean, median, and mode

#What if there are missing values in X?

#filter out NA values
!is.na( data$Age)
Age <- data$Age[! is.na( data$Age) ]

sum(Age) / length(Age )

# or 
mean(data$Age, na.rm = TRUE)

#median
sort(data$Age)[14]

#median
median(data$Age, na.rm=TRUE)

#mode
mode(data$Age)  #not the function you think it is!
table(data$Age)


#standard deviation
X <- c(18, 20, 21, 22, 24)

#mean
mean(X)

#standard deviation
sd(X)
