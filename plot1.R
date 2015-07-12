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

## Plot the Histogram of Global_active_power
hist(hpcFeb$Global_active_power,main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylab="Frequency",col="red",xlim=c(0,6))

## Save the plot to plot1.png file
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

