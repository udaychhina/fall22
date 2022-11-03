#Author: Uday Singh Chhina
#Date: October 21, 2022
#Assignment: Midterm
#Course: MATH 1350

#import the EXCEL library
library(readxl)
#set working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Midterm2022")
data = read_excel("CPU.data.xlsx")

median(data$Heat.Output.Watts)
length(data$Clock.Speed.GHz)
mean(data$Clock.Speed.GHz)
sd(data$Clock.Speed.GHz) ^ 2
quantile(data$Clock.Speed.GHz, 0.80)
range(data$Clock.Speed.GHz)
Q3Y = quantile(data$Clock.Speed.GHz, 3/4)
quantile(data$Clock.Speed.GHz, 1/4)


Y = data$Clock.Speed.GHz
outlierUpLim = Q3Y + (1.5 * IQR(Y))
boxplot(Y, horizontal = TRUE)
outlierUpLim
table(Y)
sort(Y)

sdY = sd(Y)
xbarY = mean(Y)
zY = (0.5 - xbarY) / sdY
zY


W = data$Cache.MB
xbarW = mean(W)
sdW = sd(W)
(6.5 - xbarW) / sdW

z.scoresW = (W - xbarW) / sdW
length(z.scoresW[which(z.scoresW < 2 & z.scoresW > -2)]) / length(W)
max(W)
min(W)
(-2 * sdW) + xbarW

(2 * 15) + 100
28/40
6^3
dice.sample = c(1, 2, 3, 4, 5, 6)
n.sims = 10^6
count = 0
for(i in 1:n.sims) {
    sample = sample(dice.sample, 3, replace = TRUE)
    xbarS = mean(sample)
    if(xbarS >= 5) {
        count = count + 1
    }
}
count / n.sims




samplecores = c('1', '2', '3', '4', '5', '6', '7', '8')
n.sims = 10^5
n.success = c('5', '8', '1', '2', '3')
count = 0
for(i in 1:n.sims) {
    sam = sample(samplecores, 5, replace = TRUE)
    for(j in 1:5) {
        if(n.success[j] == sam[j]) {
            print(n.success[j])
            print(sam[j])
            count = count + 1
        }
    }
}
count/ n.sims
