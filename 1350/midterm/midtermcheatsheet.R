#####################################################################################
# MIDTERM PRACTISE 2021
library(readxl)
data = read_excel("C:\\Sync_folder\\Local_files\\Class\\MATH1350Stats\\
                  Midterm\\Review\\F2021_MATH_1350_Midterm_Data.xlsx")

#mode of data is highest frequency

#class mark is midpoint of modal class

#class limits are upper and lower values

#class boundaries are between limits of 2 classes

#class width is upper boundary - lower boundary =  a single number

table(data$Wears.Glasses)

mean(data$Siblings)

sd(data$Siblings)

quantile(data$Siblings, 0.86)

#z-score = (x - mean) / sd (-2 < z < 2 is an unusual data point)
0 - mean(data$Siblings) / sd(data$Siblings)

boxplot(data$Siblings, horizontal = TRUE)
#outliers are 4 and 5

(93.2 - mean(data$Laptop.Score)) / sd(data$Laptop.Score)

2.5 * sd(data$Laptop.Score) + mean(data$Laptop.Score)

#chebychevs theorem 1 - (1 / k ^ 2)
#1 - (1/2^2) = 0.75 = 2 standard deviations from mean

#calculate number of laptops score within 2 sd
mean(data$Laptop.Score) + sd(data$Laptop.Score) * 2 - (
    mean(data$Laptop.Score) - sd(data$Laptop.Score) * 2
)

#68% are within 1 sd, 95% are within 2 sd, 99 % are within 3 sd

#percentage of laptop scores within 1 sd
sum(mean(data$Laptop.Score) + sd(data$Laptop.Score) > data$Laptop.Score & 
        mean(data$Laptop.Score) - sd(data$Laptop.Score) < data$Laptop.Score) / 
    length(data$Laptop.Score)

#pnorm() = quantile to z-score, qnorm() = z-score to quantile

#standard normal curves have mean of 0 and sd of 1

#calculate P(0 <= z <= 2)
z.scores = (data$Laptop.Score - mean(data$Laptop.Score)) / 
    sd(data$Laptop.Score)

sum(z.scores > 0 & z.scores < 2) / length(data$Laptop.Score)

#probability that F1 = Gender is "female" for first student
sum(data$Gender == "Female") / length(data$Gender)

#are F1 and F2 independent? Yes because of replacement
#F2 = Gender is "female" for the second student
#is P(F1) = P(F2 | F1)

#permutations are ordered
#combinations are not ordered

#probability of choosing x out of n
#nPr/nPr
choose(3, 3) / choose(50, 3)

#probability of choosing not x
#1 - nPr/nPr
1 - choose(40, 3) / choose(50, 3)

#choose 3 probability that 2 have same eye color
n.sample = c(rep("Black", 10), rep("Blue", 5), rep("Brown", 32), 
             rep("Green", 3))
n.success = c()
n.trials = 10^5

for (i in 1:n.trials) {
    this.sample = sample(n.sample, 3, replace = FALSE)
    n.success[i] = length(unique(this.sample)) < 3
}

sum(n.success) / n.trials

#####################################################################################
# MIDTERM PRACTISE 2021 - MUNIB

#Munib Javed
#Practice Midterm
#Oct 16th 2022


library(readxl)
data = read_excel("C:\\Users\\munib\\OneDrive\\Desktop\\Statstic\\midterm\\F2021_MATH_1350_Midterm_Data.xlsx")

n = nrow(data)
#Question 1: Chapter1
#1) a) [1 mark] Which of the following could not be the population of interest?
#(Circle the correct answer.)
#i. All students in set D
#ii. All students in MATH 1350
#iii. All students at BCIT
#iv. All students in Canada
#The answer is A, as set D already exist in Set D


#b)b) [1 mark] Which of the following is not a statistic pertaining to this data?
#(Circle the correct answer.)
#i. 𝑛 = sample size
#ii. 𝐼𝑄𝑅 = sample inter-quartile range of Age
#iii. 𝑠
#2 = sample variance of Siblings
#iv. 𝜇 = population mean of Height
# The answer = mew population mean of height 


#c)c) [1 mark] What is the mode of the variable Wears.Glasses for this sample? (Just write the
#final answer.)
(table(data$Wears.Glasses))
#answer = 29 people wear glasses

#d)[1 mark] What is one problem with presenting the variable Phone.Brand using a chart
#like the following? Give a one-sentence answer.

#e) e) [2 marks] Find the mean and standard deviation of Siblings for this sample. Use the
#correct symbols and round your answers to two decimal places. (Final answer only.)
mean(data$Siblings)
#answer = 1.28 
sd(data$Siblings)
#answer = 1.125584


#f) [2 marks] Calculate 𝑃86 (the 86th percentile) for Siblings. Include supporting details.
#(You may use R’s algorithm or the simplified algorithm presented in class.)
quantile(data$Siblings, 0.86)
#the answer = 2.14%

#g) [2 marks] Would a student for whom Siblings = 0 be considered statistically unusual for
#this sample? Circle “Yes” or “No”. Include supporting details.
#Yes No (Circle one)


z = (data$Siblings - mean(data$Siblings)) / sd(data$Siblings)
z
unsual = z[z > 2 | z < -2] #I used the z formula of unusnal things to find, formula = z > 2 or z < -2. anything less then 2
# or more then 2 will be unsual
sum(table(unsual))
table(data$Siblings)
#yes there is an unsual value, 2 exactly.


#H)ist the values of all outliers for Siblings. (Final answer only.) [Hint: You can read the answer off the appropriate boxplot.]
boxplot(data$Siblings)
#there are 2 outliers after observing the boxplot made, the 2 outliers are 4 siblings and 5 siblings respectivily 


#I)[2 marks] Shown below are boxplots for the Age of students, grouped by the variable Owns.Car into car owners and non-owners.
#The answer is yes becasue the median for those who are older is 23 while the median for those whon are younger is only 22, the boxplot
#is also smaller for those who are younger and don't. 

#j)Assume that the mass of each student was measured and recorded as the variable Mass 
#rounded to the nearest kilogram. (You have not been given the raw data for this variable.)
#To plot a histogram of Mass, frequencies were tallied for the following classes (in kg):
#45-49, 50-54, 55-59, 60-64, and so on. The resulting histogram is shown below.

#j1) i. [1 mark] What are the class boundaries (lower and upper) for the modal class? #MODEL CLASS= CLASS WITH MOST FREQENCY


#j2) [1 mark] What percentage of students have Weight < 74.5 kg?
#The answer is 80% because we counted all the ones below 74.5kg which was 4+5+14+10+7 = 40 and there are 50 total students so 
40/50 # = 80%



#j3) [1 mark] In which class must the 30th percentile of Weight be located? State its lower and upper class limits.
#0.3 * 50 = 15 is how you would find it, so the first 15 students are in the 30th percentile. On the histogram this would
# be in 50-60kg

#Question 2: Chapter 2
#2)Suppose that each student’s laptop was benchmark tested using a standard computational task. The variable Laptop.Score contains
#the results (in mips = millions of instructions per second). Use the provided data set to answer the questions:


#2a)[2 marks] What is the 𝑧-score for a student whose benchmark result was Laptop.Score = 93.2 mips? Round
#to three decimal places. Include supporting details.

#z score = x -mean/sd
z_laptop_93 = (93.2 - mean(data$Laptop.Score)) / sd(data$Laptop.Score)
z_laptop_93
#The z-score for 93.2 is -0.3958542, we used the zscore formula to find this, x = 93.2 in the formula.

#2b) [1 mark] If the 𝑧-score for a student’s laptop is 𝑧 = 2.5, what is its Laptop.Score value?
# Round to one decimal place. Include supporting details.
#For this question, its basic algebra, you just do 2.5 = x - mean(siblings) / sd(siblings)
mean(data$Laptop.Score) #= 1.28 mean
sd(data$Laptop.Score) #= 1.125 SD

#so for this question, it would be 2.5 = x - 98.534 / 1.125 we use standard algebera, * both sides by SD and then add mean to left side
#to get x
#The answer x = 132.2 


#2c) c) [2 marks] Use Chebyshev’s Theorem to find an interval in which Laptop.Score must lie
#for at least 75% of individuals in the sample. Round to one decimal place. Include #supporting details.
#For this we use chebyshev theorem so which is 1 - 1/k^2 and we replace k with the number to get us 0.75 which is 2^2 which gives us
#1/4 = 0.25 which gives us 75%, but that is for exactly 0.75, we are looking for 75% and higher
#we use the formula so its + 2 and -2 to find between.
mean(data$Laptop.Score) + (2 * sd(data$Laptop.Score)) #125
mean(data$Laptop.Score) - (2 * sd(data$Laptop.Score)) #71 
#So the answer is between 125 and 71


#2d)[1 mark] The variable Laptop.Score is approximately normally distributed. According to the Empirical Rule, what percentage of individuals should lie within one standard
#deviations of the mean?

#The imperical rule states that 1 standard devation from x is 68%, so the answer for this would 68%. 


#2e) What is the actual percentage of individuals for which Laptop.Score is within one standard deviations of the mean? Include supporting details.
#We want to find total number of laptop scores within 1 standard deviation, we take mean and subtract 1 * standard devation and comapre to laptop values
#because -1 means lower and we want upper as well so we do + 1 and we do less for lower and greater then for + and we count using sum and divide
#by n which will give us %
total = sum((mean(data$Laptop.Score) - 1 * sd(data$Laptop.Score)) < data$Laptop.Score & mean(data$Laptop.Score) + 1 * sd(data$Laptop.Score) > data$Laptop.Score) / n
total

#2f) Let 𝑍 denote the 𝑧-score derived from Laptop.Score for individuals in this sample
#2fi) i. [1 mark] What are the mean and standard deviation of 𝑍?
#𝑍̅= 0  so the mean of z-score will always be 0 
#𝑠𝑍 = 1 and the standard d will always be 1 


#fii)If you randomly select one individual, what is 𝑃(0 ≤ 𝑍 ≤ 2)? (Final
#answer only

z = (data$Laptop.Score - mean(data$Laptop.Score)) / sd(data$Laptop.Score)
sum(0<= z & z <= 2) / n #you divide by the sample size because I want to know the probability and you always divide by sample size


#Question 3: Probability+counting

#3a)Consider the variable Gender for students in this sample. Suppose you randomly select two students with replacement. Define the events:
#𝐹1 = Gender is “Female” for first student
#𝐹2 = Gender is “Female” for second student
#Prop command gives you prop = proportion 
prop.table(table(data$Gender)) #This method to do it on r
table(data$Gender) #female = 9 and male =  41 , total =50
9/50 # = 0.18, same as using prop! 

#3b)
#they are Independent becasue it is with replacement. Everytime a female is first or male, after the second person will be either female or male becasue a new female or male will
#come in and replace the one being picked.


#Question 4 [5 marks total] A two-way table generated in R for the variables Owns.Car and Phone.Brand is shown below.

#Owns.Car  Apple  Google  OnePlus  Samsung
#No       9      2        2       10
#Yes     17      2        3        5

#Suppose you randomly select one student from the sample. Define the events:
#𝐶 = student owns a car
#𝐴 = student’s phone brand is Apple
#For each of the following, include supporting details.

#a) [1 mark] Calculate 𝑃(𝐴) =
#total iphone = 17+9 = 26 / #total amount of phones = 50
26/50 #= 52%
#P(A) = 52%


#b) [1 mark] Calculate 𝑃(𝐶) = 
(17+2+3+5) / 50 #total of cars / total given /n 
# answer = 54% 
#P(C) = 54%

#c)[1 mark] Calculate 𝑃(𝐴 ∩ 𝐶) = 17/50 because only 17 people own cars and have an apple phone
17/50
#answer = P(A ∩ C ) = 0.34 = 34%


#D)
0.52 * 0.54 #= 0.2808 
#P(A ∩ C )= 34%
#so becasue P(A) * P(C) != P(A ∩ C ), they are dependent on each other. 


#Question 5 [7 marks total] Suppose you flip 4 fair coins. The sample space can be represented as
#the following set of equally likely outcomes:
#𝑆𝑆 ={𝐻𝐻𝐻𝐻,𝐻𝑇𝐻𝐻,𝑇𝐻𝐻𝐻, 𝑇𝑇𝐻𝐻,
#       𝐻𝐻𝐻𝑇, 𝐻𝑇𝐻𝑇, 𝑇𝐻𝐻𝑇, 𝑇𝑇𝐻𝑇,
#       𝐻𝐻𝑇𝐻, 𝐻𝑇𝑇𝐻, 𝑇𝐻𝑇𝐻, 𝑇𝑇𝑇𝐻,
#     𝐻𝐻𝑇𝑇, 𝐻𝑇𝑇𝑇, 𝑇𝐻𝑇𝑇, 𝑇𝑇𝑇𝑇 }
#Define the events:
#  𝐴 = { 𝐻𝐻𝐻𝐻 } (or “all heads”)
#  𝐵 = { 𝑇𝑇𝑇𝑇 } (or “all tails”)


#For each of the following, include supporting details.
# a) [1 mark] Calculate 𝑃(𝐴 ∩ 𝐵) = 0 because there are no way that there can be all heads and all tails at the same time
# b) [1 mark] Calculate 𝑃(𝐴 ∪ 𝐵) = 2/16
2/16 # == 0.125% of it being either all heads or all tails 

# c) [1 mark] Calculate 𝑃(NOT𝐵̅) = 15/16 
15/16 #= 0.94% that it is not all tails


# [1 mark] Calculate 𝑃(𝐵|(GIVEN) A) = 14/16 
14/16
#answer = 0.9375 = 0.94%

#e) [1 mark] Are 𝐴̅and 𝐵̅ independent? Explain.
# P(NOT B)  * P(NOT A) === P(NOT A OR NOT B) to be independent
0.94 * 0.94 = # 0.8836 
    #P(NOT A OR NOT B) == 14/16 == 0.94 which is not same as 0.8836 meaning it is dependent on eachother
    
    #f) [1 mark] Calculate 𝑃(NOT 𝐴̅∩ 𝐵̅) =
    # 14/16 becasue it means what is probability of it being NOT ALL TAILS OR NOT ALL HEADS  = 
    14/16 #= 0.94%

#g) [1 mark] Calculate 𝑃(NOT 𝐴U NOT B ) = 1 or 100%

# It is 100% becasue in not A it will include all tails and in NOT B it will include all heads, therefore making the probability 100% 





#Question 6: [10 marks total] Data for the variable Eye is summarized in the frequency table below:
# Black      Blue       Brown    Green
#   10         5          32        3



#a) [2 marks] In how many ways can you select an ordered sequence of 3 students from this
#   sample (without replacement)? Include supporting details.

50 * 49 * 48 #= 117600 you can select sequence of 3 students without replacement 117600 times.


#b) [1 mark] If you randomly select an ordered sequence of 3 students (without replacement),
#what is the probability that all three students have green eyes? Include supporting details.
(3 * 2 * 1) / (50 * 49 * 48)    #or 

factorial(3) / (factorial(50) / factorial(47))

#c) [2 marks] If you randomly select an ordered sequence of 3 students (without
#replacement), what is the probability of obtaining at least one student with black eyes?
#Include supporting details.
#it is 1 minus becasue you are minus 100% from it and its 40 * rest becasue that 
#is number of people without black eyes, i.e 10 divided by total 3x becasue its asking for 3 students

1 - ((40 * 39 * 38) / (50*49*48))
#The answer is 0.4959148




#d) [2 marks] If you randomly select an ordered sequence of 3 students (without
#replacement), what is the probability of obtaining 2 students with brown eyes and 1 
#student with blue eyes? Include supporting details.
#How many ways can you choose 2 students that have brown eyes? 32 students with brown eyes, 32 choose 2 
#how many ways can you choose any 1 students with blue eyes? 5 students with blue eyes, 5 choose 1
#How many ways can you choose any 3 students? 50 choose 3 
choose(32, 2) * choose(5,1) / choose(50, 3)
#The asnwer = 0.1265306

###################################################################################
##################################3##############################################3#

########### LABS ##########################
#lab1 Lab 1350                              
#Jacky
# Sep/09/2022

#mode of data is highest frequency

#class mark is midpoint of modal class

#class limits are upper and lower values

#class boundaries are between limits of 2 classes

#class width is upper boundary - lower boundary =  a single number
#modal class = most frequent class 
#mode = the most frequently occurring number found in a set of numbers.
#X bar = avg
#s =  Stdev
# pnorm converts quantiles to z scores
#percentile = the intergrated area of a distribution graph 

#set Working folder
setwd("E:/BCIT CIT WORKS/1350Math2(R)")

#read data
library(readxl)
data= read_excel("MATH_1350_Lab_01_Data.xlsx")
data$Age

#finds Avg of age
mean(data$Age, na.rm=TRUE)

#table phone brand
y = table(data$Phone.Brand)
y

#sample size 
Tsample=sum(y)
Tsample

#sample proportion for iphone
p=28/Tsample
p

#create pie chart

pie(table(data$Phone.Brand),main = "phone brands",col = c(rgb(1,0.3,0.2),rgb(0.5,0.3,1),rgb(0.3,0.4,0.3),
                                                          rgb(0.1,0.8,0.3),rgb(0.1,0.2,0.7),rgb(0.1,0.4,0.8),
                                                          rgb(0.1,0.4,0.7),rgb(0.4,0.5,0.3),rgb(0.3,0.2,0.7)))



#create table
table(data$Age)
#create a histogram

#minimum and maximum values
min(data$Age); max(data$Age)

#Find the frequency distribution of data$Age using class limits

class = cut(data$Age,       #data to use
            seq(17.5,35.5, 2), #lower class limits
            right=FALSE)    #do not include next lower limit value

#find frequency of each class
table(class)

#find relative frequency distribution
prop.table(table(class))


#plot a histogram of X = age
hist(data$Age, freq=TRUE,
     breaks=seq(17.5, 35.5, 2),  #the class boundaries
     col="pink", border="darkblue",
     xlab="Age (years)",
     xlim=c(18,36.5), 
     xaxp=c(17,36,19),  #set the tick marks on x axis
     ylab="Frequency",ylim =c(0,20),
     main="Histogram of Age (n=100)")

#siblings sample size
sum(table(data$Siblings))
#income goal sample size
sum(table(data$Income.Goal))
#median for income goal data
options("scipen"=100)
quantile(data$Income.Goal,0.5,na.rm = TRUE)
xt=quantile(data$Income.Goal,0.5,na.rm = TRUE)
#income goal data mean
mean(data$Income.Goal,na.rm = TRUE)
xm=mean(data$Income.Goal,na.rm = TRUE)
#mode for income goal data
table(data$Income.Goal)
#range for income goal data
max(data$Income.Goal,na.rm = TRUE)-min(data$Income.Goal,na.rm = TRUE)
#stander Deviation for income goal data
sd(data$Income.Goal,na.rm = TRUE)
s=sd(data$Income.Goal,na.rm = TRUE)
#variance for income goal data
sd(data$Income.Goal,na.rm = TRUE)^2
#skewness for income goal data
(3*(xm-xt))/s
#P30 for income goal data
quantile(data$Income.Goal,0.3,na.rm=TRUE)
#IQR for income goal data
IQR(data$Income.Goal,na.rm = TRUE)

#siblings data mean
mean(data$Siblings,na.rm = TRUE)
xm2=mean(data$Siblings,na.rm = TRUE)
#median for sibling data
quantile(data$Siblings,0.5)
xt2=quantile(data$Siblings,0.5)
#mode for sibling data
table(data$Siblings)
#range for sibling data
max(data$Siblings)-min(data$Siblings)
#std for sibling data
sd(data$Siblings)
s2=sd(data$Siblings)
#variance for siblings
(sd(data$Siblings))^2
#skewness
(3*(xm2-xt2))/s2
#P30 calculation for sibling data
quantile(data$Siblings,0.3)
#IQR for sibling data
IQR(data$Siblings)

boxplot(data$Age~data$Set,main ="boxplot",xlab="set",ylab="age")




library(readxl)
data<-read_excel("F2021_MATH_1350_Data.xlsx")







#lab2 start

#Q1
#Plot a histogram for the 𝑧-scores based on the variable 𝑋 = Income.Goal for the population of all
#students in MATH 1350, where you:
#  • use the default “Sturges” method for the breaks.
#• plot probability density on the y-axis.
#• include suitable labels and give it a title.
#• make the rectangles red.
#Then answer the questions below.

#a. What fraction of students in MATH 1350 have Income.Goal values more than one standard
#deviation above the mean?

#  b. If Income.Goal followed a normal distribution, what fraction of students would have an
#income goal more than one standard deviation above the mean?

#  c. Find any unusual values of Income.Goal.



#Q1 graph


s = sd(data$Income.Goal,na.rm = TRUE)

AVG = mean(data$Income.Goal,na.rm = TRUE)

z = (data$Income.Goal[!is.na(data$Income.Goal)] - AVG)/s

hist(z,col="RED",freq = FALSE)
#a)
t1 = sum(table(z > 1))
3/t1
#b) find prob (area) of z more then 1
1 - pnorm(1, mean = 0, sd = 1)
#c) find value point to Z at 2.923....

2.92308137795738 * s + AVG 
3.31591725356494* s + AVG
4.8872607559951* s + AVG


#Q 2 

# Using the variable 𝑋 = Siblings for students MATH 1350, plot a histogram where:
# • each whole number has its own class and its own “tick mark”
# • plot frequency on the y-axis
# • use the RGB hex code #CF4371 as the colour
# Then calculate the following:

# a. The quartiles 𝑄1, 𝑄2, and 𝑄3.

# b. The percentiles 𝑃5 and 𝑃90.

# c. Determine if there are any outliers for this variable. If so, list them.




x = data$Siblings[!is.na(data$Siblings)]

#xapx = c(a,b,c) function for tick mark takes in array data where a is lower end b is upper end and c is how many steps

hist( x ,freq = TRUE ,col="#CF4371",breaks=seq(-0.5, 8.5, 1),xaxp=c(0,8,8), main="Histogram of Siblings data")

#a)
q1 = quantile(x,0.25)
q1
q2 = quantile(x,0.50)
q2
q3 = quantile(x,0.75)
q3
#b)
quantile(x,0.05)
quantile(x,0.90) 
#c)
ix = IQR(x)
ix
LowQ = q1 - ix * 1.5
LowQ
HighQ = q3 + ix *1.5
HighQ
#d)
x[x < LowQ]
x[x > HighQ]




# Q3
# Using the variable 𝑋 = Income.Goal, plot side-by-side boxplots (each one extending horizontally)
# comparing the salary expectations for Males and Females in MATH 1350. Label axes and provide a
# suitable title. What conclusion can you draw from this graph?

boxplot(data$Income.Goal ~ data$Gender ,horizontal = TRUE,xlab = "income goal",
        ylab ="Gender",main="income goal by gender")








#lab3 
library(readxl)
data<-read_excel("F2021_MATH_1350_Data.xlsx")


# 1. Use the data in the Excel file “F2021_MATH_1350_Data.xlsx”.
# a. Suppose you randomly select one student in the course. What is the probability
# that the student has brown eyes and owns a car?
# b. Suppose you randomly select a student who has brown eyes. What is the
# probability that this student owns a car?
# c. Suppose you randomly select two students (without replacement). What is the
# probability that they both wear glasses?


#1a
sum(table(data$Set))
owncar = data$Owns.Car == "Yes"
table(owncar)
table(owncar[data$Eye.Colour == "Brown"])
p1a = 27/59
p1a


#1b
beyes = data$Eye.Colour
sum(beyes[data$Eye.Colour=="Brown"])
table(beyes)
table(beyes[data$Owns.Car =="Yes"])
p1b = 27/43
p1bs


#1c
wearg = data$Wears.Glasses
weargs = data$Wears.Glasses


sum(table(wearg[data$Wears.Glasses == "Yes"]))
sum(table(weargs[data$Wears.Glasses =="Sometimes"]))
wearglases
table(wearg)

p1c = ((29+5)/59) * ((28+5)/58)
p1c



# 2. Suppose you roll four fair dice. Let 𝑋̅ = the mean value of the four die. Use R to simulate
# 4 × 1000,000 rolls (so that you end up with 1000,000 simulated values of 𝑋̅).
# a. Plot a probability histogram (freq=FALSE) of 𝑋̅. Give it suitable labels and title.
# b. What is the most likely value of 𝑋̅? (In other words, what is the mode of 𝑋̅?)
# c. Use the experimental data to estimate the probability that 3.0 ≤ 𝑋̅ ≤ 4.0.




#2a probability samples
n.trials = 1000000
dice1 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)
dice2 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)
dice3 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)
dice4 = sample(c(1,2,3,4,5,6), n.trials ,replace= TRUE)

