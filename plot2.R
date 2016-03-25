library(data.table)
# 1- read first line to be the column names
header<-read.table("hpc.txt",sep = ";",nrows = 3,header = TRUE)
headnames<-names(header)
# 2 -Read starting 1/2/2007 please acknowledge date in European format dd/mm/yyyy, and only read 2 days
# which in minutes 60*24*2=2880
datos<-fread("hpc.txt",sep = ";",skip = "1/2/2007",na.strings = "?",nrows = 2880,col.names = headnames)
library(lubridate)
dat2<-as.data.frame(datos)
dat2$new<-paste(dat2$Date,dat2$Time)
dat2$new<-dmy_hms(dat2$new)
plot(dat2$new, dat2$Global_active_power, type="n",xlab="",ylab = "Global Active Power (kilowats)")
lines(dat2$new, dat2$Global_active_power, type="l")
dev.copy(png,file="plot2.png")
dev.off()