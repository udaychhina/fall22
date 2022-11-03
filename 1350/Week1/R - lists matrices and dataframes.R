# R tutorial script - lists, matrices, and data frames
# Carl Gladish
# Sept 26, 2021


# create a vector
v <- c(5, 18, 21, 32, 107)

# in a vector, all the components are of the same type
typeof(v)

#to access a component of the vector, use the [] brackets
v[3]

#if you omit the index value, you get the entire vector
v[]

#a list is a structure that can contain data of different types
list1 <- list(5, "A", TRUE, 253L)

#lists can contain other lists
w <- list(list(1,2,4), TRUE, list("A", list("B","C")))

#display it
list1
typeof(list1)

#use [] if you want a new list containing certain components of the list
list2 <- list1[2] #gives you a sub-list
list2
list3 <- list1[c(2,4)]
list3

#or if you want to set values of a sublist
list1[c(2,4)] <- list("happy",-235L)

#use [[]] if you want to pull out the individual component
list1[[4]]

#using [] with a list always gives you another list
list1[4]
list1[4][[1]]
list1[4][1][1][1][1][[1]]

list6 <- list(a=list(1,2,3),b=list(5,6,7))
list6
list6[1]
list6["a"]
list6[["a"]]
list6[["a"]][1]
list6[["a"]][[1]]

# [[]] won't work if you want to pull out multiple components
list1[c(2,4)]
list1[[c(2,4)]]

#notice also the difference between [] and [[]] when assigning values
list1[1] <- "B"
list1[1] <- list("B")

list1[[1]] <- "C"
list1[[1]] <- list("C")


#matrices (plural of matrix)
x <- seq(1, 100, 2)
m1 <- matrix(x, nrow=5, byrow=TRUE)
m1

m2 <- matrix(x, nrow=5, byrow=FALSE)
m2
matrix(x, nrow = 5)

m3 <- matrix(x, nrow=5, ncol=10,
            dimnames=list(c("r1","r2","r3","r4","r5"),
                          1:10))
m3
m3["r4",9]

#if you want to pull out the entire row
m3["r3",]

#if you want to pull out the entire column
m3[ ,9]

#all but second row
m3[-2, ]

#all but last two columns
m3[,-c(9,10)]

#last row
m3[nrow(m3),]

#last col
m3[ ,ncol(m3)]

#dimension of a matrix
dim(m3)

dim(m3) <- c(25,2)
m3
dim(m3) <- c(50,1)
m3

#combine columns to get a matrix
1:10
m5 <- cbind(1:10, 11:20, 21:30)
m5

#combine rows to get a matrix
m6 <- rbind(c("A","B","C"),c("D","E","F"))
m6

m7 <- matrix(x, nrow=5, ncol=10,
             dimnames=list(c("r1","r2","r3","r4","r5"),
                           1:10))
rownames(m7)
rownames(m7) <- letters[1:5]
colnames(m7) <- paste0("col",seq(1,10,1))
m7

attributes(list5)
attributes(m7)

## data frames ##
df1 <- data.frame(fname=c("Carl","Lizzy","Darcy"),
                  age=c(41, 2, 13))
names(df1)
dim(df1)

temp <- c(20.37, 18.56, 18.4, 21.96, 29.53, 28.16,
          36.38, 36.62, 40.03, 27.59, 22.15, 19.85)
humidity <- c(88, 86, 81, 79, 80, 78,
              71, 69, 78, 82, 85, 83)
rain <- c(72, 33.9, 37.5, 36.6, 31.0, 16.6,
          1.2, 6.8, 36.8, 30.8, 38.5, 22.7)
month <- c("January", "February", "March", "April", "May", "June",
           "July", "August", "September", "October", "November", "December")

#make these four vectors into the columns of a data frame
weather.data <- data.frame(month=month,
                           temp=temp,
                           humidity=humidity,
                           rain=rain)
names(weather.data)

#show just the first 6 rows of a dataframe
weather.data
head(weather.data)
summary(weather.data)

#select one variable from weather.data
weather.data$temp
weather.data["temp"]
weather.data[ ,"temp"]

#select multiple variables
head(weather.data[ ,c("temp","humidity")])

#select one row from weather.data
weather.data[10, ]

#to avoid typing the name of the data frame, use attach
attach(weather.data)
humidity
boxplot(humidity)
detach(weather.data)
humidity


#load some other data sets built into R
data()
data(ChickWeight)

attach(ChickWeight)
Diet
hist(weight)
detach(ChickWeight)

#sort rows by value of a variable
i1 <- order(ChickWeight$weight)
i1

i2 <- order(-ChickWeight$weight)
i2

df4 <- ChickWeight[i1,]
head(df4)

#select only certain rows and columns
df5 <- subset(ChickWeight, weight > 40)

df6 <- subset(ChickWeight, weight > 40, select = c(Time, Chick))



