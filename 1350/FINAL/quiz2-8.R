########
#Quiz 2#
########
#1: Let X= the age of students currently taking Math 1350
#Assume the age of all the students in Math 1350 are store in the R variable
#Math 1350.age, from which all NA values have been removed.
#You are given the following R console output:
#>sort(Math1350.age)
#>[1]  18  18  19  19  19  19  19  19  19  20  20  20  20  20
#>[15] 21  21  21  21  21  22  22  22  22  22  22  22  22  22
#>[29] 23  23  23  23  23  23  23  24  24  24  24  25  25  25
#>[43] 25  26  26  26  26  26  27  28  29  29  30  30  32  33
#>[57] 35
#>length(Math1350.age)
#>[1] 57
#>mean(Math1350.age)
#>[1] 23.36842
#>sd(Math1350.age)
#>[1] 3.848152

#1a) Find the z-score of a student of age x = 28. Round to 2 decimal places
#z = (x-xbar)/s
#z = (28 - 23.36842)/3.848152
#z = 1.20358 -> 1.20

#1b) Find the age x of student with z-score z = 1. Round to 1 decimal place
#z = (x-xbar)/s
#1 = (x - 23.36842)/3.848152
#x = 1*3.848152 + 23.36842
#x = 27.216 -> 27.2

#1c) What proportion of students in Math 1350 have a z-score (for age) between
#-1 and +1? Round to 4 decimal places 
#if z = +1 (see 1b for x)
#x = 27.2
#if z = -1:
#-1 = (x - 23.36842)/3.848152 
#x = -1*3.848152 + 23.36842
#x = 19.5
#Count how many students are between 27.2 and 19.5 (THERE ARE 40 OF THEM)
#Therefor 40(students between 27.2 and 19.5)/57(57 total student population) = 0.7018

#2: Now consider the variable X = Height, where the population in question is 
#all female BCIT students. Assume that X is normally distributed with mu = 165.2
#and sigma = 7.5

#2a) Which is the correct notation for describing X in this case 
#*Notes from class: Normal distributed variable with mean mu and standard 
#deviation sigma, then we write: X~N(mu, sigma^2)
#X~N(165.2, 56.25^2)

#2b) According to the Emperical Rule, what interval of possible heights contains
#95% of all female BCIT students?
#mu-2sigma = 165.2 - 2 * 7.5 = 150.2
#mu+2sigma = 165.2 + 2 * 7.5 = 180.2

#2c) For what proportion of female BCIT students is X > 160.0? Round to 4 decimal
#p(x > 160)
#p(z > (160-165.2)/7.5)
#p(z > -0.6933)
#1 - p(z > -0.6933)
#1 - 0.2451 (the 0.24406 is from reading the standard normal table)
#0.7549

########
#Quiz 3#
########
# 1) Suppose you roll two fair dice. The sample space can be represented as:
#                       S = {(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),
#                            (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),
#                            (3,1),(3,2),(3,3),(3,4),(3,5),(3,6)
#                            (4,1),(4,2),(4,3),(4,4),(4,5),(4,6)
#                            (5,1),(5,2),(5,3),(5,4),(5,5),(5,6)
#                            (6,1),(6,2),(6,3),(6,4),(6,5),(6,6)}   

# Let X = the total of the two dice
# a) Calculate P(X = 4)
3/36 # Answer 0.0833

# b) Calculate P(x >= 7)
21/36 # Answer: 0.5833

# 2) Suppose you flip three fair coins
# a) Write the sample space for this random experiment. (Use H and T to
# denote heads and tails)
# s ={HHH,HHT,HTH,HTT,THH,THT,TTH,TTT}

# b) What is the probability of getting exactly two heads?
3/8 # Answer: 0.3750

# 3) You have six coloured balls (green,red,blue,yellow,purple,black).
# a) How many permutations are there using all six balls?
# Calculation: 6P6 or 6!
# Answer: 720

# b) How many combinations are there using r = 2 balls?
# 6C2
# Answer: 15

# c) Calculate 6C4
# Answer: 15

# d) If you pick two balls, what is the probability that one is red?
# 5C1 / 6C2 -- note it is 5C1 and not 6C1 on top because one is red
# Answer: 0.3333



########
#Quiz 4#
########

