data <- read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
plot4_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

library(lubridate)
dt<-mapply(function(date,time){parse_date_time(paste(date,time),orders = "%d/%m/%Y %H:%M:%S")},plot4_data$Date,plot4_data$Time,SIMPLIFY = TRUE)

plot(dt,plot4_data$Global_active_power,type="l",xlab="",ylab="Global Active Power",xaxt = "n")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1170288000,1170374400,1170460800))

plot(dt,plot4_data$Voltage,type="l",xlab="datetime",ylab="Voltage",xaxt = "n")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1170288000,1170374400,1170460800))

plot(dt,plot4_data$Sub_metering_1,xlab="",ylab="Energy sub metering",xaxt = "n",col="black",type="l")
lines(dt,plot4_data$Sub_metering_2,xlab="",ylab="Energy sub metering",xaxt = "n",col="red")
lines(dt,plot4_data$Sub_metering_3,xlab="",ylab="Energy sub metering",xaxt = "n",col="blue")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1170288000,1170374400,1170460800))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),bty="n")

plot(dt,plot4_data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",xaxt = "n")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1170288000,1170374400,1170460800))

dev.off()
rm(plot4_data)
rm(dt)