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
png(filename="plot2.png", width=480, height=480)

# Step 5: Plot the graph
with(powerconsumption, plot(DateTime, 
                            Global_active_power, 
                            type = "l", 
                            main = "", 
                            xlab = "", 
                            ylab = "Global Active Power (kilowatts)"))

#Step 6: Close the file
dev.off()