x= (dice1+dice2+dice3+dice4)/4
hist(x, breaks = seq(0.25,6.5,0.25),
     xaxp = c(0.5,6.0,10),xlab="dice sum average",
     ylab="probability",
     freq = FALSE)

#2b (ans 3.5)
max(table(x))

#2c
sum( 3 <= x  & x <= 4)/sum(table(x))


#3a
n = 4 
datastuff = c(21,19,19,25,23,27,43,24,19,22)
y = table(datastuff <= 22)
5/10





#3b
choose(5,4)/choose(10,4)
#3c
xbar = c()
ages = 0 
is_unique = 0

for (i in 1:1000000){
    ages = sample(datastuff, 4, replace=FALSE)
    if (length(unique(ages)) == 4) {
        is_unique = is_unique + 1
    }
    xbar[i] = mean(ages)
    
}

hist(xbar,breaks = seq(18.5,30.5,0.5),
     main=" Average probability graph",
     xlab="Mean of student agaes",
     ylab="density",
     freq = FALSE)
#3d

ansd = sum(xbar<= 22) / 1000000
ansd

#3e
ans3e = is_unique/1000000
ans3e


####################################################################################
########################## LABS ME ################################################

#Author: Uday Singh Chhina
#Date: September 9, 2022
#Student Number: A01210638
#LAB1

