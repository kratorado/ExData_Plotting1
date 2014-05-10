#
plot2 <- function(data = NULL, file = "./household_power_consumption.txt") {
    if (is.null(data)) {
        all_data <- read.table(file, header=T, sep=";", na.strings="?")
        data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"),]
    }
    datetime <- get_datetime(sub_data$Date, sub_data$Time)
    make_plot(date_time, sub_data$Global_active_power)
}

# create a vector of POSIXlt from given date vector and time vector
get_datetime <- function(date, time) {
    fmt <- "%d/%m/%Y %H:%M:%S"
    date_time <- paste(date, time)
    strptime(date_time, fmt)
}

make_plot <- function(x, y) {
    png(file="plot2.png", width=480, height=480)
    plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}