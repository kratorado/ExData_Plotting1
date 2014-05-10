#
plot4 <- function(data = NULL, file = "./household_power_consumption.txt") {
    if (is.null(data)) {
        all_data <- read.table(file, header=T, sep=";", na.strings="?")
        data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"),]
    }
    datetime <- get_datetime(sub_data$Date, sub_data$Time)
    
    make_plot(data, datetime)
}

# create a vector of POSIXlt from given date vector and time vector
get_datetime <- function(date, time) {
    fmt <- "%d/%m/%Y %H:%M:%S"
    date_time <- paste(date, time)
    strptime(date_time, fmt)
}


make_plot <- function(data, datetime) {
    # keep current settings
    cur_mfrow <- par()$mfrow
    
    png(file="plot4.png", width=480, height=480)
    par(mfrow = c(2, 2))
    plot_active_power(data, datetime)
    plot_voltage(data, datetime)
    plot_metering(data, datetime)
    plot_reactive_power(data, datetime)
    dev.off()
    
    # recover
    par(mfrow=cur_mfrow)
}

plot_active_power <- function(data, datetime) {
    plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
}

plot_voltage <- function(data, datetime) {
    plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
}

plot_metering <- function(data, datetime) {
    plot(datetime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(datetime, data$Sub_metering_2, col="red", xlab="")
    lines(datetime, data$Sub_metering_3, col="blue", xlab="")
    legend("topright", col = c("black", "red", "blue"), lty=1, border=NULL, bty="n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

plot_reactive_power <- function(data, datetime) {
    plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Active Power")
}