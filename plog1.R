# run by using:
# $> plot1(PATH_TO_DATA_FILE)
# default path of data file is the same folder of this script
plot1 <- function(file = "./household_power_consumption.txt") {
    all_data <- read_data(file)
    sub_data <- get_data_by_date(all_data)
    make_plot(sub_data$Global_active_power)
}

read_data <- function(file) {
    dt <- read.table(file, header=T, sep=";", na.strings="?")
    dt
}

get_data_by_date <- function(all_data, date_vec = c("1/2/2007", "2/2/2007")) {
    all_data[all_data$Date %in% date_vec,]
}

make_plot <- function(x) {
    hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
}