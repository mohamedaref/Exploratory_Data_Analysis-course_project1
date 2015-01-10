electric_data <- 
          read.csv("D:/Data Science Track/Exploratory Data Analysis/Week1/exdata-data-household_power_consumption/household_power_consumption.txt",
                   sep=";" , 
                   stringsAsFactors=FALSE)

# subset the data to select the data of two dates only
target_data <- subset(electric_data , 
                      electric_data$Date == "1/2/2007" 
                      | electric_data$Date == "2/2/2007")


# create a date time variable
target_data$DateTime <- as.POSIXct(paste(target_data$Date, target_data$Time), format="%d/%m/%Y %H:%M:%S") # combine data and time

# set the accurate classes 
target_data$Date <- as.Date(target_data$Date , format = "%d/%m/%Y")
target_data$Global_active_power <- as.numeric(target_data$Global_active_power)
target_data$Global_reactive_power <- as.numeric(target_data$Global_reactive_power)
target_data$Voltage <- as.numeric(target_data$Voltage)
target_data$Global_intensity <- as.numeric(target_data$Global_intensity)
target_data$Sub_metering_1 <- as.numeric(target_data$Sub_metering_1)
target_data$Sub_metering_2 <- as.numeric(target_data$Sub_metering_2)
target_data$Sub_metering_3 <- as.numeric(target_data$Sub_metering_3)


# draw on graphic device a histogram

plot(target_data$Sub_metering_1~target_data$DateTime, 
     type="n",
     ylab = "Energy Sub metering",
     xlab ="")


lines(target_data$Sub_metering_1~target_data$DateTime , type = "l" )
lines(target_data$Sub_metering_2~target_data$DateTime , type = "l" , col ="red")
lines(target_data$Sub_metering_3~target_data$DateTime , type = "l" , col = "blue")
legend("topright",
       lwd = c(1.5,1.5) ,
       lty=c(1,1),
       xjust = 1,
       yjust = 1,
       #cex=0.8,
       col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
       )

# copy the hist into a png  file device and close it

dev.copy(png, file = "plot3.png")
dev.off()
