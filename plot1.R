#################################################################################################### 
# plot1.r
# 
# Created in partial fulfillment of Course Project 1 of the Exploratory Data Analysis
# course available on Coursera.
# 
####################################################################################################


####################################################################################################
# Main function.
plot1 <- function() {
    # Read the data.
    plot_data <- read.table("household_power_consumption.txt", sep=";", quote="\"")
    
    # Filter to the dates of interest.
    plot_data <- filter(plot_data, V1 == '1/2/2007' | V1 == '2/2/2007')
    
    # Create the date-time data for the x-axis.
    plot_data <- mutate(plot_data, date_time = paste(as.Date(plot_data$V1, "%d/%m/%y%y"), as.character(plot_data$V2)))
    datetime = strptime(plot_data$date_time, "%Y-%m-%d %H:%M:%S")
    
    # Plot the points.
    png(filename="plot1.png")
    par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    with(plot_data, {
        hist(as.numeric(as.character(V3)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    })
    dev.off()
}

