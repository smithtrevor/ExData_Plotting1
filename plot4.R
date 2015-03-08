#Course Project #1 - Coursera Exploratory Data Analysis
#Plot 1

# script assumes the input data file is located in the same directory as the script
# source data can be retrieved from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# read in the data file
data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na="?")

# convert the Date column to the Date type
data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))

# filter subset the data to only get records for 2007-02-01 and 2007-02-02
filtered <- filter(data, data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"))

# convert the sub metering columns to numeric
filtered <- mutate(filtered, Sub_metering_1 = as.numeric(Sub_metering_1))
filtered <- mutate(filtered, Sub_metering_2 = as.numeric(Sub_metering_2))
filtered <- mutate(filtered, Sub_metering_3 = as.numeric(Sub_metering_3))

# combine the date and times and store as POSIXct
filtered <- mutate(filtered, date_time = as.POSIXct(paste(Date, Time, sep = " ")))

# create the png object
png( filename = "plot4.png", width = 480, height = 480)

# set up the 2x2 format
par(mfrow = c(2,2))

# create plot 1
plot(filtered$date_time, filtered$Global_active_power, type = 'l', 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# create plot 2
plot(filtered$date_time, filtered$Voltage, type='l', ylab = "Voltage", xlab = "datetime" )

# create plot 3
plot(filtered$date_time, filtered$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "", axes = TRUE)

## add lines
lines(filtered$date_time, filtered$Sub_metering_3, col = "Blue")
lines(filtered$date_time, filtered$Sub_metering_2, col = "Red")

## add legend
legend(x = 'topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1),col=c('black','red','blue'))

# create plot 4
plot(filtered$date_time, filtered$Global_reactive_power, type='l', ylab = "Global_reactive_power", xlab = "datetime" )

# write out the file
dev.off()
