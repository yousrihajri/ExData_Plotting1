timebegin <- Sys.time()
setwd(dir = dir)
library(data.table)

##################
#GETTING THE DATA#
##################

data <- fread("household_power_consumption.txt",
              skip = 66637,
              nrows = 2880)
data2 <- fread("household_power_consumption.txt", nrows = 0)
data <- `names<-`(data, names(data2))
data <- as.data.frame(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- paste (data$Date, data$Time)
data$Time <- as.POSIXlt(data$Time)


##################
#     PLOTS     #
##################

###PLOT3
png(filename = "plot3.png")

with (data,
      plot(x = data$Time, y = data$Sub_metering_1,
           type = "n",
           xlab="",
           ylab = "Energy sub metering"))
lines(x = data$Time, y = data$Sub_metering_1, col="black")
lines(x = data$Time, y = data$Sub_metering_2, col="red")
lines(x = data$Time, y = data$Sub_metering_3, col="blue")
legend ("topright", 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col = c("black", "red", "blue"),
        lty=1,
        y.intersp = 1)

dev.off()




############
#THE ENDING# 
############

##End
timeend <- Sys.time()
Time <- timeend - timebegin
print(Time)