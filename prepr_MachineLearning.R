#Prepr machine learning engineering
setwd("D:/sevda/final_report")
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

df_new<-read.csv("1410028701-eng.csv")
names(df_new)
names(df_new)[1]<-'Geography'
str(df_new)
df_new$date<-as.Date(df_new$date)
df_new$sex<-as.factor(df_new$sex)
df_new$Geography<-as.factor(df_new$Geography)
levels(df_new$Geography)
levels(df_new$sex)


#pivotable by Geography and sex 

##### variation of labour and employment for the last 5 years-Both sexes

#For Canada
df_new1<-filter(df_new,df_new$Geography=='Canada' & df_new$sex=='Both sexes' )
ggplot(df_new1, aes(date)) + 
  geom_line(aes(y=Labour.force.5, colour = 'Labour.force.5')) + 
  geom_line(aes(y=Employment.6, colour = 'Employment.6'))+
  labs(y= "num of labour and employment(*1000)", x = "April 2016-August 2020")+
  ggtitle("Canada")

#For Ontario
df_new2<-filter(df_new,df_new$Geography=='Ontario' & df_new$sex=='Both sexes' )
ggplot(df_new2, aes(date)) + 
  geom_line(aes(y=Labour.force.5, colour = 'Labour.force.5')) + 
  geom_line(aes(y=Employment.6, colour = 'Employment.6'))+
  labs(y= "num of labour and employment(*1000)", x = "April 2016-August 2020")+
  ggtitle("Ontario")

#####variation of labour force in the last 5 years-men and female in Ontario

df3_new<-filter(df_new,df_new$Geography=='Ontario' & df_new$sex!='Both sexes' )
ggplot(df3_new, aes(date, Labour.force.5, colour = sex)) + 
  geom_line()+
  labs(y= "num of labour force(*1000)", x = "April 2016-August 2020")+
  ggtitle("labour force (men & women)-Ontario")

#####Comparison of the Variation of Employment in the last 5 years-both sex-Ontario&Alberta
df4_new<-filter(df_new,df1$sex=='Both sexes')
ggplot(df4_new, aes(date, Employment.6, colour = Geography)) + 
  geom_line()+
  labs(y= "Employment(*1000)", x = "April 2016-August 2020")+
  ggtitle("Employment in Canada,Ontario and Alberta (both sexes)")