# 1. Data collected for a classroom of students is shown below. Suppose you randomly
# select n = 4 students (without replacement) from the class.

# _______________________________
# |           Frequency         |
# |_____________________________|
# | Left-handed   |       5     |
# |_______________|_____________|
# | Right-handed  |      20     |
# |_______________|_____________|
# | Total         |      25     |
# |_______________|_____________|

#a) [2 points] What is the probability that all four students are left-handed?
# P(all 4 left) = 5C4/25C4 --> 0.000395 --> 0.0004

# b) [1 points] What is the probability that at least one student is right heanded?
# P(at least one right) = 1 - P(all 4 left)
#                       = 1 - 0.00395 --> 0.996

# c) [2 points] What is the probability that exactly one student is right-handed?
# P(1 right) = (20/25) * (5/24) * (4/23) * (3/22) 
#            + (5/25) * (20/24) * (4/23) * (3/22)
#            + (5/25) * (4/24) * (20/23) * (3/22)
#            + (5/25) * (4/24) * (4/23) * (20/22)
#            = 0.0158

# 2. You are given the following data for the variables Handedness and Phone.Brand
# fir 100 students in a statistics course.
#           ________________________________________________________
#           |                       Phone.Brand                     |
#           |_______________________________________________________|
#           |               |  Iphone |   Samsung | Google  | Total |
#           |_______________|_________|___________|_________|_______|
#           | Left-handed   |   ?=5   |   ?=3     |   ?=2   | 10    |
#           |_______________|_________|___________|_________|_______|
# Handedness| Right-handed  |   40    |   ?=32    |   ?=18  | 90    |
#           |_______________|_________|___________|_________|_______|
#           | Total         |   45    |   35      |   20    | 100   |
#           |_______________|_________|___________|_________|_______|

# Suppose you randomly select one student. Define the events:

#       R = Student is right-handed
#       G = Student uses a Google phone

# a) [1 point] Calculate P(R)
#         90/100 = 0.9000

# b) [1 point] Assume that events R and G are independent. What is P(R|G)?
#         P(R|G) = P(R) = 0.9000

# c) fill in the missing ? in the table
#         amount of right handed ppl using google phone:
#           P(R|G) * 20 (the total Google phones)
#           = 0.9000 * 20 --> 18
#           rest of the table is basic math

# d) [1 point] Calculate P(R n G)
#       |R n G|/|S| = 18/100 --> 0.18
#   or  P(R n G) = P(R) * P(G) = 0.9 * 0.2 --> 0.18 

# e) [1 point] Calculate P(G | R)
#       |G n R|/|R| = 18/90 --> 0.2000

# f)[1 point] Calculate P(R' | G')
#       |G' n R'|/ |G'| = (5 + 3)/80 --> 0.1000
#   or  P(R') = 10/100 --> 0.100

########
#Quiz 5#
########
# 1. Suppose you have a "super-deck" of cards made from ten standard decks shuffled
# together. You randomly select five cards from the "super-deck".
# Let X = the number of Aces you get

# a. [1 mark] Verify that the 5% rule holds in this case (so we can assume that
# the five cards are independent).
#  n = 5  and N = 52 * 10 = 520
# so n/N * 100% = 5/520 * 100% --> 0.96% <= 5%

# b. [2 marks] What four conditions make X a binomial variable? (fill in the blanks)
#    There are a fixed number of trials, n = "5"
#    Each trial is success/fail. Here, "success" means "get Ace"
#    The trials are "indepenent"
#    Each trial has the same probability of success, p = "4/52 = 0.07692..."

# c. [2 marks] Find the probability P(X = 1)
# P(X = 1) = dbinom(1,5,4/52)

# d. [2 marks] Find the probability P(X >= 1)
#         = 1 - pbinom(0,5,4/52)

# 2. Suppose that 45% of all BCIT students use an iPhone. You randomly select
# a sample of n = 25 students.

# Let X = the number of students in the sample who use an iPhone. The probability
# distribution of X is shown below. We know this distribution is well approximated
# by a normal distribution since:
#                               np = 25 * 0.45 = 11.25 >= 5
#                               nq = 25 * 0.55 = 13.75 >= 5

