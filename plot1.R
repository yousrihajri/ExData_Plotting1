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

###PLOT1
png(filename = "plot1.png")

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()


############
#THE ENDING# 
############

##End
timeend <- Sys.time()
Time <- timeend - timebegin
print(Time)
