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
