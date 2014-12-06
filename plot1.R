##Read data and extract the part used for analysis in this project
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data1 <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##convert global active power data to numeric class and plot the histogram
data1[,3] <- as.numeric(as.character(data1[,3]))
x <- data1[,3]
png(file="plot1.png",width=480,height=480)
hist(x, main="Global Active Power",col="red",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off