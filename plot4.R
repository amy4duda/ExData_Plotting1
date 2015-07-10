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
png("C:/Coursera/plot4.png", width = 480, height = 480)
par(mar = c(4,4,2,2), mfcol = c(2,2), cex = .8)

##Create Graphs & PNG File

with(power, {
  plot(Global_active_power ~ datetime
       ,type = "l"
       ,ylab = "Global Active Power"
       ,xlab = " "
  ) 
})

with(power, {
  plot(Sub_metering_1 ~ datetime
       ,type = "l"
       ,col = "black"
       ,ylab = "Energy sub metering"
       ,xlab = " ")
  points(Sub_metering_2 ~ datetime
         ,type = "l"
         ,col = "red")
  points(Sub_metering_3 ~ datetime
         ,type = "l"
         ,col = "blue")
  legend( "topright", 
          legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
          lty = 1, 
          col = c("black","red","blue"), 
          cex = 1,
          bty = "n"
  )
})

with(power, {
  plot(Voltage ~ datetime
       ,type = "l"
       ,ylab = "Voltage"
       ,xlab = "datetime"
  ) 
})

with(power, {
  plot(Global_reactive_power ~ datetime
       ,type = "l"
       ,ylab = "Global_reactive_power"
       ,xlab = "datetime"
  ) 
})


dev.off()
