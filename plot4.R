library(dplyr)
library(lubridate)
##read in only the lines of the text files containing the required dates for this project
powerdata<-read.table("household_power_consumption.txt",sep=";",nrows=2880,skip=66637,na.strings = "?")
##read in the first row containing the column headers
n<-read.table("household_power_consumption.txt",sep=";",nrows=1)
##rename the columns using the column headers
colnames(powerdata)<-as.vector(unname(unlist(n[1,])))
##add new column combining Date and Time variables, and changing format to "POSIXct" "POSIXt"
powerdata<-mutate(powerdata,date_time = dmy_hms(paste(Date,Time)))
##open new png file for plot 4
png(file="plot4.png")
##set plot area to have 2 columns and 2 rows
par(mfrow=c(2,2))
##create first plot
plot(powerdata$date_time,powerdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
##create second plot
plot(powerdata$date_time,powerdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
##create third plot
plot(powerdata$date_time,powerdata$Sub_metering_1,xlab = "",ylab="Energy sub metering",type = "l")
  ##add second and third lines to third plot, as well as the legend
  lines(powerdata$date_time,powerdata$Sub_metering_2,col="red")
  lines(powerdata$date_time,powerdata$Sub_metering_3,col="blue")
  legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
##create fourth plot
plot(powerdata$date_time,powerdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
##turn off graphics device
dev.off()