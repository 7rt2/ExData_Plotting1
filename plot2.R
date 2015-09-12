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
##open new png file for plot 2
png(file="plot2.png")
##create plot, no label on X axis, add label to Y axis, default colour is black
plot(powerdata$date_time,powerdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
##turn off graphics device
dev.off()