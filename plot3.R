# Plot 3 ####
png(filename = "plot3.png", width = 480, height = 480, units="px")

plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(hpc$DateTime, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$DateTime, hpc$Sub_metering_3, type = "l", col = "blue")

legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)

dev.off()