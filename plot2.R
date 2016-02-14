power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    colClasses=c("character", "character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"),
                    na.strings = "?")

install.packages("lubridate")
library(lubridate)
#Convert Date field from character to POSIXct
power$Date <- dmy(power$Date)
#subset power table
feb_p2 <- subset(power, Date >= "2007-01-31 0:00" & Date <= "2007-02-01 23:59")
#Concatenate Date and Time field as POSIX data type
daytime <- as.POSIXct(paste(feb_p2$Date, feb_p2$Time))
feb_p2$Date <- daytime
#Save plot as png
png(filename = "plot2.png", width = 480, height = 480)
plot(feb_p2$Date, feb_p2$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()