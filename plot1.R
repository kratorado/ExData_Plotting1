# plot the global active power histogram
# can be call directly : plot1()
# when given data, plot the data directly without reading file
plot1 <- function(data = NULL, file = "./household_power_consumption.txt") {
    if (is.null(data)) {
        all_data <- read.table(file, header=T, sep=";", na.strings="?")
        data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"),]
    }
    
    make_plot(sub_data$Global_active_power)
}

make_plot <- function(x) {
    png(file="plot1.png", width=480, height=480)
    hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.off()
}