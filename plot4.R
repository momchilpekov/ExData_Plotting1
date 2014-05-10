## Initialize input file
filename <- "./household_power_consumption.txt"
## Read header data
datah<-read.table(filename, nrows=4, sep=";", header=T, na.strings="?")
colNames<-names(datah)
## Read data only for the two day of interest
data<-read.table(filename, nrows=2880, sep=";", header=F, col.names = colNames, na.strings="?", skip=66637)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
## Plot 4
png(file="plot4.png")
## Initialize 4 mini plots
par(mfrow=c(2,2))

## Plot topleft
with (data, {
        plot(DateTime, Global_active_power, type="n",xlab="", ylab="Global Active Power")
        lines(DateTime, Global_active_power)
})
## Plot top right 
with (data, {
        plot(DateTime, Voltage, type="n")
        lines(DateTime, Voltage)
})
## Plot down left
with (data, {
        plot(DateTime, Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_1, col="black")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
})
legend("topright",lwd=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
## Plot down right
with (data, {
        plot(DateTime, Global_reactive_power, type="n")
        lines(DateTime, Global_reactive_power)
})
dev.off()