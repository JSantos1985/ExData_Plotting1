library(lubridate)
Sys.setlocale("LC_TIME", "English")

df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df <- subset(df, dmy(df$Date) == ymd("2007-02-01") | dmy(df$Date) == ymd("2007-02-02"))
df$DateAndTime <- dmy(df$Date) + hms(df$Time)

# Graphic 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(df$DateAndTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(df$DateAndTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

with(df, plot(DateAndTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(df, lines(DateAndTime, Sub_metering_2, type="l", col="red"))
with(df, lines(DateAndTime, Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))

plot(df$DateAndTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()