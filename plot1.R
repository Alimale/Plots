setwd("c:/users/alimalek/Documents/Data Science/Exploratory Data Analysis/week 1/")
h<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#the original format of the file is txt in which the values are seperated by ";".
#So sep=";" cancells this seperation and makes a data frame
h[,1]<-as.Date(h[,1],format="%d/%m/%Y")
#h$Time<-strptime(as.character(h$Time),format="%H:%M:%S")
df<-subset(h,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
df[,3]<-as.numeric(df[,3])
df[,3]<-df[,3]/1000
png(filename="plot 1.png",width=480,height=480)
hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)",ylab="Frequency")
dev.off()