setwd("./datasciencecoursera/C4Project1")

#reading 100000 lines of the file
df <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, nrows = 100000)

#creating Datetime variable
df$Datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

#changing df$Date class from character to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#subsetting the needed timeframe
df <- df[df$Date %in% as.Date("01-02-2007", "%d-%m-%Y") : as.Date("02-02-2007", "%d-%m-%Y"),]

#Creating and saving the plot
df$Global_active_power <- as.numeric(df$Global_active_power)
par(mfrow=c(2,2))

plot(df$Datetime, df$Global_active_power, type="l", col="black", ylab="Global Active Power (kilowatts)")

plot(df$Datetime, df$Voltage, type="l", col="black", ylab="Voltage")

plot(df$Datetime, df$Sub_metering_1, type="l", col="black", ylab="Energy sub metering")
lines(df$Datetime, df$Sub_metering_2, type="l", col="red")
lines(df$Datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

plot(df$Datetime, df$Global_reactive_power, type="l", col="black", ylab="Global Reactive Power (kilowatts)")

dev.copy(png, file="plot4.png")
dev.off()
