#Unit 09 Demo Script
#Carl Gladish
#Nov 28, 2021 (modified March 15, 2022)

#load data from text file

setwd(Sys.getenv("MATH_1350_ROOT"))

data <- read.delim("data\\two_campus_sample.txt",
                 header=TRUE,stringsAsFactors=TRUE,
                 sep=",")

########################
# iPhone Usage Example #
########################

#first visualize the data
data.table <- table(data[c("Uses.IPhone","Campus")])
data.table
h <- barplot(data.table,
          beside=TRUE, horiz=TRUE,
          ylab="Campus", xlab="Frequency",
          col=c("pink","darkgrey"),
          main="Comparison of iPhone Usage at BCIT Campuses")
legend(27, 6, c("non-iPhone","iPhone"), fill=c("pink","darkgrey"))

#separate sample into two groups
DTC.sample <- subset(data, Campus=="DTC")
BBY.sample <- subset(data, Campus=="BBY")

#sample statistics
x1 <- sum(DTC.sample$Uses.IPhone)
n1 <- nrow(DTC.sample)
phat1 <- sum(DTC.sample$Uses.IPhone)/nrow(DTC.sample)

x2 <- sum(BBY.sample$Uses.IPhone)
n2 <- nrow(BBY.sample)
phat2 <- sum(BBY.sample$Uses.IPhone)/nrow(BBY.sample)

pbar <- (x1+x2)/(n1+n2) #pooled proportion
qbar <- 1-pbar

#test statistic and P-value
z <- (phat1-phat2)/sqrt(pbar*qbar/n1+pbar*qbar/n2)
z
P.value <- 2*pnorm(z)
P.value

#95% confidence interval for p1-p2
E <- qnorm(1-0.05/2)*sqrt(phat1*(1-phat1)/n1+phat2*(1-phat2)/n2)
E
limit.lower <- (phat1-phat2)-E
limit.upper <- (phat1-phat2)+E

#all with one command
prop.test(c(x1, x2),c(n1, n2), alternative = "two.sided", correct=TRUE)


##################
# Age difference #
##################

Age.DTC <- with(data, Age[Campus=="DTC"])
Age.BBY <- with(data, Age[Campus=="BBY"])

par(mfrow = c(2,1))
hist(Age.BBY,breaks=seq(9.5, 59.5, 5))
hist(Age.DTC,breaks=seq(9.5, 59.5, 5),col="red")

#sample statistics
xbar1 <- mean(Age.DTC)
xbar2 <- mean(Age.BBY)
s1 <- sd(Age.DTC)
s2 <- sd(Age.BBY)
n1 <- length(Age.DTC)
n2 <- length(Age.BBY)

#test statistic and p.value
t <- (xbar1 - xbar2)/sqrt(s1^2/n1 + s2^2/n2)
t
p.value <- pt(t, df=min(n1-1, n2-1))
p.value

#Conf Interval for mu1-mu2
alpha <- 0.05
t_crit <- qt(1-alpha/2, min(n1,n2)-1)
t_crit
E <- t_crit*sqrt(s1^2/n1 + s2^2/n2)
E
limit.lower <- (xbar1-xbar2)-E
limit.upper <- (xbar1-xbar2)+E

#All in one
t.test(Age.DTC, Age.BBY, alternative="less")
t.test(Age.DTC, Age.BBY, alternative="two.sided")

#####################
# Weight Difference #
#####################
#d <- X1 - X2
d <- df$Mass.KG.2021 - df$Mass.KG.2020
d
hist(d)
d.bar <- mean(d)
s.d <- sd(d)
n.d <- length(d)
hist(d)
t <- (d.bar - 0)/(s.d / sqrt(n.d))
t
P.value <- 1-pt(t,n.d-1)
P.value  
