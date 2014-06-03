# Read raw data
hpc <- read.csv('household_power_consumption.txt', sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","NULL","numeric","numeric","numeric"))
# Filter data to plot
hpc_to_plot <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007',]
# Convert to date and time
hpc_to_plot$DateTime <- strptime(paste(hpc_to_plot$Date, hpc_to_plot$Time), '%d/%m/%Y %H:%M:%S')

# Plot 3
png('plot3.png')
with(hpc_to_plot, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
par(new = TRUE)
with(hpc_to_plot, plot(DateTime, Sub_metering_2, type = "l", axes = FALSE, ylab = "", xlab = "", ylim=c(0.0,38.0), col = "red"))
par(new = TRUE)
with(hpc_to_plot, plot(DateTime, Sub_metering_3, type = "l", axes = FALSE, ylab = "", xlab = "", ylim=c(0.0,38.0), col = "blue"))
par(new = FALSE)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1, 1, 1))
dev.off()