#load the library to read excel files
library(readxl)

#set the working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week1")

#read the file in after cleaning the data
data <- read_excel("Data/MATH_1350_Lab_01_Data.xlsx")

#PART 1
#create the color palette function for the pie chart
palette = colorRampPalette(c("cornflowerblue", "white"))

#create the pie chart for the Phone Brands
pie(table(data$Phone.Brand), col = palette(7), 
    main = "Distribution of Phone Brands")

#calculate the proportion of the iPhone users
#number of iPhone users
iphoneUsers <- c(table(data$Phone.Brand))["Apple"]
#number of total users
totalUsers <- length(data$Phone.Brand)
propAppleUsers <- iphoneUsers / totalUsers

#PART 2
#get the data without the NA values
histData <- data$Age[!is.na(data$Age)]

#create the histogram
hist(histData, xlab = "Age (Years)",
     main = "Distribution of Age, n = 58",
     freq = TRUE,
     breaks = seq(17.5, 35.5, 2),
     xaxp = c(17, 36, 19),
     col = "pink")

#PART 3

#income goal data excluding the missing values
incomeData <- data$Income.Goal[!is.na(data$Income.Goal)]

#sample size
length(data$Siblings)
length(incomeData)

#sample mean
mean(data$Siblings)
mean(incomeData)

