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
globActPow <- as.numeric(as.character(rawData$Global_active_power))


# Create the Plot in the PNG Device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dateTime,
     globActPow, 
     type = "o", 
     pch = ".", 
     xlab = "",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)")
axis(1, at=idx, labels=c("Thu", "Fri", "Sat"))
dev.off()








