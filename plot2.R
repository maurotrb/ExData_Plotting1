# Read raw data
hpc <- read.csv('household_power_consumption.txt', sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","NULL","numeric","numeric","numeric"))
# Filter data to plot
hpc_to_plot <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007',]
# Convert to date and time
hpc_to_plot$DateTime <- strptime(paste(hpc_to_plot$Date, hpc_to_plot$Time), '%d/%m/%Y %H:%M:%S')

# Plot 2
png('plot2.png')
with(hpc_to_plot, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()