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
##open new png file for plot 3
png(file="plot3.png")
##create plot for sub_metering_1, no X axis label, add label to Y axis, default colour is black
plot(powerdata$date_time,powerdata$Sub_metering_1,xlab = "",ylab="Energy sub metering",type = "l")
##add line for sub_metering_2, set colour to red
lines(powerdata$date_time,powerdata$Sub_metering_2,col="red")
##add line for sub_metering_3, set colour to blue
lines(powerdata$date_time,powerdata$Sub_metering_3,col="blue")
##add legend to top right corner of plot
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
##turn off graphics device
dev.off()