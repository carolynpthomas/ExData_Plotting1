setwd("C:/Users/carol/Documents/R/Data Science Specialization in Coursera")
unzip("exdata_data_household_power_consumption.zip")
elctrcData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                       check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
elctrcData2007 <- subset(elctrcData, Date %in% c("1/2/2007","2/2/2007")) # date format is day/month/year

as.Date(elctrcData2007$Date)
as.numeric(elctrcData2007$Global_active_power)
as.numeric(elctrcData2007$Sub_metering_1)
as.numeric(elctrcData2007$Sub_metering_2)
as.numeric(elctrcData2007$Sub_metering_3)
elctrcData2007$DateTime <- strptime(paste(elctrcData2007$Date, elctrcData2007$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480, height=480)
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(.5,.5,.5,.5))
with(elctrcData2007, 
     {plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex = 0.2)
       plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
       lines(DateTime, Sub_metering_2, type="l", col="red")
       lines(DateTime, Sub_metering_3, type="l", col="blue")
       legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
       plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
       plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        }
    )
dev.off()
