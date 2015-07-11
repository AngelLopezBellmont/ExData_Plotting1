
# PROJECT1  PLOT1
#HISTOGRAM Global_active_power in kilowatts
 myFile <- "../household_power_consumption.txt"
 
 #We can change from TRUE to FALSE so we do not read always the file for demos
 if(TRUE)
 #if(FALSE)           
 {           
 myData <- read.table(myFile, sep=";", header=TRUE, dec=".", stringsAsFactors=FALSE)
 #myData <- read.table(myFile, sep=";", header=TRUE, dec=".", stringsAsFactors=TRUE)
 
 sub_myData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]
 }

 #str(subSetData)
 png("plot1.png", width=480, height=480)

 GAP <- as.numeric(sub_myData$Global_active_power)
 hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

 # STOP PLOT
 # we need dev.off() or graphics.off() if no tne png is still attached to RStudio and we can to delete or removed the .png
 # dev.off()
 graphics.off()