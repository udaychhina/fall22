setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/week13")
library(readxl)

data = read.csv("Math_1350_Final_Exam_Data.txt")
data$Age
meanAge = mean(data$Age)

t.test(data$Age, conf.level = 0.90)
t.test    
cor(data$Age, data$Work.Experience)
cor.test(data$Age, data$Work.Experience)
