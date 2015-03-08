#setwd("./Coursera/Data mining specialization/4_EDA/week 1/Projects")
###
DT <- read.table("household_power_consumption.txt",
                 skip=grep("1/2/2007",readLines("household_power_consumption.txt"))-1,
                 nrows=2880,sep=";",col.names=c("Date","Time","Global_active_power",
                                                "Global_reactive_power","Voltage",
                                                "Global_intensity","Sub_metering_1",
                                                "Sub_metering_2","Sub_metering_3"),
                 na.strings="?")
#
DT$dt <- paste(DT$Date,DT$Time,sep=" ")
DT$dt <- strptime(DT$dt,format="%d/%m/%Y %H:%M:%S")
### plot2
plot(DT$dt,DT$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab=NA)
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
