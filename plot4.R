plot4 <- function() {
  data.raw <- read.csv("household_power_consumption.txt", 
                       sep=";", na.strings="?", stringsAsFactors=FALSE)
  data.raw$datetime <- with(data.raw, paste(Date, Time))
  data.raw$datetime <- with(data.raw, strptime(datetime, "%d/%m/%Y %H:%M:%S"))
  data.use <- subset(data.raw, 
                     datetime >= as.POSIXlt("2007-02-01") & datetime < as.POSIXlt("2007-02-03"))
  png(filename = "plot4.png", width = 480, height = 480)
  par("mfrow" = c(2,2))
  with(data.use, plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
  with(data.use, plot(datetime, Voltage, type="l"))
  with(data.use, plot(datetime, Sub_metering_1, col="black", xlab = "",
                      ylab = "Energy sub metering", type = "l"))
  with(data.use, lines(datetime, Sub_metering_2, col = "red"))
  with(data.use, lines(datetime, Sub_metering_3, col = "blue"))
  legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"))
  with(data.use, plot(datetime, Global_reactive_power, type="l"))
  dev.off()
}