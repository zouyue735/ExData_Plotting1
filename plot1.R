data <- read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
plot1_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)

png("plot1.png",width = 480, height = 480, units = "px")

hist(plot1_data$Global_active_power,xlab = "Global Active Power (kilowatts)",col="red",main = "Global Active Power")

dev.off()
rm(plot1_data)