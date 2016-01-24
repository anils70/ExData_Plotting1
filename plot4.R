# EDA  project - plot2.png
# 
# This script uses individual household electric power consumption Data Set to dra plot1.png
# 


#Read the power data set
powerDataSet <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec=".")

#Filter out Feb-1 and Feb-2 2007 data set
subPowerDataSet <- powerDataSet[powerDataSet$Date %in% c("1/2/2007","2/2/2007"),] 

datetime <- strptime(paste(subPowerDataSet$Date, subPowerDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subPowerDataSet$Global_active_power) 
globalReactivePower <- as.numeric(subPowerDataSet$Global_reactive_power) 
voltage <- as.numeric(subPowerDataSet$Voltage) 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 

png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  


plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
ines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 

dev.off() 



