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


## Plot4 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(hpcFeb, { 
plot(Global_active_power~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="") 
plot(Voltage~DateTime, type="l",  ylab="Voltage (volt)", xlab="") 
plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
lines(Sub_metering_2~DateTime,col='Red') 
lines(Sub_metering_3~DateTime,col='Blue') 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
plot(Global_reactive_power~DateTime, type="l",ylab="Global Rective Power (kilowatts)",xlab="") 
}) 


## Save the plot to plot1.png file
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()




