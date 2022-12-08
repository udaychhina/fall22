#Shanti Stein-Gagnon
#A01229344


#load in the data

library(readxl)

setwd("C:/Users/fishf/OneDrive/Desktop/TERM_TWO/MATH1350/Lab8/")

data <- read_excel("F2021_MATH_1350_Data.xlsx")


#Question One:

#a
#H0: P("Yes" or "Sometimes") <= 0.5
#H1: P("Yes" or "Sometimes")  > 0.5

#b
#extract the appropriate variable and filter out any NA values

wear.glasses.data <- data$Wears.Glasses[!is.na(data$Wears.Glasses)]

barplot(table(wear.glasses.data), ylab="Number of students", main="Students who Wear Glasses, n=58", xlab="response")

true.wears <- sum(wear.glasses.data == "Yes", wear.glasses.data == "Sometimes")

#part 0: compute statistics
#(qualitative n and p-hat are)
n.wear <- length(wear.glasses.data)
p.wear <- true.wears/ n.wear
n.wear
p.wear

#part 1: in notes
#H0: P("Yes" or "Sometimes") =< 0.5
#H1: P("Yes" or "Sometimes")  > 0.5

#part 2: compute z
p <- 0.5
q <- 1-p

z.wear<- (p.wear - .5)/sqrt(.5*(1-.5)/n.wear)
z.wear

#part 3: compute P-value
p.val.wear <- 1-pnorm(z.wear)
p.val.wear

#Question Two:


#H0: mu = 175
#H1: mu != 175


#extract the appropriate variable and filter out any NA values

height.data <- data$Height[!is.na(data$Height)]

hist(height.data, breaks=seq(120,220,10),
     ylab="Frequency (Number of Students)", main="Students Heights, n=58", xlab="Height (cm)")

#part 0: compute statistics n,x-bar,s
n.height <- length(height.data)
x_bar.height <- mean(height.data)
s.height <- sd(height.data)

n.height
x_bar.height
s.height

#part 1: null and alternative in notes


#part 2: compute t

t.height <- (x_bar.height - 175) / (s.height/ sqrt(n.height))
t.height
#check with a t test
t.test(height.data, alternative="two.sided", mu=175)


#part 3: compute P-value
#see t test as well
pt(-2.499, 57)*2






#Question 3:

#state the hypothesis
#H0: mu => 1
#H1: mu < 1

#extract the values
sib.data <- data$Siblings[!is.na(data$Siblings)]

#display the values
hist(sib.data, main="Histogram of Student Siblings, n=58", right=FALSE,
     xlab="Number of Siblings", breaks=seq(0, 10, 1), xaxp=c(0,10,10))

#part 0: compute statistics n,x-bar,s
n.sib <- length(sib.data)
x_bar.sib <- mean(sib.data)
s.sib <- sd(sib.data)

n.sib
x_bar.sib
s.sib

#compute the test statistic and p-value

t.test(sib.data, alternative="less", mu=1)





