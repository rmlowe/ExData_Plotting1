full_dataset <-
  read.csv(
    unz(
      "exdata-data-household_power_consumption.zip",
      "household_power_consumption.txt"
    ),
    sep = ";",
    na.strings = "?"
  )
full_dataset$datetime <-
  strptime(paste(full_dataset$Date, full_dataset$Time),
           format = "%d/%m/%Y %H:%M:%S")
dat <-
  full_dataset[full_dataset$datetime >= strftime("2007-02-01") &
                 full_dataset$datetime < strftime("2007-02-03"),]

png("plot3.png")
with(dat, {
  plot(
    datetime,
    Sub_metering_1,
    type = "l",
    xlab = NA,
    ylab = "Energy sub metering"
  )
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend(
    "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lwd = 1
  )
})
dev.off()
