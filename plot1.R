plot1 <- function() {
        png(file = "plot1.png")
        
        #Read just data for dates 2/1/2007 and 2/2/2007
        #and add DateTime column with lubridate library and col names
        t <- read.table("household_power_consumption.txt", header = TRUE, 
                              sep =";", nrows = 2880, na.strings = "?", 
                              stringsAsFactors = FALSE, skip = 66636)
        library(lubridate)
        colnames(t) <- c("Date","Time", "Global_active_power", 
                         "Global_reactive_power", "Voltage", "Global_intensity", 
                         "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        
        #Make histogram
        hist(t$Global_active_power, col = "red", xlab = 
                     "Global Active Power (kilowatts)", ylab = "Frequency", 
             main = "Global Active Power")
        
        dev.off(which = dev.cur())
        
}        