
#PROJECT1  PLOT2
#plot: Column values (date + time)  vs Column values(Global Active Power )
# set the working directory:
# setwd("c:\\2015.01.12_CarpetaAngel\\00Angel\\SoftwareProgramsCursosIT\\Coursera\\2015.07.01-Mod4_ExploratoryDataAnalysis\\Week1_project\\ExData_Plotting1")

#2015.07.11 Alopez HERE READ THE FILE .txt
  txtFile <- "../household_power_consumption.txt"
  mydata <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  submydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#HERE WE CAN GET INFO OF THE SUBSET CREATED WITH FUNCTION str()
#str(submydata)

# Here we plot: (Column (date + time)  vs Column Global Active Power )
# the date comes in format 16/12/2006  so  dd/mm/yyyy
# to paste colum date and time we paste them, and we let in format "%d/%m/%Y %H:%M:%S"

dateValue_timeValue <- strptime(paste(submydata$Date, submydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#dateValue_timeValue <- strptime(paste(submydata$Date, submydata$Time, sep=" "), "%Y/%m/%d %H:%M:%S") # doesnt work
 
# GAP == Global Active Power Column
  GAP <- as.numeric(submydata$Global_active_power)

# here we can create the plot2.png
  png("plot2.png", width=480, height=480)

# we draw the figure 
  plot(dateValue_timeValue, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# STOP PLOT
# we need dev.off() or graphics.off() if no tne png is still attached to RStudio and we can to delete or removed the .png
# dev.off()
  graphics.off()