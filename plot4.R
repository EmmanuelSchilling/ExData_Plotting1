#################################################################################################### 
# plot4.r
# 
# Created in partial fulfillment of Course Project 1 of the Exploratory Data Analysis
# course available on Coursera.
# 
####################################################################################################

plot4 <- function() {
    # Read the data.
    plot_data <- read.table("household_power_consumption.txt", sep=";", quote="\"")
    
    # Filter to the dates of interest.
    plot_data <- filter(plot_data, V1 == '1/2/2007' | V1 == '2/2/2007')
    
    # Create the date-time data for the x-axis.
    plot_data <- mutate(plot_data, date_time = paste(as.Date(plot_data$V1, "%d/%m/%y%y"), as.character(plot_data$V2)))
    datetime = strptime(plot_data$date_time, "%Y-%m-%d %H:%M:%S")
    
    # Plot the points.
    png(filename="plot4.png")
    par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma =c(0, 0, 2, 0))
    with(plot_data, {
        # Plot 1
        plot(datetime, as.numeric(as.character(V3)), type="l", col="black", xlab="", ylab="Global Active Power")

        # Plot 2
        plot(datetime, as.numeric(as.character(V5)), type="l", col="black", xlab="datetime", ylab="Voltage")

        # Plot 3
        plot(datetime, as.numeric(as.character(V7)), type="l", col="black", xlab="", ylab="Energy sub metering", mar=c(0, 4, 0, 0))
        lines(datetime, as.numeric(as.character(V8)), col="red")
        lines(datetime, as.numeric(as.character(V9)), col="blue")
        legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty="n", lty=1, col=c('black', 'red', 'blue'))

        # Plot 4
        plot(datetime, as.numeric(as.character(V4)), type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
    })
    dev.off()
}