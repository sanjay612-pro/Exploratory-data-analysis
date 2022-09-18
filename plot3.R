#Reading the database.
EPC <- read.table("household_power_consumption.txt", header = T, 
       sep = ";", na.strings = "?")

#Getting only the data from the dates 2007-02-01 and 2007-02-02.
EPC <- subset(EPC, Date %in% c("1/2/2007","2/2/2007"))

#Converting the date.
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(data1$Date), data1$Time)
EPC$date_time <- as.POSIXct(date_time)

#Generating the plot.
plot(EPC$Sub_metering_1 ~ EPC$date_time, type="l",
       ylab="Energy sub metering", xlab="")
lines(EPC$Sub_metering_2 ~ EPC$date_time,col='Red')
lines(EPC$Sub_metering_3 ~ EPC$date_time,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Creating the .png file of the plot.
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
