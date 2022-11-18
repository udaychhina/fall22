#PART 1
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/week10")
data <- read.delim("failures.txt")
failures = data$X.fail

#a
N = length(failures)
variance = (1/N) * (sum((failures - mean(failures))^2)); variance

#b
s.var <- function (X) (1/(length(X)-1))*sum((X-mean(X))^2)
p.var <- function (X) (1/length(X))*sum((X-mean(X))^2)

n.trials = 10^5
s.var.values = c()
p.var.values = c()
for(i in 1:n.trials) {
    s.failures = sample(failures, 5, replace = FALSE)
    s.var.values[i] = s.var(s.failures)
    p.var.values[i] = p.var(s.failures)
}

mean(s.var.values)
mean(p.var.values)

#PART 2
x = c(2, 2, 1, 0, 3, 1, 1, 1, 3, 2)
x.mean = mean(x)
x.sd = sd(x)
n = length(x)

#a 
alpha = 1 - 0.95
z.crit = qnorm(1 - alpha/2)
E = z.crit * (x.sd / sqrt(n))

upper.limit = x.mean + E; upper.limit
lower.limit = x.mean - E; lower.limit

#b
alpha = 1 - 0.90
z.crit = qnorm(1 - alpha/2)
E = z.crit * (x.sd / sqrt(n))

upper.limit = x.mean + E; upper.limit
lower.limit = x.mean - E; lower.limit

#PART 3
#Defect data for challenge 3.

Defect <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

n = length(Defect)
x = sum(Defect == 1)
p.hat = x/n
p.hat
q.hat = 1 - p.hat

#99 conf int for p 

alpha = 0.01
z.critc = qnorm(1 - alpha/2)
E = z.critc*sqrt(p.hat * q.hat/ n)

lower.limit = p.hat - E
upper.limit = p.hat + E

#99% confi int for p is 
#0.554 to 0.1446 (5.54% up to 14.6%)
#we are overall confidence that defect manufacturing process is between 4.6^% and 14.6%

#95%
alpha = 0.05
z.critc = qnorm(1 - alpha/2)
E = z.critc*sqrt(p.hat * q.hat/ n)

lower.limit = p.hat - E #0.0661
upper.limit = p.hat + E #0.1340
