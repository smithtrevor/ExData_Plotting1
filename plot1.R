#Course Project #1 - Coursera Exploratory Data Analysis
#Plot 1

# script assumes the input data file is located in the same directory as the script
# source data can be retrieved from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# read in the data file
data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na ="?")

# convert the Date column to the Date type
data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))

# filter subset the data to only get records for 2007-02-01 and 2007-02-02
filtered <- filter(data, data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"))

# convert the Global_active_power column to numeric
filtered <- mutate(filtered, Global_active_power = as.numeric(Global_active_power))

# create the png object
png( filename = "plot1.png", width = 480, height = 480)

# create the histogram
hist(filtered$Global_active_power/1000, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# write out the file
dev.off()