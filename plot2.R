data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 

subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

png("plot2.png", height = 480, width = 480)
plot(subdata$datetime,subdata$Global_active_power,xlab ="", ylab = "Global Active Power (kilowatts)", type ="l")

dev.off()