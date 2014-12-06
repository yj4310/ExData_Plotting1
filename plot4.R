##Read data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##ubset the rows needed for data analysis
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data2 <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##Add a new column "Time" and convert it to standard time format
data2[,1] <- as.character(data2[,1])
data2[,2] <- as.character(data2[,2])
time <- paste(data2[,1],data2[,2])
time <- strptime(time,format="%Y-%m-%d %H:%M:%S")
df <- cbind(time,data2)

##convert all the columns used to numeric class
df[,4] <- as.numeric(as.character(df[,4]))
df[,5] <- as.numeric(as.character(df[,5]))
df[,6] <- as.numeric(as.character(df[,6]))
df[,8] <- as.numeric(as.character(df[,8]))
df[,9] <- as.numeric(as.character(df[,9]))
df[,10] <- as.numeric(as.character(df[,10]))

##set x and all y values for plotting
x <- df[,1]
y1 <- df[,4]
y2 <- df[,6]
y31 <- df[,8]
y32 <- df[,9]
y33 <- df[,10]
y4 <- df[,5]

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

##figure1:
plot(x,y1,type="l",xlab="",ylab="Global Active Power")

##figure2:
plot(x,y2,type="l",xlab="datetime",ylab="Voltage")

##figure3
plot(x,y31,type="l",xlab="",ylab="Energy sub metering")
lines(x,y32,col="red")
lines(x,y33,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1",
       "Sub_metering_2","Sub_metering_3"))

##figure4
plot(x,y4,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off