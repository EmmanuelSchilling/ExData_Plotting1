#################################################################################################### 
# plot3.r
# 
# Created in partial fulfillment of Course Project 1 of the Exploratory Data Analysis
# course available on Coursera.
# 
####################################################################################################

plot3 <- function() {
    require(dplyr)
    
    # Read the data.
    plot_data <- read.table("household_power_consumption.txt", sep=";", quote="\"")
    
    # Subset to the dates of interest.
    plot_data <- filter(plot_data, V1 == '1/2/2007' | V1 == '2/2/2007')
    
    # Create the date-time data for the x-axis.
    plot_data <- mutate(plot_data, date_time = paste(as.Date(plot_data$V1, "%d/%m/%y%y"), as.character(plot_data$V2)))
    datetime = strptime(plot_data$date_time, "%Y-%m-%d %H:%M:%S")
    
    # Plot the points.
    par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    with(plot_data,  {
        plot(datetime, as.numeric(as.character(V7)), type="l", col="black", xlab="", ylab="Energy sub metering", mar=c(0, 4, 0, 0))
        lines(datetime, as.numeric(as.character(V8)), col="red")
        lines(datetime, as.numeric(as.character(V9)), col="blue")
        legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
    })
}    
    