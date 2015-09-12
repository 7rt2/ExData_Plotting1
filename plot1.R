##read in only the lines of the text files containing the required dates for this project
powerdata<-read.table("household_power_consumption.txt",sep=";",nrows=2880,skip=66637,na.strings = "?")
##read in the first row containing the column headers
n<-read.table("household_power_consumption.txt",sep=";",nrows=1)
##rename the columns using the column headers
colnames(powerdata)<-as.vector(unname(unlist(n[1,])))
##open new png file for plot 1
png(file="plot1.png")
##plot histogram, set colour to red, add Title and label on X axis
hist(powerdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
##turn off graphics device
dev.off()