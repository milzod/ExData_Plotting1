#Assumption: You are working in the right directory where the data files are

# Step 1: Read the csv data
powerconsumption <- read.csv("data/household_power_consumption.txt", sep = ";", na.string="?")

# Step 2: Subset the data to use only 2007-02-01 and 2007-02-02 date's data
pc <- powerconsumption[as.Date(powerconsumption$Date) == "01/02/2007" | as.Date(powerconsumption$Date) == "02/02/2007",]

# Step 3: Set the filename and file properties as required
png(filename="plot1.png", width=480, height=480, bg = "transparent")

# Step 4: Create Histogram
hs <- hist(pc$Global_active_power, plot = FALSE)

#Step 5: Plot the Histogram
plot(hs, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Step 6: Close the file
dev.off()