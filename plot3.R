# Get and Subset Data
rawData <- read.table("household_power_consumption.txt", sep = ";", header = T)
rawData$Date <- as.Date(rawData$Date, "%d/%m/20%y")
rawData <- subset(rawData, Date >= "2007-02-01" & Date <= "2007-02-02")
#funcTime <- function(x) {strptime(x, "%T")}
#rawData$Time <- lapply(rawData$Time,funcTime)

# Get the Global Active Pwer
dateIdx <- gsub("2007-02-","",rawData$Date)
n02 <- length(dateIdx) - length(dateIdx[dateIdx == "02"])
idx <- c(1, n02, length(dateIdx))

dateTime <- paste0(rawData$Date, rawData$Time,sep = " ")
dateTime <- gsub("2007-02-","",dateTime)
dateTime <- gsub(":","",dateTime)
dateTime <- seq.int(dateTime)

submet1 <- as.numeric(as.character(rawData$Sub_metering_1))
submet2 <- as.numeric(as.character(rawData$Sub_metering_2))
submet3 <- as.numeric(as.character(rawData$Sub_metering_3))


# Create the Plot in the PNG Device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
xrange <- range(dateTime)
yrange <- range(submet1)

# Draw empty plot
plot(xrange,
     yrange, 
     type = "n", 
     pch = ".", 
     xlab = "",
     xaxt = "n",
     ylab = "Energy sub metering")
axis(1, at=idx, labels=c("Thu", "Fri", "Sat"))

# Draw Lnes
lines(dateTime, submet1, col = "black")
lines(dateTime, submet2, col = "red")
lines(dateTime, submet3, col = "blue")

# Create Legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()








