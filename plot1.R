library(data.table)
# 1- read first line to be the column names
header<-read.table("hpc.txt",sep = ";",nrows = 3,header = TRUE)
headnames<-names(header)
# 2 -Read starting 1/2/2007 please acknowledge date in European format dd/mm/yyyy, and only read 2 days
# which in minutes 60*24*2=2880
datos<-fread("hpc.txt",sep = ";",skip = "1/2/2007",na.strings = "?",nrows = 2880,col.names = headnames)
library(lubridate)
dat1<-as.data.frame(datos)
hist(dat1$Global_active_power,main = " Global Active Power",col = "red",xlab = "Global Active Power (kilowats)")
dev.copy(png,file="plot1.png")
dev.off()

