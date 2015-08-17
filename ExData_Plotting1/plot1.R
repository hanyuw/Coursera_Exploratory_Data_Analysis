## Hanyu Wang
## Aug.9th
## Coursera Exploratory Data Analysis Assignment 1
## Plot 1

# read the table
# "One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates."
# remains unsolvable.
HTCtable = read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, header = TRUE)

# Select required time
HTCselTable = subset(HTCtable, (as.Date(HTCtable$Date, format = "%d/%m/%Y")>"2007-01-31"&as.Date(HTCtable$Date, format = "%d/%m/%Y")<"2007-02-03"))

# write.csv(HPCselectTable, file = "selecttable.csv")
# HPCselectTable = read.csv("selecttable.csv", stringsAsFactors = FALSE)

# Plotting the graph
hist(HTCselTable$Global_active_power, col = "RED", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Saves plot to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()