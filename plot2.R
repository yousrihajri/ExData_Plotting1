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

###PLOT2
png(filename = "plot2.png")

with (data, 
      plot(x = data$Time, y = data$Global_active_power,
           type = "n",
           xlab="",
           ylab = "Global Active Power (kilowatts)"))
lines(x = data$Time, y = data$Global_active_power)

dev.off()



############
#THE ENDING# 
############

##End
timeend <- Sys.time()
Time <- timeend - timebegin
print(Time)