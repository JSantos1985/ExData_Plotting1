library(lubridate)
Sys.setlocale("LC_TIME", "English")

df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df <- subset(df, dmy(df$Date) == ymd("2007-02-01") | dmy(df$Date) == ymd("2007-02-02"))
df$DateAndTime <- dmy(df$Date) + hms(df$Time)

# Graphic 2
png("plot2.png", width=480, height=480)
plot(df$DateAndTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()