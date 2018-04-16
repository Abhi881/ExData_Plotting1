## Read the dataset using read.table funtion

powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                        colClasses = c(rep("character",2),rep('numeric', 7))) ## assigning different data datatypes to coloums while loading

## Format date to Type Date
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y") 


## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
df <- powerData[(powerData$Date>="2007-02-01") & (powerData$Date<="2007-02-02"),]


## Combine Date and Time column
DateTime <- paste(df$Date, df$Time)

## Remove Date and Time column
df<- df[c(-1,-2)]
str(df)

## Add DateTime column
df <- cbind(DateTime, df)

## Format dateTime Column
df$DateTime <- as.POSIXct(DateTime)

## Creating the histogram Plot 1
#------------------------------------------------
hist(df$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
