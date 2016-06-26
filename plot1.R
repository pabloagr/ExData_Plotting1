# Get and Subset Data
rawData <- read.table("household_power_consumption.txt", sep = ";", header = T)
rawData$Date <- as.Date(rawData$Date, "%d/%m/20%y")
rawData <- subset(rawData, Date >= "2007-02-01" & Date <= "2007-02-02")
#funcTime <- function(x) {strptime(x, "%T")}
#rawData$Time <- lapply(rawData$Time,funcTime)

# Get the Global Active Pwer
globActPow <- as.numeric(as.character(rawData$Global_active_power))

# Createthe Histogram in the PNG Device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(globActPow, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()