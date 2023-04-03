#libraries
library(rstatix)
library(tidyverse)
library(ggplot2)

#read csv 
ds <- read.csv(file.choose())

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