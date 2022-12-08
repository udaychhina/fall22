setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/week12")

data = read_excel("F2021_MATH_1350_Data.xlsx")

data = subset(data, !is.na(data$Income.Goal) & !is.na(data$Siblings))
cor.test(data$Siblings, data$Income.Goal)

#1

X = data$Siblings
Y = data$Income.Goal
correction <- 10^5

plot(X, Y,
     pch = 15, 
     xaxp = c(0, 3, 3),
     xlab = "Number of Siblings", 
     ylab = "Income Goals",
     main = "Regression line"
)

r = cor(X, Y); r
cor.test(X, Y)
model = lm(Y / 1 ~ X); model

abline(97902, 26830, col = "red")

yhat = 97902 + 4 * (2); yhat

#2

data <- read.table("SOCR-HeightWeight.txt",
                     header = TRUE, stringsAsFactors = TRUE
)
X = data$Height.Inches; X


Y = data$Weight.Pounds; Y
#a
plot(X, Y, 
     xlab = "Height (inches)", 
     ylab = "Weight (Ibs)", 
     main = "Scatter Plot")

#b
rho <- cor(X, Y); rho

#c
r.vals <- c()
is.sig <- c()
n.sims <- 10^4
n <- 30
N <- nrow(data)

for (i in 1:n.sims) {
    this.sample <- sample(1:N, n, replace = FALSE)
    X.sample <- X[this.sample]
    Y.sample <- X[this.sample]
    r.vals[i] <- cor(X.sample, Y.sample)
    # test for significance
    is.sig[i] <- cor.test(X.sample, Y.sample)$p.value < 0.05; 
    print(cor.test(X.sample, Y.sample)$p.value)
}

hist(r.vals,
     xlab = "Linear Correlation", 
     ylab = "Frequency",
     col = 2022, 
     main = "Sampling Distribution"
)

# d. For what percentage of samples does the correlation indicate a positive linear correlation?
rho <- mean(r.vals)
rho

sum(r.vals > 0) / n.sims

# e. For what percentage of random samples does the significance test correctly determine that
# there is a non-zero population correlation 𝜌? (This is called the power of the test.)

table(is.sig)[["TRUE"]] / n.sims