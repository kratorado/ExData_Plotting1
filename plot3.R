#
plot3 <- function(data = NULL, file = "./household_power_consumption.txt") {
    if (is.null(data)) {
        all_data <- read.table(file, header=T, sep=";", na.strings="?")
        data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"),]
    }
    datetime <- get_datetime(sub_data$Date, sub_data$Time)

    make_plot(date_time, sub_data$Sub_metering_1, sub_data$Sub_metering_2, sub_data$Sub_metering_3)
}


# create a vector of POSIXlt from given date vector and time vector
get_datetime <- function(date, time) {
    fmt <- "%d/%m/%Y %H:%M:%S"
    date_time <- paste(date, time)
    strptime(date_time, fmt)
}

make_plot <- function(x, y1 ,y2, y3) {
    png(file="plot3.png", width=480, height=480)
    plot(x, y1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(x, y2, col="red", xlab=NULL)
    lines(x, y3, col="blue", xlab=NULL)
    legend("topright", col = c("black", "red", "blue"), lty=1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}