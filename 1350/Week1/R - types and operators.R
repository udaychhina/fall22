#Unit 01 - R tutorial
#Carl Gladish
#Sept 13, 2021

#R data types and operators

# there are six 'atomic' types of data
#we will only use the first four types
w <- 15L
x <- 21.3
y <- "abc"
z <- TRUE
u <- 0.7071 + 0.7071i
v <- charToRaw("abcd")

typeof(w)
typeof(x)
typeof(y)
typeof(z)
typeof(u)
typeof(v)

#with numerical types you can do the usual arithmetic
w+5
2*w
x^2 #exponent
x/w

#with logical types you can do logical operations 
# & is AND
# | is OR
# ! is NOT
z
!z
TRUE & FALSE
TRUE | FALSE

#you can compare numerical (and also character) types
1 < 2
3.5 >= 5.3
3.5 != 5.3
"c" < "b"
"C" == "C"
"C" == "B"


# you can form vectors contains values all of the same type
a <- c(15L, 3L, 9L)
b <- c(21.3, 3.1415, 2.71828)
d <- c("Carl","Tara","Lizzy", NA)
e <- c(TRUE, FALSE, FALSE, FALSE)
f <- c(TRUE, TRUE, TRUE, FALSE)

#you can refer to specific elements in a vector using an index
a[1]
a[2] <- 7
b[c(2,3)]

#this can be useful for selecting some values and not others
a > 8L
a[a > 8L]
d != "Carl"
d[d != "Carl"]

#but the following is an error
b[2,3]


#you can generate numerical vectors (sequences) 
1:20
seq(to=101, from=1, by=2)
seq(1, 101, 2)

#you can do arithmetic with vectors
a
2*a
b
a+b
b / a
seq(1,5)^2

#you can do logical operations on logical vectors
e
!e
f
e & f
e | f

#you can compare vectors
a < b

#you can check for NA values in any vector
is.na(a)
is.na(d)


#assignment operators
#the most common assignment operator is <-
x <- c("How", "are", "you?")

# you can also write it with the arrow going the other way
c("I","am", "fine.") -> y
