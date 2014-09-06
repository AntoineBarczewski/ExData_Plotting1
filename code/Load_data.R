#Downloading the data
#setwd("C:\\Users\\Antoine\\Documents\\GitHub\\ExData_Plotting1")
#fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#if (!file.exists("data")) {
#  dir.create("data")
#}
#download.file(fileUrl, destfile=".\\data\\data.zip")
#unzip("data.zip")


#Loading the data
load_data <- function() {
  filename <- ".\\data\\household_power_consumption.txt"
  data <- read.table(filename,
                   header=TRUE,
                   sep=";",
                   colClasses=c("character", "character", rep("numeric",7)),
                   na="?")
#Casting the dates and times
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
#Subsetting the data
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  data <- subset(data, Date %in% dates)
  
  return(data)
  
}