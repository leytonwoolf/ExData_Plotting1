##Check if folder to house data("PowerData") exists in current working directory and create if it does not exist
#if(!file.exists("./PowerData")){dir.create("./PowerData")}
##Download wearables data set from web and unzip in folder "PowerData" in current working directory
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl, destfile = "./PowerData/Dataset.zip")
#unzip("./PowerData/Dataset.zip", exdir = "./PowerData")
#powerdata <- read.table("./PowerData/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
##create a combined Date and Time column
#powerdata <- mutate(powerdata, DT = paste(Date,Time))
##Convert Date column to class Date and DT to Date/POSxlt data classes
#powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
#powerdata$Time <- strptime(powerdata$Time, "%H:%M:%S")
#powerdata$DT <- strptime(powerdata$DT, "%d/%m/%Y %H:%M:%S")
##Subset powerdata for the dates Feb 1 2007 to Feb 2 2007, name subset powerdata.07
#powerdata.07 <- subset(powerdata, Date < "2007-02-03" & Date > "2007-01-31")
##Open png device
#png(filename = "plot2.png")
##Create line plot of global activee power - 1st create plot with proper labels, then add data
#plot(powerdata.07$DT,powerdata.07$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
#lines(powerdata.07$DT, powerdata.07$Global_active_power)
##Close png device
#dev.off()