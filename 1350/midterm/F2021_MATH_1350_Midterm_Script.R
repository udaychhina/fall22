# Midterm Exam - Fall 2021
# Author: Carl Gladish
# Oct 18, 2021

library(readxl)

setwd(Sys.getenv("ONEDRIVE"))
setwd("Teaching/BCIT_F2021_MATH_1350/F2021_MATH_1350_Midterm_and_Final/")

#load Excel data
df <- read_excel("MATH_1350_Midterm_Data.xlsx")

#sample size
n <- nrow(df)

#Q1c
#make a frequency table to find the mode of Phone.Brand
table(df$Wears.Glasses) 


#Q1e
mu.Siblings <- mean(df$Siblings)
sd.Siblings <- sd(df$Siblings)

#Q1f
#86th percentile
P86 <- quantile(df$Siblings, 0.86)

#Q1g
#test for unusual value
x <- 0
z <- (x-mu.Siblings)/sd.Siblings

#Q1h
#list outliers in Siblings
boxplot(df$Siblings, horizontal=TRUE)

#Q1i
boxplot(df$Age~df$Owns.Car, horizontal=TRUE,
        xlab="Age", ylab="Owns.Car",
        main="Comparison of Ages of Car Owners and Non-Owners")

#compute mean for each group
mean(df$Age[df$Owns.Car=="Yes"])
mean(df$Age[df$Owns.Car=="No"])

#compute median for each group
quantile(df$Age[df$Owns.Car=="Yes"],0.5)
quantile(df$Age[df$Owns.Car=="No"],0.5)

#compute mode of each group
table(df$Age[df$Owns.Car=="Yes"])
table(df$Age[df$Owns.Car=="No"])

#Q1j

#synthetic data for first histogram question
weight.student <- c(68,68,66,62,77,61,66,64,73,79,
                    61,62,71,59,63,71,71,68,83,76,
                    61,54,54,77,71,63,60,50,76,78,
                    78,56,66,63,61,50,67,73,75,66,
                    60,67,75,56,62,65,63,72,59,59)
#weight.student <- round(rnorm(50, 65, 9),0) #original source
#weight.student[weight.student < 50] 
table(weight.student)
summary(weight.student)
mean(weight.student)
sd(weight.student)

hist(weight.student, breaks=seq(44.5,89.5,5),
     xlim=c(45,90), ylim=c(0,16),
     xaxp=c(35,100,13),yaxp=c(0,16,8),
     col="pink",
     xlab="Mass (kg)", ylab="Frequency",
     main="Histogram of Mass of Students in MATH 1350",
)
abline(h=seq(0,16,1),col="lightgrey",lty="dotted")

#Q1jii
sum(weight.student < 74.5)/50


#Q2a
hist(df$Laptop.Score,breaks=seq(50,150,5),
     xlim=c(40,150), ylim=c(0,10),
     xlab="Laptop.Score", ylab="Density",main="Probability Density of Laptop.Score",
     )

mu.Laptop <- mean(df$Laptop.Score)
sd.Laptop <- sd(df$Laptop.Score)
z <- (93.2 - mu.Laptop)/sd.Laptop
z

#Q2b
z <- 2.5
x <- mu.Laptop + z*sd.Laptop
x

#Q2c
k <- 2
round(mu.Laptop - k*sd.Laptop,1)
round(mu.Laptop + k*sd.Laptop,1)

#Q2e
k <- 1
sum( (mu.Laptop - k*sd.Laptop < df$Laptop.Score) &
             (mu.Laptop + k*sd.Laptop > df$Laptop.Score) ) / n

#Q2fi
Z <- (df$Laptop.Score - mu.Laptop)/sd.Laptop
mean(Z)
sd(Z)

#Q2fii
sum(0<=Z & Z<=2)/n


#Q3
prop.table(table(df$Gender))

#Q4
table(df[c("Owns.Car","Phone.Brand")])


#Q5
df$Eye
table(df$Eye)

#Q6a
prop.table(table(df$Gender))

#Q6e
n.sims <- 2*10^6
n.success <- 0

for (i in 1:n.sims){
        this.sample <- sample(df$Eye, 3, replace=FALSE)
        if(length(unique(this.sample)) < 3){
                n.success <- n.success + 1
        }
}

n.success / n.sims