#sample median
median(data$Siblings)
median(incomeData)

#mode
names(sort(-table(data$Siblings)))[1]
names(sort(-table(incomeData)))[1]

#range
max(data$Siblings) - min(data$Siblings)
max(incomeData) - min(incomeData)

#standard deviation
sd(data$Siblings)
sd(incomeData)

#variance
var(data$Siblings)
var(incomeData)

#skewness
3 * (mean(data$Siblings) - median(data$Siblings)) / sd(data$Siblings)
3 * (mean(incomeData) - median(incomeData)) / sd(incomeData)

#30th percentile
quantile(data$Siblings, 0.30)
quantile(incomeData, 0.30)

#inter-quartile range
IQR(data$Siblings)
IQR(incomeData)

####################################################################################

#LAB 2
# Author: Uday Chhina
# Date: Sept 21, 2022
# Assignment: Lab 2

setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week2")

#read the excel file
library(readxl)

data = read_excel("Lab2/F2021_MATH_1350_Data.xlsx")

# Part 1

incomeGoals = data$Income.Goal[!is.na(data$Income.Goal)]
z = (incomeGoals - mean(incomeGoals))/sd(incomeGoals)

hist(z, 
     breaks = "sturges",
     freq = FALSE,
     col = "red",
     main = "Z scores of Income Goals",
     xlab = "Z - scores")

