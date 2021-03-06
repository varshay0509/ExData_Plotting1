
library(datasets)
library(lattice)
library(ggplot2)
library(lubridate)

# Setting working directory
wd_url <- "E:/000DATA_Science_Coursera2018/04_Exploratory_Data_Analysis/Course_Project1"
setwd(wd_url)
#Loading the data
electricity_data<- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
# changing the format of "Date" column to "Date"
electricity_data$Date<- as.Date(electricity_data$Date, format= "%d/%m/%Y")
# Checking for "NA" values
electricity_data<- electricity_data[!is.na(electricity_data$Global_active_power)]

#filtering two days of data
two_day_data<- electricity_data[electricity_data$Date >="2007-02-01"& electricity_data$Date <="2007-02-02",]
# removing the initial data
remove(electricity_data)

# setting up the device with all the specifications
png(filename = 'plot1.png', width = 480, height = 480)
# plotting the histogram
hist(two_day_data$Global_active_power, col="red",xlab = "Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
