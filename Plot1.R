##Check if folder to house data("PowerData") exists in current working directory and create if it does not exist
#if(!file.exists("./PowerData")){dir.create("./PowerData")}
##Download wearables data set from web and unzip in folder "PowerData" in current working directory
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl, destfile = "./PowerData/Dataset.zip")
#unzip("./PowerData/Dataset.zip", exdir = "./PowerData")
powerdata <- read.table("./PowerData/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?") 
##Convert Date column to class Date
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
##Subset powerdata for the dates Feb 1 2007 to Feb 2 2007, name subset powerdata.07
powerdata.07 <- subset(powerdata, Date < "2007-02-03" & Date > "2007-01-31")
##Open png device
png(filename = "plot1.png")
##Create histogram of global_active_power frequency
hist(powerdata.07$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
##Close png device
dev.off()