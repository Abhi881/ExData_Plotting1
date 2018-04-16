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


## Creating Plot 4
#-----------------------

par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,0,0))
with(df, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lwd=1,bty="n",cex = 0.8,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})