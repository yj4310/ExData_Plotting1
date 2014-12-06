##Read data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##subset the rows needed for data analysis
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data2 <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##Add a new column "Time" and convert it to standard time format
data2[,1] <- as.character(data2[,1])
data2[,2] <- as.character(data2[,2])
time <- paste(data2[,1],data2[,2])
time <- strptime(time,format="%Y-%m-%d %H:%M:%S")
df <- cbind(time,data2)

##plot sub metering values against time
df[,8] <- as.numeric(as.character(df[,8]))
df[,9] <- as.numeric(as.character(df[,9]))
df[,10] <- as.numeric(as.character(df[,10]))
x <- df[,1]
y1 <- df[,8]
y2 <- df[,9]
y3 <- df[,10]
png(file="plot3.png",width=480,height=480)
plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1",
       "Sub_metering_2","Sub_metering_3"))
dev.off