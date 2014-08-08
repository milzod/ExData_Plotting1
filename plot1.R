#Assumption: You are working in the right directory where the data files are

# Step 1: Read the csv data
powerconsumption <- read.table("data/household_power_consumption.txt", header= TRUE, sep = ";", na.string="?", stringsAsFactors = FALSE)
powerconsumption$Date <- as.Date(powerconsumption$Date, "%d/%m/%Y")

# Step 2: Subset the data to use only 2007-02-01 and 2007-02-02 date's data
powerconsumption <- subset(powerconsumption, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Step 3: Set the filename and file properties as required
png(filename="plot1.png", width=480, height=480)

# Step 4: Create Histogram
hist(powerconsumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Step 5: Close the file
dev.off()
