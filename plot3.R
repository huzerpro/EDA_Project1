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
### plot3
plot(DT$dt,DT$Sub_metering_1,type="l",xlab=NA,ylab="Energy sub metering")
points(DT$dt,DT$Sub_metering_2,type="l",col="red")
points(DT$dt,DT$Sub_metering_3,type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1,y.intersp=0.5,cex=0.75,yjust=1,xjust=1)
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()