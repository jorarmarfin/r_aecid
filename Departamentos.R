install.packages("DBI")
install.packages("RMariaDB")
install.packages("RMySQL")

library(dplyr)
#library()

d1<-read.csv("csv/d1.csv")
d2<-read.csv("csv/d2.csv")

m1<-round(d1[2],2)
m2<-round(d2[2],2)
head(m2)

anti_join(d1,d2)
round(anti_join(m1,m2),2)
head(d1)
subset(d1,d1$id=='2258')
subset(d2,d2$id=='2258')
