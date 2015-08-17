## Hanyu Wang
## Aug.17th
## Coursera Exploratory Data Analysis Assignment 1
## Plot 4

## read the table and qualifying from 2007-02-01 to 2007-02-02
# "One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates."
# remains unsolvable.
HPCtable = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", quote = "", stringsAsFactors = FALSE)
HPCselectTable = subset(HPCtable, (as.Date(HPCtable$Date, format = "%d/%m/%Y")>= " 2007-02-01" & as.Date(HPCtable$Date, format = "%d/%m/%Y")<= " 2007-02-02"))

# write.csv(HPCselectTable, file = "selecttable.csv")
# HPCselectTable = read.csv("selecttable.csv", stringsAsFactors = FALSE)

## Stripe the time and initalize a new column
HPCselectTable$datetime = strptime(paste(HPCselectTable$Date, HPCselectTable$Time), format = "%d/%m/%Y %H:%M:%S")
#date_time = paste(HPCselectTable$Date, HPCselectTable$Time)
#HPCselectTable$datetime = date_time


## Create a plotting pannel
par(mfcol = c(2,2))

## Upperleft plot: Global Active Power
with(HPCselectTable, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

## Lowerleft plot: voltage
with(HPCselectTable, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(HPCselectTable, points(datetime, Sub_metering_1, col = "BLACK", type = "l"))
with(HPCselectTable, points(datetime, Sub_metering_2, col = "RED", type = "l"))
with(HPCselectTable, points(datetime, Sub_metering_3, col = "BLUE", type = "l"))
legend("topright", lty = 1, col = c("BLACK", "RED", "BLUE"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## Upperright plot: Energy sub metering
with(HPCselectTable, plot(datetime, Voltage, type = "l"))

## Lowerright plot: Global_reactive_power
with(HPCselectTable, plot(datetime, Global_reactive_power, type = "l"))

## Copy to the file device
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()

## Problem unsolved: part of the legend is missing.