plot2 <- function() {
  data.raw <- read.csv("household_power_consumption.txt", 
                       sep=";", na.strings="?", stringsAsFactors=FALSE)
  data.raw$datetime <- with(data.raw, paste(Date, Time))
  data.raw$datetime <- with(data.raw, strptime(datetime, "%d/%m/%Y %H:%M:%S"))
  data.use <- subset(data.raw, 
                     datetime >= as.POSIXlt("2007-02-01") & datetime < as.POSIXlt("2007-02-03"))
  png(filename = "plot2.png", width = 480, height = 480)
  with(data.use, plot(datetime, Global_active_power, type='l', xlab = "", ylab = "Global Active Power (kilowatts)"))
  dev.off()
}