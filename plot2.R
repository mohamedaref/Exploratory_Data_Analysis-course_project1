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



# draw a histogram on graphic device

plot(target_data$Global_active_power~target_data$DateTime, 
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab ="")

# copy the hist into a png  file device and close it

dev.copy(png, file = "plot2.png")
dev.off()
