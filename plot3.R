## Loading the data into R
hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")
head(hpc)
colnames(hpc)

## Convert Date field to date format and get the subset data 
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
hpcFeb <- subset(hpc,hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02")
hpcFeb[1,]

## Create a DateTime field 
hpcFeb$DateTime <- as.POSIXct(paste(hpcFeb$Date, hpcFeb$Time))
hpcFeb$DateTime[1]
head(hpcFeb$DateTime)


## Plot 3 
with(hpcFeb, { 
plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
lines(Sub_metering_2~DateTime,col='Red') 
lines(Sub_metering_3~DateTime,col='Blue') 
}) 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


## Save the plot to plot1.png file
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()