#a
length(z[which(z > 1)])/length(z)
#b
1 - pnorm(1, mean = 0, sd = 1)
#c
incomeGoals[z > 2 | z < -2]


# Part 2
sibling_data = data$Siblings
siblings = sibling_data[!is.na(sibling_data)]

hist(siblings,
     col = '#CF4371',
     freq = TRUE,
     xaxp = c(0, 8, 8),
     xlab = "Number of siblings",
     breaks = seq(-0.5, 8.5, 1))
#a.
q1_sibs = quantile(siblings, .25)
q2_sibs = quantile(siblings, .50)
q3_sibs = quantile(siblings, .75)

#b.
p5 = quantile(siblings, 0.05)
p90 = quantile(siblings, 0.90)

#c.
boxplot(siblings)

# Part 3
boxplot(data$Income.Goal ~ data$Gender, 
        horizontal = TRUE,
        ylab = "Gender",
        xlab = "Income Goals",
        main = "Income goals by gender")


####################################################################################

# Author: Uday Chhina
# Date: 23 Sept, 2022
# Lab 3

library(readxl)
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350/Week3/Lab3")
data = read_excel("F2021_MATH_1350_Data.xlsx")

#Part one
#a
success = sum(data$Eye.Colour == "Brown" & data$Owns.Car == "Yes")
p.a = success / length(data$Set)
p.a

