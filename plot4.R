## 1.1) Download and Unzip Data Set ####
# setwd("./Week1")
getwd()
if(!file.exists("./data")){
        dir.create("./data")
}

zip_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zip_url, "./data/household_power_consumption.zip")
file <- unzip("./data/household_power_consumption.zip", exdir = "data")

## 1.2) Read required rows of data into R ####
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value=TRUE)
                  , header = FALSE, sep = ";", na.strings="?"
                  , col.names = c("Date", "Time", "Global_active_power"
                                  , "Global_reactive_power", "Voltage"
                                  , "Global_intensity", "Sub_metering_1"
                                  , "Sub_metering_2", "Sub_metering_3"))

## 1.3) Convert date and time from factor class to date and date-time class ####
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y", tz = "")
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 4 ####

png(filename = "plot4.png", width = 480, height = 480, units="px")

## Plot on 2x2 Canvas
par(mfrow = c(2,2))

## 1st Plot
plot(hpc$DateTime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## 2nd Plot
plot(hpc$DateTime, hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## 3rd Plot
plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(hpc$DateTime, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$DateTime, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)
## 4th Plot
plot(hpc$DateTime, hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
