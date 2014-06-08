data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')

subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 

subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

png("plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))

plot(subdata$datetime,subdata$Global_active_power,xlab ="", ylab = "Global Active Power", type ="l")

plot(subdata$datetime,subdata$Voltage,xlab ="datetime", ylab = "Voltage", type ="l")

plot(subdata$datetime,subdata$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(subdata$datetime,subdata$Sub_metering_2, col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

plot(subdata$datetime,subdata$Global_reactive_power,xlab ="datetime", ylab = "Global_reactive_power", type ="l")

dev.off()