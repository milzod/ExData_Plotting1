#Assumption: You are working in the right directory where the data files are

# Step 1: Read the csv data
powerconsumption <- read.table("data/household_power_consumption.txt", 
                               header= TRUE, 
                               sep = ";", 
                               na.string="?", 
                               stringsAsFactors = FALSE)

# Step 2: Modify Date column as date and add datetime column
powerconsumption$DateTime <- strptime(paste(powerconsumption$Date, powerconsumption$Time), "%d/%m/%Y %H:%M:%S")
powerconsumption$Date <- as.Date(powerconsumption$Date, "%d/%m/%Y")


# Step 3: Subset the data to use only 2007-02-01 and 2007-02-02 date's data
powerconsumption <- subset(powerconsumption, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Step 4: Set the filename and file properties as required
png(filename="plot3.png", width=480, height=480)

# Step 5: Plot the graph
# Step 5.1: Add line for sub metering 1
with(powerconsumption, plot(DateTime, 
                            Sub_metering_1, 
                            type = "l", 
                            col = "black",
                            main = "", 
                            xlab = "", 
                            ylab = "Energy sub metering"))

# Step 5.2: Add line for sub metering 2
with(powerconsumption, lines(DateTime, 
                             Sub_metering_2,
                             col = "red"))

# Step 5.3: Add line for sub meteting 3
with(powerconsumption, lines(DateTime, 
                             Sub_metering_3,
                             col = "blue"))

#Step 6: Add legend to top right location
legend("topright",
       pch = "_",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Step 7: Close the file
dev.off()
