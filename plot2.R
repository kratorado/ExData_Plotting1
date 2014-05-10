#
plot2 <- function(file = "./household_power_consumption.txt") {
    all_data <- read_data(file)
    sub_data <- get_data_by_date(all_data)
    date_time <- get_date_time(sub_data$Date, sub_data$Time)
    make_plot(date_time, sub_data$Global_active_power)
}

read_data <- function(file) {
    dt <- read.table(file, header=T, sep=";", na.strings="?")
    dt
}

get_data_by_date <- function(all_data, date_vec = c("1/2/2007", "2/2/2007")) {
    all_data[all_data$Date %in% date_vec,]
}


# create a vector of POSIXlt from given date vector and time vector
get_date_time <- function(date, time) {
    fmt <- "%d/%m/%Y %H:%M:%S"
    date_time <- paste(date, time)
    strptime(date_time, fmt)
}

make_plot <- function(x, y) {
    plot(x, y, type="l", ylab="Global Active Power (kilowatts)", xlab=NULL)
    dev.copy(png, file="plot2.png", width=480, height=480)
    dev.off()
}