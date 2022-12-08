

setwd("./data")

##Read CVS (with a header)
#setwd("C:/Users/fishf/OneDrive/Desktop/MATH_FINAL/FINAL/data")
data <- read.delim("data.txt",header=TRUE,stringsAsFactors=TRUE,
                   sep=",")
data

#Read an Excel
library(readxl)
data_excel <- read_excel("data.xlsx")
data_excel



dice <- c()

mean_dice <- c()


for (i in 0:10^5){
  dice[i] <- mean(sample(1:6, 2, replace=TRUE))

}

sd(dice)
mean(dice)




owns_car <- data
table(owns_car) #true 219

n <- length(data)
n

#prop.test(x, n, alternative = "two.sided"/"less"/"greater", conf.level= 0.95, correct=FALSE)



#E (if E is 95)
# alpha <- 1 - 0.95
# z.crit <- qnorm(1 - alpha/2)
#phat <- 219/n
#E <- z.crit * sqrt(phat*(phat)/n)
#lower.limit <- p - E
#upper.limit <- p + E


#to verify that the phat is normal np >5


prop.test( length(with(data$Owns.Car, TRUE)), length(data$Owns.Car) )



set <- c( rep(0,3), rep(1, 11), rep(2,6), 3, 4,4 )
set
mean(set)
median(set)
sd(set)

dice <- c()

for (i in 0:10^5){
  dice[i] <- mean(sample(seq(1,6,1), 2))
}

mean(dice)
sd(dice)



bby_set <- subset(data, Campus == "BBY")$Work.Experience 
dtc_set <- subset(data, Campus == "DTC")$Work.Experience



##practicing mean paired

#d <- X1 - X2
d <- c(11.23, 14.36, 8.33, 10.50, 23.42, 9.15, 13.47, 6.47, 12.40, 12.40) - c(11.27, 14.41, 8.35, 10.52, 23.41, 9.17, 13.52, 6.46, 12.45, 19.35)
d

d.bar <- mean(d)
s.d <- sd(d)
n.d <- length(d)

t <- (d.bar - 0)/(s.d / sqrt(n.d))
t
P.value <- 1-pt(t,n.d-1)
P.value  


#practicing correlation


cor(data$Age, data$Student.Id)

cor.test(data$Age, data$Student.Id)




