#this code reads in and cleans data; use data to access data
data <- read.table("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
newData <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
dateTime <- paste(newData$Date, newData$Time)
dateTime <- as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")
newData$dateTime <- dateTime
data <- newData



#Plot 4
par(mfrow = c(2, 2))
plot(newData$dateTime, newData$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "", xaxt = "n")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))


plot(newData$dateTime, newData$Voltage, col = "black", type = "l", xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))


plot(newData$dateTime, newData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(newData$dateTime, newData$Sub_metering_2, col = "red")
lines(newData$dateTime, newData$Sub_metering_3, col = "blue")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)   # lty = 1 means solid line


plot(newData$dateTime, newData$Global_reactive_power, col = "black", type = "l", xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))





#PNG creation
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
plot(newData$dateTime, newData$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "", xaxt = "n")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))


plot(newData$dateTime, newData$Voltage, col = "black", type = "l", xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))


plot(newData$dateTime, newData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(newData$dateTime, newData$Sub_metering_2, col = "red")
lines(newData$dateTime, newData$Sub_metering_3, col = "blue")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)   # lty = 1 means solid line


plot(newData$dateTime, newData$Global_reactive_power, col = "black", type = "l", xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))

dev.off()



