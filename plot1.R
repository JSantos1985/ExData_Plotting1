library(lubridate)
Sys.setlocale("LC_TIME", "English")

df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df <- subset(df, dmy(df$Date) == ymd("2007-02-01") | dmy(df$Date) == ymd("2007-02-02"))

# Graphic 1
png("plot1.png", width=480, height=480)
hist(as.numeric(df$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()