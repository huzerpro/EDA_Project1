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
### plot4
par(mfcol=c(2,2),cex.lab=0.65)
with(DT,{
    plot(dt,Global_active_power,type="l",ylab="Global Active Power",xlab=NA)
    plot(dt,Sub_metering_1,type="l",xlab=NA,ylab="Energy sub metering")
    points(dt,Sub_metering_2,type="l",col="red")
    points(dt,Sub_metering_3,type="l",col="blue")
    legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lwd=1,bty="n",y.intersp=0.2,cex=0.65,yjust=1,xjust=1,
           inset=c(-0.09,-0.20))
    plot(dt,Voltage,type="l",ylab="Voltage",xlab="datetime")
    plot(dt,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()