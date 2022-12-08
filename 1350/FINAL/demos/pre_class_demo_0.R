#Author: Carl Gladish
#Date: Sept 06, 2021
#Purpose: Demo for MATH 1350 students

library(readxl)
library(viridis)

#set working directory (You would set wdir differently)
wdir <- paste(Sys.getenv("ONEDRIVE"),
            "/Teaching/BCIT_W2022_MATH_1350/W2022_MATH_1350_R_Tutorials/",sep="")
setwd(wdir)

#read Excel data
gss96 <- read_excel("gss96.xlsx",  skip = 1)


#create a histogram
#jpeg("demo_histogram - v2.jpeg", quality=70)
hist(gss96$TV, xlab="Hours of TV per Day",
     ylab="Frequency",
     main="Histogram of TV Hours per Day",
     breaks=seq(0,24,by=1))
#dev.off()

#create a barchart of political party affiliation
barplot(table(gss96$Party),ylab="Frequency",main="Party Affiliations")

#create a pie chart
pie(table(gss96$Party),main="Party Affiliations")

#select only Democrats and Republicans
df1 <- subset(gss96, Party=="Democrat" | Party=="Republican")

#pull out the two variables: Marital and Party
df2 <- df1[c("Marital","Party")]

#create a proportion table for these two categorical variables
t1 <- table(df2)
t2 <- proportions(t1, margin=2 )

#jpeg("Martial_Status_V2.jpeg",quality=90)
barplot(t2,legend.text=rownames(t2),
        args.legend=list(x="right"), col=viridis(5),
        ylab="Relative Frequency (stacked)",
        main="Marital Status of Democrats and Republicans"
        )
#dev.off()
