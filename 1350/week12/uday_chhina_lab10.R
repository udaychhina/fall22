setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/week12")

library(readxl)
data = read_excel("F2021_MATH_1350_Data.xlsx")

data = subset(data, !is.na(data$Income.Goal) & !is.na(data$Siblings))

#1

X = data$Siblings
Y = data$Income.Goal

plot(X, Y,
     xlab = "Number of Siblings", 
     ylab = "Income Goals",
     main = "Regression line"
)

r = cor(X, Y); r
cor.test(X, Y)
model = lm(Y / 1 ~ X); model

abline(model, col = "red")

yhat = 97902 + 4 * (26829.30); yhat

#2

data2 = read.table("SOCR-HeightWeight.txt",
                  header = TRUE, 
                  stringsAsFactors = TRUE)
X = data2$Height.Inches; X
Y = data2$Weight.Pounds; Y

rho = cor(X, Y); rho

plot(X, Y, 
     xlab = "Height (inches)", 
     ylab = "Weight (Ibs)", 
     main = "Correlation between Weight and Height")

r.vals = c()
is.significant = c()
n.sims = 10^4

for (i in 1:n.sims) {
    this.sample = sample(data$Index, 30, replace = FALSE)
    X.sample = X[this.sample]
    Y.sample = Y[this.sample]
    r.vals[i] = cor(X.sample, Y.sample)
    is.significant[i] = cor.test(X.sample, Y.sample)$p.value < 0.05
}

hist(r.vals,
     xlab = "Correlation", 
     ylab = "Frequency",
     main = "Sampling distribution")












