power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    colClasses=c("character", "character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"),
                    na.strings = "?")
feb1 <- subset(power, Date == "1/2/2007")
feb2 <- subset(power, Date == "2/2/2007")
feb <- rbind(feb1, feb2)
png(filename = "plot1.png", width = 480, height = 480)
hist(feb$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()