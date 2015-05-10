data <- read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
plot3_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

png("plot3.png",width = 480, height = 480, units = "px")

library(lubridate)
dt<-mapply(function(date,time){parse_date_time(paste(date,time),orders = "%d/%m/%Y %H:%M:%S")},plot3_data$Date,plot3_data$Time,SIMPLIFY = TRUE)

plot(dt,plot3_data$Sub_metering_1,xlab="",ylab="Energy sub metering",xaxt = "n",col="black",type="l")
lines(dt,plot3_data$Sub_metering_2,xlab="",ylab="Energy sub metering",xaxt = "n",col="red")
lines(dt,plot3_data$Sub_metering_3,xlab="",ylab="Energy sub metering",xaxt = "n",col="blue")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1170288000,1170374400,1170460800))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

dev.off()
rm(plot3_data)
rm(dt)