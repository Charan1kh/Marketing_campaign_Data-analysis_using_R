#read csv 
ds <- read.csv(file.choose())

#libraries
library(rstatix)
library(tidyverse)
library(ggplot2)

#Convert character datatype 
Income_new <- gsub("[$,]","",ds$Income)
ds$Income <- as.numeric(Income_new)

#create dataframe
df <- data.frame(ds)

#total na's
sum(is.na(df))

#remove na values
df <- na.omit(df)

#identification of the outliers in all the cols & plotting the variables in case of extreme outliers
identify_outliers(df, NumWebVisitsMonth)
identify_outliers(df, NumStorePurchases)
identify_outliers(df, NumCatalogPurchases)
identify_outliers(df, NumWebPurchases)
identify_outliers(df, NumDealsPurchases)
identify_outliers(df, MntGoldProds)

plot(df$MntGoldProds, main = "Plotting the values of Gold Products to identify extreme outliers")
identify_outliers(df, MntSweetProducts)
plot(df$MntSweetProducts, main = "Plotting the values of Sweet Products to identify extreme outliers")
identify_outliers(df, MntFishProducts)
plot(df$MntFishProducts)
identify_outliers(df, MntMeatProducts)
plot(df$MntMeatProducts, main = "Plotting the values of Meat Products to identify extreme outliers")
identify_outliers(df, MntFruits)
plot(df$MntFruits)
identify_outliers(df, MntWines)

#summing the similar cols
df<-df%>% 
  mutate(TotalMntSpent=MntWines + MntFruits + MntMeatProducts +MntFishProducts + MntSweetProducts + MntGoldProds)%>%
  mutate(TotalAcceptedCmp = AcceptedCmp1+ AcceptedCmp2 +AcceptedCmp3+ AcceptedCmp4+ AcceptedCmp5)%>%
  mutate(TotalNumPurchases=NumDealsPurchases + NumWebPurchases + NumCatalogPurchases+ NumStorePurchases)

#Education, Marital Status and Country analysis
ByEducation<-aggregate(cbind(Income,TotalMntSpent,TotalNumPurchases,TotalAcceptedCmp) ~ Education, data = df, sum)
ByEducation <- ByEducation[order(ByEducation$Income,decreasing=T),]
ByEducation

#data aggregation by Marital Status
ByMaritalStatus <- aggregate(cbind(Income,TotalMntSpent,TotalNumPurchases,TotalAcceptedCmp) ~ Marital_Status, data = df, sum)
ByMaritalStatus <- ByMaritalStatus[order(ByMaritalStatus$Income,decreasing=T),]
ByMaritalStatus

#data aggregation by country
ByCountry <- aggregate(cbind(Income,TotalMntSpent,TotalNumPurchases,TotalAcceptedCmp) ~ Country, data = df, sum)
ByCountry <- ByCountry[order(ByCountry$Income,decreasing=T),]
ByCountry

#Most Gold buyers
if (df$MntGoldProds > mean(df$MntGoldProds)){
  print(df$NumStorePurchases)
}

#Graphs

#Campaign success analysis

#Success of marketing campaign by Marital Status
Campaign <- gather(df, key="measure", value="value", c("AcceptedCmp3", "AcceptedCmp4", "AcceptedCmp5", "AcceptedCmp1","AcceptedCmp2"))
ggplot(Campaign, aes(x=factor(Marital_Status), y=value))+
  geom_bar(stat='identity', fill="Turquoise")+
  facet_wrap(~measure) + ggtitle("Campaign success in according to Marital Status")  + 
  theme(axis.text.x = element_text(angle = 90)
        ,axis.title.x = element_blank(),
        axis.title.y = element_blank(),panel.spacing = unit(2, "lines"))
 
#Success of marketing campaign by Education
Campaign <- gather(df, key="measure", value="value", c("AcceptedCmp3", "AcceptedCmp4", "AcceptedCmp5", "AcceptedCmp1","AcceptedCmp2"))
ggplot(Campaign, aes(x=factor(Education), y=value))+
  geom_bar(stat='identity', fill="steelblue")+
  facet_wrap(~measure) + ggtitle("Campaign success in according to Education")  + 
  theme(axis.text.x = element_text(angle = 90)
        ,axis.title.x = element_blank(),
        axis.title.y = element_blank(),panel.spacing = unit(2, "lines"))

#Success of marketing campaign by Country
Campaign <- gather(df, key="measure", value="value", c("AcceptedCmp3", "AcceptedCmp4", "AcceptedCmp5", "AcceptedCmp1","AcceptedCmp2"))
ggplot(Campaign, aes(x=factor(Country), y=value))+
  geom_bar(stat='identity', fill="seagreen")+
  facet_wrap(~measure) + ggtitle("Campaign success in according to Country")  + 
  theme(axis.text.x = element_text(angle = 90)
        ,axis.title.x = element_blank(),
        axis.title.y = element_blank(),panel.spacing = unit(2, "lines"))

#Product perfromance analysis

#Product performance by Marital Status
Product_perf <- gather(df, key="measure", value="value", c("MntWines","MntFruits","MntMeatProducts","MntFishProducts","MntSweetProducts","MntGoldProds"))
ggplot(Product_perf, aes(x=factor(Marital_Status), y=value))+
  geom_bar(stat='identity', fill="salmon")+
  facet_wrap(~measure) + theme(axis.text.x = element_text(angle = 90),axis.title.x = element_blank(),
                               axis.title.y = element_blank(),panel.spacing = unit(2, "lines")) + ggtitle("Plot of Different Products by Marital Status")

#Product performance by Education
Product_perf <- gather(df, key="measure", value="value", c("MntWines","MntFruits","MntMeatProducts","MntFishProducts","MntSweetProducts","MntGoldProds"))
ggplot(Product_perf, aes(x=factor(Education), y=value))+
  geom_bar(stat='identity', fill="rosybrown")+
  facet_wrap(~measure) + theme(axis.text.x = element_text(angle = 90),axis.title.x = element_blank(),
                               axis.title.y = element_blank(),panel.spacing = unit(2, "lines")) + ggtitle("Plot of Different Products by Education")

#Product performance by country
Product_perf <- gather(df, key="measure", value="value", c("MntWines","MntFruits","MntMeatProducts","MntFishProducts","MntSweetProducts","MntGoldProds"))
ggplot(Product_perf, aes(x=factor(Country), y=value))+
  geom_bar(stat='identity', fill="coral")+
  facet_wrap(~measure) + theme(axis.text.x = element_text(angle = 90),axis.title.x = element_blank(),
                               axis.title.y = element_blank(),panel.spacing = unit(2, "lines")) + ggtitle("Plot of Different Products by Country")