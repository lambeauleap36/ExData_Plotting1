plot2 <- function() {
        png(file = "plot2.png")
        
        #Read just data for dates 2/1/2007 and 2/2/2007
        #and add DateTime column with lubridate library and col names
        t <- read.table("household_power_consumption.txt", header = TRUE, 
                              sep =";", nrows = 2880, na.strings = "?", 
                              stringsAsFactors = FALSE, skip = 66636)
        
        library(lubridate)
        colnames(t) <- c("Date","Time", "Global_active_power", 
                         "Global_reactive_power", "Voltage", "Global_intensity", 
                          "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        t$DateTime <-  dmy_hms(paste(t$Date, t$Time))
        
        #Make time series
        with(t, plot(t$DateTime,t$Global_active_power,type = "l", xlab = "", 
                     ylab = "Global Active Power (kilowatts)"))
        dev.off(which = dev.cur())
        
}        