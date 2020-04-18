#the dataset is downloaded and the github repository is created. 

#Query 1. Show the total number of rows, the structure of the data frame, and first 10 rows of the data frame containing all of the NIPostcode data. 
# First read the csv file and store into dataframe.
NIPostcodes <- read.csv("C:/Users/brahm/Downloads/NIPostcodes.csv", header=FALSE, stringsAsFactors = FALSE)
#take an overview of the structure of the dataframe.
str(NIPostcodes)
#command to count the number of rows present.
D
#overview the structure.
str(NIPostcodes)
#returns to the start data.
head(NIPostcodes)
#displays the data from the start having 10 rows specified.
head(NIPostcodes, n=10)

#Query 2: Add a suitable title for each attribute.

file_loc = file.path("C:/Users/brahm/Downloads/NIPostcodes.csv")
NIPostcodes <- read.csv("C:/Users/brahm/Downloads/NIPostcodes.csv", header=FALSE, stringsAsFactors = FALSE)
View(NIPostcodes)
str(NIPostcodes)
#lets know the dimension.
dim(NIPostcodes)
#First print the names attribute of the NIPostcodes data set.
names(NIPostcodes)
#Now to replace we use names command.
#Change the appropraite column name in dataframe.
colnames(NIPostcodes) <- c("Organisation_Name","Sub-building_Name","Building_Name","Number","Primary_Thorfare",
                           "Alt_Thorfare","Secondary_Thorfare","Locality","Townland","Town","County","PostCode",
                           "X-Cordinates","Y-Cordinates","Primary_Key")
str(NIPostcodes)

#query3.
NIPostcodes <- read.csv("C:/Users/brahm/Downloads/NIPostcodes.csv", header=FALSE, stringsAsFactors = FALSE, na.strings="" )
#Replace and recode all missing values.
NIPostcodes[NIPostcodes==""] <- NA
NIPostcodes
# identify count of NAs in data frame
is.na(NIPostcodes$`Organisation Name`)


#graphical representatio.
install.packages("mice")
library("mice")
md.pattern(NIPostcodes)

install.packages("VIM")
library(VIM)
missing_values <- aggr(NIPostcodes, prop = FALSE, numbers = TRUE)



#query 4.
#Missing Data Columnwise.
colSums(is.na(NIPostcodes))
Missing_Count <- sapply(NIPostcodes, function(y) sum(length(which(is.na(y)))))
Missing_Count <- data.frame(Missing_Count)
Missing_Count


#query5 -Reorder column Primary Key (identifier) by index 1.
str(NIPostcodes)
NIPostcodes[,c(15, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)]
str(NIPostcodes)


#query 6 -
#create a subset.
Limavady_data <- subset(NIPostcodes)

### import NIPostcards data set and assign column names
NIPostcodes <- read.csv("C:/Users/brahm/Downloads/NIPostcodes.csv", stringsAsFactors = FALSE)
colnames(NIPostcodes) <- c("Organisation Name", "Sub-building Name", "Building Name", "Number",
                           "Primary Thorfare",
                           "Alt Thorfare",
                           "Secondary Thorfare",
                           "Locality",
                           "Townland",
                           "Town",
                           "County",
                           "Postcode",
                           "x-coordinates",
                           "y-coordinates", "Primary Key (identifier)")
View(NIPostcodes)
str(NIPostcodes)

#create a subset.
Limavady_data <- subset(NIPostcodes)
Limavady_data<- NIPostcodes[c(8,9:10)]
names(Limavady_data)
Limavady_data <- NIPostcodes[which(NIPostcodes$Locality == "Limavady" | NIPostcodes$Townland == "Limavady")]
Limavady_data

select =( NIPostcodes[,c(Locality$Townland$Town == "LIMAVADY")])
# Using the subset function
# to extract all records from managers where age > 35 or age < 24. 
# Only select the listed attributes
attach(NIPostcodes)
Limavady_data <- subset(NIPostcodes, LOcality | Town | Townland = "Limavady", select = c(8, 9, 10))
Limavady_data

#count and display the number of rows.
nrow(Limavady_data)
Limavady_data

#Store this information in a csv file called Limavad
write.csv(Limavady_data, file="Limavady.csv", row.names = FALSE)

#query 7.
#Save the modified NIPostcode dataset in a csv file called CleanNIPostcodeData. 
write.csv(NIPostcodes,'CleanNIPostcodeData.csv')
getwd()

