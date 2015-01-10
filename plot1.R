library(chron)

# load the txt file and change the column data types

electric_data <- 
          read.csv("D:/Data Science Track/Exploratory Data Analysis/Week1/exdata-data-household_power_consumption/household_power_consumption.txt", 
                   sep=";" ,
                   stringsAsFactors=FALSE)
#str(electric_data)

electric_data$Date <- as.Date(electric_data$Date , format = "%d/%m/%Y")
electric_data$Time <- chron(times=electric_data$Time)
electric_data$Global_active_power <- as.numeric(electric_data$Global_active_power)
electric_data$Global_reactive_power <- as.numeric(electric_data$Global_reactive_power)
electric_data$Voltage <- as.numeric(electric_data$Voltage)
electric_data$Global_intensity <- as.numeric(electric_data$Global_intensity)
electric_data$Sub_metering_1 <- as.numeric(electric_data$Sub_metering_1)
electric_data$Sub_metering_2 <- as.numeric(electric_data$Sub_metering_2)
electric_data$Sub_metering_3 <- as.numeric(electric_data$Sub_metering_3)

#str(electric_data)
#head(electric_data)

# select the specefic records in new data frame
target_data <- subset(electric_data , 
                      electric_data$Date == as.Date("01/02/2007" , "%d/%m/%Y") 
                      | electric_data$Date == as.Date("02/02/2007" , "%d/%m/%Y")
)

# draw a histogram on graphic device

hist(target_data$Global_active_power , 
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     main ="Global Active Power")
# copy the hist into a png  file device and close it

dev.copy(png, file = "plot1.png")
dev.off()

