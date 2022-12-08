#shanti stein-gagnon
#A01229344

###NOTES TO KILL LATER


#import for Q1
setwd("C:/Users/fishf/OneDrive/Desktop/TERM_TWO/MATH1350/Lab10")
require(readxl)

f2021 <- read_excel("F2021_MATH_1350_Data.xlsx")

f2021 <- subset(f2021,
                !is.na(Siblings)&
                !is.na(Income.Goal))

X <- f2021$Siblings
Y <- f2021$Income.Goal

plot(X, Y/1000, pch=15, xaxp=c(0,3,3),
        xlab="Number of siblings", ylab="Income Goals (1$k)",
        main="Correlation of Siblings and Income Goal")


r <- cor(X,Y)
r

cor.test(X,Y)$p.value
#because the p value is too high they are not linearly correlated

#plot the line
model <- lm(Y/1000~X)
model
abline(model, col="red")

y.hat <- 97902 + 4*(26830)
y.hat



#Question 2
data.2 <- read.table("SOCR-HeightWeight.txt",
                   header=TRUE,stringsAsFactors=TRUE)
x.2 <- data.2$Height.Inches
x.2

y.2 <- data.2$Weight.Pounds
y.2

plot(x.2, y.2, xlab="Height (inch", ylab = "Weight (Ibs)", main= "Correlation between Weight and Height")

rho.2 <- cor(x.2, y.2)
rho.2

#init values
r.vals <- c()
is.sig <- c()
n.sims <- 10^4
n <- 30
N <- nrow(data.2)

for ( i in 1:n.sims){
  this.sample <-sample( 1:N, n, replace=FALSE)
  X.sample <- x.2[this.sample]
  Y.sample <- y.2[this.sample]
  r.vals[i] <- cor(X.sample, Y.sample)
  #test for significance
  is.sig[i] <- cor.test(X.sample, Y.sample)$p.value < 0.05
}

hist( r.vals, xlab="linear correlation r", ylab="Frequency", 
      col=2022, main="Sampling Distribution of r")


rho <- mean(r.vals)
rho

#both of these work
sum(r.vals > 0)/n.sims
table(is.sig)[["TRUE"]]/n.sims

#Question 3

#a
Y.3 <- f2021$Income.Goal
X1 <- f2021$Age
X2 <- f2021$Height
X3 <- f2021$Siblings
multi.model <- lm(Y.3~X1+X2+X3)
multi.model

multi.model[[1]][2]

prediction <- multi.model[[1]][1] + (23*multi.model[[1]][2]) + (147.5*(multi.model[[1]][3])) + (0*(multi.model[[1]][4]))
prediction         