# mu = np = 25 * 0.45 = 11.25
# sig = sqrt(npq) = sqrt(25*0.45*0.55) = 2.4875
# so P(x >= 8) = P(Z >= ((7.5 - 11.25)/2.4875))
#              = 1 - P(Z <= 1.5075)
#              = 1 - 0.0658
#              = 0.9342

########
#Quiz 6#
########
#Let X = the height of a random male canadaian. For this quiz assume X is a normally distributed variable with parametes
#mu = 175.0cm
#sd = 7.2cm


#1: Sketch the distribution of X
#term 2

#2: calculate P(170.0 <= X <= 180.0)
#mu = 175.0cm
#sd = 7.2cm
x.lower <- 170 # height in cm
x.upper <- 180 # height in cm

cdf.upper <- pnorm(x.upper, mean = height.mean, sd = height.sd, lower.tail = TRUE)
cdf.lower <- pnorm(x.lower, mean = height.mean, sd = height.sd, lower.tail = TRUE)
cdf.upper - cdf.lower


#3: suppose you take a random sample of male canadians of size n = 16. Let xbar = sample mean
#a: what is mu of xbar? State its numerial value
mu of xbar = mu of x = 175

#b: what is sd of xbar? state numericla value
sd of xbar = sd(x)/sqrt(n) = 7.2/sqrt(16) = 1.8cm

#c: can we assume xbar is normally distributed?
yes, since x is normally distributed

#d: calculate the porbability P(174 <= xbar <= 176)
#mu of xbar = 175.0cm
#sd of xbar = 1.8cm
x.lower <- 170 # height in cm
x.upper <- 180 # height in cm

cdf.upper <- pnorm(x.upper, mean = height.mean, sd = height.sd, lower.tail = TRUE)
cdf.lower <- pnorm(x.lower, mean = height.mean, sd = height.sd, lower.tail = TRUE)
cdf.upper - cdf.lower

########
#Quiz 7#
########

#1: In the steps below you will obtain a 90% confidence interval for the mean height mu of a female canadian
#Let X = the height of a random female canadian. Suppose you select a random sample size of n = 100
#mean(xbar) = 163.2cm
#std.dev(sd) = 7.5cm
#n = 100

#a: 
E = tα/2 * s/sqrt(n)

#b: what is the margin of error E?
α = 0.1 #it's from 1 - 0.9
t0.05 = qt(1 - 0.05, 100 - 1)
= qt(0.95, 99)
= 1.660391

E = 1.660391 * 7.5/sqrt(100) = 1.2

#c: what are the lower and upper limits of 95% confidence interval?
lower limit = xbar - E = 163.2 - 1.2
upper limit = xbar + E = 163.2 + 1.2

#d: can we confidently conclude that the mean height of a female candian is less than 165cm?
Yes, since 165 is above the upper limit we believe that mu<165

#e: if we repeated the above procedure using a second random sample of size n = 100, which of the following
#quantities are likely to change?
Xbar = sample mean
s = sample standard deviation
the margin of error E
the lower and upper limits of confidence interval

########
#Quiz 8#
########
# Wikepedia states that 10% of people are left-handed.
# Let p denote the proportion of BCIT computing students 
# who are left handed. Test the claim that p = 0.10,

# Step 0 (Sample Data):
# Sample: 
#  n = 250                pop:
#  x = 12                  P = 0.1
#  phat = x/n = 0.048      q = 0.9

# Step 1 (State Hypotheses):
#  (Null)  H0: p == 0.1 (claim)
#  (ALT)   H1: p != 0.1 (two-tailed)

# Step 2 (Test Statistic):
# z = (phat - p)/ sqrt((p*q)/n) 
#   = (0.048 - 0.1)/(sqrt((0.1 * 0.9)/100)) = - 1.733

# Verify conditions
# n * p = 100 * 0.1 = 10 >= 5 yes
# n * q = 100 * 0.9 = 90 >= 5 yes
# so z is a standard normal variable

# Step 3 (P-value):
# P-value = 2 * 0.0418 
#         = 0.0836

# Step 5 (Conclusion): Since P-value >= 5% we fail to reject H0
# (Technical) There is insufficient evidence to reject the claim
# that 10% of BCIT computing students are left-handed.
# (Basic) 100% of BCIT computing students are left-handed (as far as
# we can tell).