#b
browneyes = sum(data$Eye.Colour == "Brown")
ownsCar = sum(data$Owns.Car == "Yes" & data$Eye.Colour == "Brown")
p.b = ownsCar / browneyes
p.b

#c
wearsGlasses = sum(data$Wears.Glasses == "Yes" | data$Wears.Glasses == "Sometimes")
p.twoStudents = (wearsGlasses / length(data$Set)) * ((wearsGlasses - 1) / (length(data$Set) - 1))
p.twoStudents


#1c using simulation
S = c(rep("G", 34), rep("N", 25))
n.trials = 10^5

both.glasses = c()

for (i in 1:n.trials) {
    two.students = sample(S, 2, replace = FALSE)
    both.glasses[i] = (sum(two.students == "G") == 2)
}

table(both.glasses)
sum(both.glasses) / n.trials

# Part 2
#a
n.trials = 1000000
die = c(1, 2, 3, 4, 5, 6)

roll1 = sample(die, n.trials, replace = TRUE)
roll2 = sample(die, n.trials, replace = TRUE)
roll3 = sample(die, n.trials, replace = TRUE)
roll4 = sample(die, n.trials, replace = TRUE)

x.bar = (roll1 + roll2 + roll3 + roll4) / 4

hist(x.bar,
     freq = FALSE,
     breaks = seq(1, 6, 0.25),
     xaxp = c(1, 6, 5),
     col = "skyblue",
     main = "Histogram of X (mean of 4 die rolls)",
     xlab = "Mean of the 4 die rolls")


