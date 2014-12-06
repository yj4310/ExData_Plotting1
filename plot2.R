##Read data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##subset the rows needed for data analysis
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data2 <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##Add a new column "Time" and convert it to standard format
data2[,1] <- as.character(data2[,1])
data2[,2] <- as.character(data2[,2])
time <- paste(data2[,1],data2[,2])
time <- strptime(time,format="%Y-%m-%d %H:%M:%S")
df <- cbind(time,data2)

## plot global active power against time
df[,4] <- as.numeric(as.character(df[,4]))
x <- df[,1]
y <- df[,4]
png(file="plot2.png",width=480,height=480)
plot(x,y,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off