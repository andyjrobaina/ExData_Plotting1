#this code reads in and cleans data; use data to access data
data <- read.table("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
newData <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
dateTime <- paste(newData$Date, newData$Time)
dateTime <- as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")
newData$dateTime <- dateTime
data <- newData



#Plot 3
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




#PNG creation
png("plot3.png", width = 480, height = 480)

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
dev.off()

