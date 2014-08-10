 table<-read.csv("household_power_consumption.txt",sep=";",as.is = TRUE)
 table$Date<-as.Date(table$Date, "%d/%m/%Y")

 ElecTab<-table[(table[,1] == "2007-02-02" ) | (table[,1] == "2007-02-01" ), ]
 ElecTab[,3]<-as.numeric(ElecTab[,3])
  par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
 with(ElecTab,{
	plot(Date   time, Global_active_power,ylab="Global Active Power", main =" ", xlab =" ")
        
	plot(Date, Voltage,ylab="Voltage", main =" ", xlab ="datetime ")
	plot(Date,Sub_metering_1, ylab="Energy sub metering", main ="  ", xlab =" ")
        plot(Date,Global_reactive_power, ylab="Global_reactive_power", main ="  ", xlab ="datetime")
        
 })
 
 dev.copy(png,file="plot4.png")
 dev.off()
 
