 table<-read.csv("household_power_consumption.txt",sep=";",as.is = TRUE)
 table$Date<-as.Date(table$Date, "%d/%m/%Y")

 ElecTab<-table[(table[,1] == "2007-02-02" ) | (table[,1] == "2007-02-01" ), ]
 ElecTab[,3]<-as.numeric(ElecTab[,3])
 
 hist(ElecTab[,3],col="red",xlab="Global Active Power ( kilowatts ) ",main="Global Active Power")
 dev.copy(png,file="plot1.png") 
 dev.off()