#b
getmode <- function(v) {
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode = getmode(x.bar)

#c
sum(3 <= x.bar & x.bar <= 4)/sum(table(x.bar))


#Part 3
age = c(21, 19, 19, 25, 23, 27, 43, 24, 19, 22)
age
#a
length(age[which(age <= 22)]) / length(age)

#b
choose(5,4)/choose(10,4)

#c

sample1 <- sample(age, 10^6, replace = TRUE)
sample2 <- sample(age, 10^6, replace = TRUE)
sample3 <- sample(age, 10^6, replace = TRUE)
sample4 <- sample(age, 10^6, replace = TRUE)

sample.mean <- (sample1 + sample2 + sample3 + sample4) / 4

n.sims = 10^6
x.bar = c()
is.unique = c()

for (i in 1:n.sims){  
    this.sample <- sample(age, 4, replace=FALSE)
    x.bar[i] <- mean(this.sample)
    is.unique[i] = length(table(this.sample)) == 4
}

hist(x.bar, 
     freq = FALSE,
     col = "lightgreen",
     main = "Probability of sample mean",
     xlab = "Mean age")

#d
sum(x.bar <= 22) / 10^6

#e
sum(is.unique) / 10^6

# Author: Uday Chhina
# Date: Oct 7, 2022
# Assignment: Lab 4

# Part 1
# a
choose(26, 5)/choose(52, 5) + choose(26, 5)/choose(52, 5)

# b
1 - choose(26, 5)/choose(52, 5)

# c
# choose one type of card out of 13, then choose 3 out of those. Then choose
# one type of card out of the remaining 12, then choose 2 from them.
# Divide all of this by the combinations of 5 cards
choose(13, 1)*choose(4, 3)*choose(12, 1)*choose(4, 2) / choose(52, 5)




# Part 2
# a x = 1
# the probability of the first student having an iPhone is and the rest of them 
# having a phone which is not iPhone is 0.6 ^ 9
0.4 * 0.6^9
# There are 10 ways that they can be chosen. So we will multiply the probabilities
# with that
(0.4 * (0.6 ^ 9)) * choose(10, 1)

# b x >= 1
# the probability of at least 1 student being an iPhone user or the probability
# of no student being a non iPhone user.
# 1 - P(X = 0)
# all students being non iphone users: 0.6 ^ 10
1 - (0.6^10)
# there are 10 ways  we can choose these ten students
(1 - (0.6^10)) * choose(10, 10)

# c
# similar to part 2#a
(0.4^4 * 0.6^6) * choose(10, 4)

# Part 3

# as long as it is more than 90, the simulation works since the number of people
# is more than 88, the match of 3 birthdays is more than 50%
n.people.max = 100
for (n.people in 3:n.people.max){
    # increment number of people in sample by 1
    n.sims = 10^5
    has.match = c()
    
    for (i in 1:n.sims) {
        # take sample of birthdays
        this.sample = sample(1:365, n.people, replace=TRUE)
        # increment has.match if 3 or more birthdays are the same. 
        has.match[i] = max(table(this.sample)) >= 3
    }
    # probability of match against simulations
    P.match = sum(has.match)/n.sims
    print(paste("n.people =", n.people, "P(match) = ", P.match))
    # break when probability > 0.5
    if (P.match >= 0.50) {
        print(n.people)
        break
    }
}
