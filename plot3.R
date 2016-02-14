power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    colClasses=c("character", "character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"),
                    na.strings = "?")

install.packages("lubridate")
library(lubridate)
#Convert Date field from character to POSIXct
power$Date <- dmy(power$Date)
#subset power table
feb_p3 <- subset(power, Date >= "2007-01-31 0:00" & Date <= "2007-02-01 23:59")
#Concatenate Date and Time field as POSIX data type
daytime <- as.POSIXct(paste(feb_p3$Date, feb_p3$Time))
feb_p3$Date <- daytime
#Save plot as png
png(filename = "plot3.png", width = 480, height = 480)
plot(feb_p3$Date, feb_p3$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(feb_p3$Date, feb_p3$Sub_metering_2, type = "l", col = "red")
lines(feb_p3$Date, feb_p3$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
dev.off()