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

## Plot2
par(mfrow=c(1,1))
with(hpcFeb,plot(Global_active_power~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="") )

## Save the plot to plot1.png file
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()




