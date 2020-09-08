#Prepr machine learning engineering
setwd("D:/sevda/final_report")
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

df_industry<-read.csv("1410035501-eng-industry.csv")
df_industry$Reference.period<-as.Date(df_industry$Reference.period)
names(df_industry)[1]<-'Geography'
df_industry$Geography<-as.factor(df_industry$Geography)
#Professional..scientific.and.technical.services: colname
ggplot(df_industry, aes(Reference.period, Professional..scientific.and.technical.services, colour = Geography)) + 
  geom_line()
