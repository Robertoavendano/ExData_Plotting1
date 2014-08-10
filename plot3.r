 table<-read.csv("household_power_consumption.txt",sep=";",as.is = TRUE)
 table$Date<-as.Date(table$Date, "%d/%m/%Y")

 ElecTab<-table[(table[,1] == "2007-02-02" ) | (table[,1] == "2007-02-01" ), ]
 ElecTab[,3]<-as.numeric(ElecTab[,3])
  dev.copy(png,file="plot3.png")
 dev.off()
