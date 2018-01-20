setwd("c:/users/alimalek/Documents/Data Science/Exploratory Data Analysis/week 1/")
h<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#the original format of the file is txt in which the values are seperated by ";".
#So sep=";" cancells this seperation and makes a data frame
h[,1]<-as.Date(h[,1],format="%d/%m/%Y")
h[,2]<-paste(h$Date,h$Time)
h$Time<-strptime(as.character(h$Time),format="%Y-%m-%d %H:%M:%S")
df<-subset(h,Time>=as.POSIXlt("2007-02-01 00:00:00")&Time<=as.POSIXlt("2007-02-02 23:59:00"))
x<-c(3,4,5,7,8,9)
df[,x]<-lapply(df[,x],as.numeric)
png(filename="plot 3.png",width=480,height=480)
#plotting the Global active power plot as the first plot
df[,3]<-df[,3]/1000
png(filename="plot 4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(df$Time,df$Global_active_power,type="n",ylab="Global Active Power (Kilowatts)",xlab="")
lines(df$Time,df$Global_active_power)
#plots the energy sub metering plots 
plot(df$Time,df[,7],type="n",ylab="Energy sub metering",xlab=" ",yaxt="n")
axis(side=2,at=seq(0,40,by=10))
lines(df$Time,df[,7])
lines(df$Time,df[,8],col="red")
lines(df$Time,df[,9],col="blue")
legend("topright",legend=c("sub_metering_1","sub_meterin_2","sub_metering_3")
       ,col=c("black","blue","red"),lty="solid",cex=0.7,box.lty=0)
#plots Voltage versus datetime
plot(df$Time,df$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(df$Time,df$Voltage)
plot(df$Time,df$Global_reactive_power,type="n",ylab="Global reactive power",xlab="datetime")
lines(df$Time,df$Global_reactive_power)
dev.off()



