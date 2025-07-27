
#this code reads in and cleans data; use data to access data
data <- read.table("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
newData <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
dateTime <- paste(newData$Date, newData$Time)
dateTime <- as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")
newData$dateTime <- dateTime
data <- newData

#Plot 1
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")


#PNG creation
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")

dev.off()
