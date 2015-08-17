## Hanyu Wang
## Aug.17th
## Coursera Exploratory Data Analysis Assignment 1
## Plot 2

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

## Plotting the graph
with(HPCselectTable, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))

## Copy the plot to the file device
dev.copy(png, file = "plot2.png")
dev.off()