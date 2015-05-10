data <- read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
plot2_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

png("plot2.png",width = 480, height = 480, units = "px")

library(lubridate)
dt<-mapply(function(date,time){parse_date_time(paste(date,time),orders = "%d/%m/%Y %H:%M:%S")},plot2_data$Date,plot2_data$Time,SIMPLIFY = TRUE)

plot(dt,plot2_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt = "n")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1170288000,1170374400,1170460800))

dev.off()
rm(plot2_data)
rm(dt)