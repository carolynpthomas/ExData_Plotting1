setwd("C:/Users/carol/Documents/R/Data Science Specialization in Coursera")
unzip("exdata_data_household_power_consumption.zip")
elctrcData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                     check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
elctrcData2007 <- subset(elctrcData, Date %in% c("1/2/2007","2/2/2007")) # date format is day/month/year
as.Date(elctrcData2007$Date)
as.numeric(elctrcData2007$Global_active_power)
png("plot1.png",width=480, height=480)
hist(elctrcData2007$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
