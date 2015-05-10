plot1 <- function() {
  data.raw <- read.csv("household_power_consumption.txt", 
                       sep=";", na.strings="?", stringsAsFactors=FALSE)
  data.raw$datetime <- with(data.raw, paste(Date, Time))
  data.raw$datetime <- with(data.raw, strptime(datetime, "%d/%m/%Y %H:%M:%S"))
  data.use <- subset(data.raw, 
                     datetime >= as.POSIXlt("2007-02-01") & datetime < as.POSIXlt("2007-02-03"))
  png(filename = "plot1.png", width = 480, height = 480)
  hist(data.use$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
       ylab = "Frequency", col = "red")
  dev.off()
}