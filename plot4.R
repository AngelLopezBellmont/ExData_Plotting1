# PROJECT1  PLOT4

# 4 plots: 
# Plot1: Date+Time vs. Global_active_power
# Plot2: Date+Time vs. Voltage
# PLot3: Date+Time vs. Sub_metering_1, 2, 3
# PLot3: Date+Time vs. Global_reactive_power

# set the working directory:
# setwd("c:\\2015.01.12_CarpetaAngel\\00Angel\\SoftwareProgramsCursosIT\\Coursera\\2015.07.01-Mod4_ExploratoryDataAnalysis\\Week1_project\\ExData_Plotting1")

#2015.07.11 Alopez HERE READ THE FILE .txt
  txtFile <- "../household_power_consumption.txt"
  #data <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  #str(subdata)

#X-axis for plot:  Date + timev(like in plot2)
  x_DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Y-axis:
 y_GAP <- as.numeric(subdata$Global_active_power)
 y_v <- as.numeric(subdata$Voltage)

 y_sm1 <- as.numeric(subdata$Sub_metering_1)
 y_sm2 <- as.numeric(subdata$Sub_metering_2)
 y_sm3 <- as.numeric(subdata$Sub_metering_3)

 y_GRP <- as.numeric(subdata$Global_reactive_power)

# WE CREATE THE .png
 png("plot4.png", width=480, height=480)
 
#FORMAT TO SHOW MATRIX (2 x 2)
par(mfrow = c(2, 2)) 


# we start here with the plots:

  plot(x_DateTime, y_GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(x_DateTime, y_v, type="l", xlab="datetime", ylab="Voltage")
  
  plot(x_DateTime, y_sm1, type="l", ylab="Energy Submetering", xlab="")
  lines(x_DateTime, y_sm2, type="l", col="red")
  lines(x_DateTime, y_sm3, type="l", col="blue")
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=0.5, col=c("black", "red", "blue"), bty="o")
  
  plot(x_DateTime, y_GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  

  # STOP PLOT
  # we need dev.off() or graphics.off() if no tne png is still attached to RStudio and we can to delete or removed the .png
  # dev.off()
  graphics.off()