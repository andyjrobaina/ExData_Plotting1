#this code reads in and cleans data; use data to access data
data <- read.table("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
newData <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
dateTime <- paste(newData$Date, newData$Time)
dateTime <- as.POSIXct(dateTime, format = "%Y-%m-%d %H:%M:%S")
newData$dateTime <- dateTime
data <- newData



#Plot 2
plot(newData$dateTime, newData$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "", xaxt = "n")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))



#PNG creation
png("plot2.png", width = 480, height = 480)

plot(newData$dateTime, newData$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "", xaxt = "n")
axis(1, 
     at = seq(from = as.POSIXct("2007-02-01"), 
              to = as.POSIXct("2007-02-03"), 
              by = "days"), 
     labels = format(seq(from = as.POSIXct("2007-02-01"), 
                         to = as.POSIXct("2007-02-03"), 
                         by = "days"), "%a"))
dev.off()

