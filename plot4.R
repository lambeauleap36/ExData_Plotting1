plot4 <- function() {
        png(file = "plot4.png")
        
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
        
        par(mfrow = c(2,2))
        
        #Graph 1 - Global Active Power
        with(t, plot(t$DateTime,t$Global_active_power,type = "l", xlab = "", 
                     ylab = "Global Active Power (kilowatts)"))
        
        #Graph 2 - Voltage
        with(t, plot(t$DateTime,t$Voltage,type = "l", xlab = "datetime", 
                     ylab = "Voltage"))
        
        #Graph 3 - Sub Metering 3 Plots
        with(t, plot(t$DateTime,t$Sub_metering_1,type = "l", xlab = "", 
                     ylab = "Energy sub metering", col = "gray", 
                     ylim = c(0,40)))
        par(new=TRUE)
        with(t, plot(t$DateTime,t$Sub_metering_2,type = "l", xlab = "", 
                     ylab = "Energy sub metering", col = "red",
                     ylim = c(0,40)))
        par(new=TRUE)
        with(t, plot(t$DateTime,t$Sub_metering_3,type = "l", xlab = "", 
                     ylab = "Energy sub metering", col = "blue", 
                     ylim = c(0,40)))
        #Add Legend
        legend("topright",col=c("gray","red","blue"),lty=c(1,1,1), lwd=c(3,3,3),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

        
        #Graph 4 - Global Reactive Power
        with(t, plot(t$DateTime,t$Global_reactive_power,type = "l", 
                     xlab = "datetime",   ylab = "Global_reactive_power", 
                     lwd = 0.05))
        
        dev.off(which = dev.cur())
        
}       