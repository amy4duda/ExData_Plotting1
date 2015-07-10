##Install sqldf Package
install.packages("sqldf")
library(sqldf)

##Read in File for Days Needed
power <- 
  read.csv.sql("C:/Coursera/household_power_consumption.txt", sep=";", sql = "select * from file where date in ('1/2/2007', '2/2/2007')")

##Create Datetime field
datetime <- strptime(paste (power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

##Final File with Datetime Field
power <- cbind(datetime, power)

##Set margins, number of graphs and font size
par(mar = c(4,4,2,2) mfcol = c(1,1), cex = .8)

##Create Graph
with(power, {
  plot(Global_active_power ~ datetime
       ,type = "l"
       ,ylab = "Global Active Power (kilowatts)"
       ,xlab = " "
  ) 
})

##Create PNG File
dev.copy(png, file = "C:/Coursera/plot2.png",width = 480, height = 480)
dev.off()