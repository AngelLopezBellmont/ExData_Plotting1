# PROJECT1  PLOT3
# plot: Column values (date + time)  vs Sub_metering_1, 2, 3
# set the working directory:
# setwd("c:\\2015.01.12_CarpetaAngel\\00Angel\\SoftwareProgramsCursosIT\\Coursera\\2015.07.01-Mod4_ExploratoryDataAnalysis\\Week1_project\\ExData_Plotting1")

#2015.07.11 Alopez HERE READ THE FILE .txt
txtFile <- "../household_power_consumption.txt"
data <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#HERE WE CAN GET INFO OF THE SUBSET CREATED WITH FUNCTION str()
#str(submydata)

#PLOT [Date+Time]  vs. [Sub_metering]

#X-axis for plot:  Date + timev(like in plot2)
x_DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#y- axis: Sub_metering_1, 2, 3
y_sm1 <- as.numeric(subdata$Sub_metering_1)
y_sm2 <- as.numeric(subdata$Sub_metering_2)
y_sm3 <- as.numeric(subdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(x_DateTime, y_sm1, type="l", ylab="Energy Submetering", xlab="", col="black")
lines(x_DateTime, y_sm2, type="l", col="red")
lines(x_DateTime, y_sm3, type="l", col="blue")

#HERE WE WRITE THE LEGEND
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# STOP PLOT
# we need dev.off() or graphics.off() if no tne png is still attached to RStudio and we can to delete or removed the .png
# dev.off()
graphics.off()