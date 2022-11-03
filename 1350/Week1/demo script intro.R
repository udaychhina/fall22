# Author: Uday Chhina
# Date: Sept 06, 2022
# Purpose: Copying code from demo video
library(readxl)

# Set working directory
setwd("C:/Users/udayc/Documents/BCIT/Fall2022/1350")

# Read the excel data
gss96 <- read_excel("Week1/gss96.xlsx", skip = 1)

# create a histogram
jpeg("Week1/demo_histogram.v2.jpeg", quality = 100)
hist(gss96$TV, xlab="Hours of TV per Day", ylab = "Frequency", 
     main = "Histogram of TV Hours per Day", breaks = seq(0,24,by=1))
dev.off()

#create a barchart of the political party affiliation
barplot(table(gss96$Party), ylab = "Frequency", main = "Party Affiliations")

#create a pie chart
pie(table(gss96$Party), main = "Party Affiliations")

#select only republicans or democrats
df1 <- subset(gss96, Party == "Democrat" | Party == "Republican")
#pull out party and marital status
df2 <- df1[c("Marital", "Party")]

#create a proportion table for these two variables
t1 <- table(df2)
t2 <- proportions(t1, margin = 2)

jpeg("Week1/marital_statusv2.jpeg", quality = 100)
barplot(t2, legend.text = rownames(t2), 
        args.legend = list(x="right"), col = rainbow(5),
        ylab = "relative frequency (stacked)",
        main = "Marital title of Democrats and Republicans")

