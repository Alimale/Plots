setwd("c:/users/alimalek/Documents/Data Science/Exploratory Data Analysis/week 1/")
h<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#the original format of the file is txt in which the values are seperated by ";".
#So sep=";" cancells this seperation and makes a data frame
h[,1]<-as.Date(h[,1],format="%d/%m/%Y")
h[,2]<-paste(h$Date,h$Time)
h$Time<-strptime(as.character(h$Time),format="%Y-%m-%d %H:%M:%S")
df<-subset(h,Time>=as.POSIXlt("2007-02-01 00:00:00")&Time<=as.POSIXlt("2007-02-02 23:59:00"))
df[,3]<-as.numeric(df[,3])
df[,3]<-df[,3]/1000
png(filename="plot 2.png",width=480,height=480)
plot(df$Time,df$Global_active_power,type="n",ylab="Global Active Power (Kilowatts)",xlab="")
lines(df$Time,df$Global_active_power)
dev.off()
