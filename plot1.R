# EDA  project - plot1.png
# 
# This script uses individual household electric power consumption Data Set to dra plot1.png
# 


#Read the power data set
powerDataSet <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec=".")

#Filter out Feb-1 and Feb-2 2007 data set
subPowerDataSet <- powerDataSet[powerDataSet$Date %in% c("1/2/2007","2/2/2007"),] 

globalActivePower <- as.numeric(subPowerDataSet$Global_active_power) 

png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 
