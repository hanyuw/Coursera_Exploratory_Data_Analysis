## Hanyu Wang
## Aug.17th
## Coursera Exploratory Data Analysis Assignment 1
## Plot 3

## read the table and qualifying from 2007-02-01 to 2007-02-02
# "One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates."
# remains unsolvable.
HPCtable = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", quote = "", stringsAsFactors = FALSE)
HPCselectTable = subset(HPCtable, (as.Date(HPCtable$Date, format = "%d/%m/%Y")>= " 2007-02-01" & as.Date(HPCtable$Date, format = "%d/%m/%Y")<= " 2007-02-02"))

# write.csv(HPCselectTable, file = "selecttable.csv")
# HPCselectTable = read.csv("selecttable.csv", stringsAsFactors = FALSE)

## Stripe the time and initalize a new column
HPCselectTable$DateTime = strptime(paste(HPCselectTable$Date, HPCselectTable$Time), format = "%d/%m/%Y %H:%M:%S")
#date_time = paste(HPCselectTable$Date, HPCselectTable$Time)
#HPCselectTable$DateTime = date_time


with(HPCselectTable, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(HPCselectTable, points(DateTime, Sub_metering_1, col = "BLACK", type = "l"))
with(HPCselectTable, points(DateTime, Sub_metering_2, col = "RED", type = "l"))
with(HPCselectTable, points(DateTime, Sub_metering_3, col = "BLUE", type = "l"))

## Add a legend
legend("topright", lty = 1, col = c("BLACK", "RED", "BLUE"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save the plot to the file device.
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()

## Problem unsolved: part of the legend is missing.