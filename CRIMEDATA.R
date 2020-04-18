#iN this datasets there are 36 diffrent csv files. to combine all these into one dataset
#1


mydir = "CRIME DATA"
df1_files= list.files(path =("C:/Users/brahm/Documents/TODAY/CRIME DATA"), pattern="*.csv", full.names=TRUE)
df1_files

#2 
library(plyr)
library(readr)

df1 <- ldply(df1_files, read_csv)
df1
head(df1,5)
write.csv(df1,"AIINICrimeDatatest.csv",row.names = F)

names(df1)
Crime_data <- read.csv("AIINICrimeDatatest.csv")
head(Crime_data)
nrow(Crime_data)
Crime_data$Crime.ID <- NULL
Crime_data$Reported.by <- NULL
Crime_data$Falls.within <- NULL
Crime_data$LSOA.code <- NULL
Crime_data$LSOA.name <- NULL
Crime_data$Last.outcome.category <- NULL
Crime_data$Context <- NULL

summary(Crime_data,15)

#3
Crime_data$Crime.type <- revalue(Crime_data$Crime.type,c("Anti-social behaviour" = "ASBO","Bicycle theft" = "BITH",
                                                         "Burglary" = "BURG","Criminal damage and arson" = "CDAR",
                                                         "Drugs" = "DRUG","Other Theft = OTTH","Public order" = "PUBO",
                                                         "Robbery" = "ROBY", "Shoplifting" = "SHOP","Theft from the person" = "THPR",
                                                         "Vehicle crime" = "VECR", "Violence and sexual offences" = "VISO",
                                                         "Other crime" = "OTCR","Other theft" = "OTTH","Possession of weapons" = "POW"))

summary(Crime_data$Crime.type,15)
str(Crime_data$Crime.type)

#4 
#Plotting for crime type field frequency using plot().
attach(Crime_data)
plot(Crime_data$Crime.type,ylim=c(0,200000),col = rainbow(14),main = "frequeny rate",
     xlab="Crime Type",ylab="Number of Crimes")
detach(Crime_data)

#5
# remove the On or near string from the location column.
library(stringr)
Crime_data$Location <- trimws(str_remove(Crime_data$Location," On or near "))
head(Crime_data$Location, n=10)
Crime_data$Location[Crime_data$Location == ""] <- NA
Crime_data
str(Crime_data)
#6
# Pick the random sample of 5000 entiries using set seed function by omitting location null values.
getwd()
crimes <- Crime_data[complete.cases(Crime_data$Location),]

set.seed(100)

random_crime_sample <- crimes[sample(1:nrow(crimes), 5000, replace = TRUE),]
random_crime_sample

CleanNIPostcodeData <- read.csv("CleanNIPostcodeData.csv", header = TRUE)
CleanNIPostcodeData <-  CleanNIPostcodeData[complete.cases(CleanNIPostcodeData$Primary.Thorfare),]
find_a_town <- function(randomcrime)
  
{
  
  CleanNIPostcodeData$Town[match(tolower(random_crime_sample$Location),tolower(CleanNIPostcodeData$Locality))]
  
}

print(random_crime_sample$Location)
random_crime_sample$Town <- find_a_town(random_crime_sample$Location)
random_crime_sample$Town
str(random_crime_sample)
write.csv(random_crime_sample, file="test.csv", row.names = FALSE)