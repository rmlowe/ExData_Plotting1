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

png("plot2.png")
with(
  dat,
  plot(
    datetime,
    Global_active_power,
    type = "l",
    xlab = NA,
    ylab = "Global Active Power (kilowatts)"
  )
)
dev.off()
