#########################################################################################################
## Program Name:    reading_data_and_create_plot.R
## Purpose:         Exploratory Data Analysis Assignment 1
## Author:          Jason Peng 

## Output:          
## Date:            Update
##------------------------------------------------------------------------------------------------------
## 2016-06-12      Initial create                                                                                                                                                                                                                 

## Description
##------------------------------------------------------------------------------------------------------
# For this course assignment, one is expected to read electric power consumption data, 
# subset to data from 2007-07-01 and 2007-07-02 only
# and then create four plots

## Extra notes
##------------------------------------------------------------------------------------------------------
##  PLEASE READ!!!!!               PLEASE READ!!!!!           PLEASE READ!!!!!

##  I enjoy using                   "=" 
##  as opposed to                   "<-"
##  I also like to add              ";" at the end of the clause
##  due to old habits from other programming languages
##  "=" and "<-" are interchangeable in most cases, ";" is harmless and enhance readability
##  Please don't deduct just because of that!!!  Many thanks!!!

#########################################################################################################                                                                                                                    

##------------------------------------------------------------------------------------------------------
#       Setting up environment
##------------------------------------------------------------------------------------------------------
#### Attach libraries
rm(list=ls()); # get a clean slate
library(dplyr); # mask: filter, lag,  intersect, setdiff, setequal, union

##------------------------------------------------------------------------------------------------------
#       Read and clean data
##------------------------------------------------------------------------------------------------------
#### Download and unzip data
if (!file.exists('./data')) {dir.create('./data')}
fileURL = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip';
zipped_file = './data/household_power_consumption.zip';
download.file(fileURL, destfile = zipped_file);
unzip(zipped_file, exdir = "./data");  
unlink(zipped_file);

#### Read in the raw data household_power_consumption.txt
# Date: Date in format dd/mm/yyyy                  
# Time: time in format hh:mm:ss                  
# Global_active_power   
# Global_reactive_power
# Voltage               
# Global_intensity      
# Sub_metering_1        
# Sub_metering_2       
# Sub_metering_3 

## read a small sample
hpc_sample = read.table('./data/household_power_consumption.txt', header=TRUE, sep = ';', nrow=100);
head(hpc_sample);
str(hpc_sample);
sapply(hpc_sample, class);
classes = c(rep('character', 2), rep('numeric',7));

## read the full dataset -- less than half a minute on my computer to read in 2 million rows
household_power_consumption = read.table('./data/household_power_consumption.txt', 
                                         header=TRUE, sep = ';',
                                         na.strings = '?',
                                         colClasses = classes);

sapply(household_power_consumption, class);

## subset to  2007-02-01 and 2007-02-02 and convert to proper date formats
# note the raw Date is in dd/mm/yyyy format
hpc_sub =   filter(household_power_consumption, Date %in% c('1/2/2007', '2/2/2007'));
# Not using mutate function as it does not support 'POSIXlt' results
hpc_sub$Time = strptime(paste(hpc_sub$Date, hpc_sub$Time), '%d/%m/%Y %T');
hpc_sub$Date = as.Date(hpc_sub$Date, '%d/%m/%Y');

head(hpc_sub);
str(hpc_sub);


##------------------------------------------------------------------------------------------------------
#       plot 1
##------------------------------------------------------------------------------------------------------
png(file='./data/plot1.png'); # default width and height = 480
hist(hpc_sub$Global_active_power, 
     breaks=12,
     col = 'red',
     xlab ='Global Active Power(kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power');
dev.off();

##------------------------------------------------------------------------------------------------------
#       plot 2
##------------------------------------------------------------------------------------------------------
png(file='./data/plot2.png'); # default width and height = 480
# plot type: what type of plot should be drawn. Possible types are
# "p" for points,
# "l" for lines,
# "b" for both,
# "c" for the lines part alone of "b",
# "o" for both 'overplotted',
# "h" for 'histogram' like (or 'high-density') vertical lines,
# "s" for stair steps,
# "S" for other steps, see 'Details' below,
# "n" for no plotting.
with(hpc_sub, 
     plot (  x = Time,
             y = Global_active_power, 
             type = 'l',
             xlab ='',
             ylab = 'Global Active Power(kilowatts)'));
dev.off();

##------------------------------------------------------------------------------------------------------
#       plot 3
##------------------------------------------------------------------------------------------------------
png(file='./data/plot3.png'); # default width and height = 480
# draw a blank canvas and then add 3 graphs
with(hpc_sub, 
     plot (  x = Time,
             y = Sub_metering_1, 
             type = 'l',
             col = 'black',
             xlab ='',
             ylab = 'Energy sub metering'));
with(hpc_sub, 
     lines (  x = Time,
             y = Sub_metering_2, 
             col = 'red'));
with(hpc_sub, 
     lines (  x = Time,
              y = Sub_metering_3, 
              col = 'blue'));

legend('topright', 
       col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=1);

dev.off();

##------------------------------------------------------------------------------------------------------
#       plot 4
##------------------------------------------------------------------------------------------------------
png(file='./data/plot4.png'); # default width and height = 480
par.defaults = par(no.readonly=TRUE); # save plot parameter default to reverse back later

par(mfrow=c(2,2)); # arrange plot in 2X2, fill in row first

# Top left
with(hpc_sub, 
     plot (  x = Time,
             y = Global_active_power, 
             type = 'l',
             xlab ='',
             ylab = 'Global Active Power(kilowatts)'));

# Top right
with(hpc_sub, 
     plot (  x = Time,
             y = Voltage, 
             type = 'l',
             xlab ='datetime',
             ylab = 'Voltage'));

# Bottom left
with(hpc_sub, 
     plot (  x = Time,
             y = Sub_metering_1, 
             type = 'l',
             col = 'black',
             xlab ='',
             ylab = 'Energy sub metering'));
with(hpc_sub, 
     lines (  x = Time,
              y = Sub_metering_2, 
              col = 'red'));
with(hpc_sub, 
     lines (  x = Time,
              y = Sub_metering_3, 
              col = 'blue'));

# Bottom right
with(hpc_sub, 
     plot (  x = Time,
             y = Global_reactive_power, 
             type = 'l',
             xlab ='datetime',
             ylab = 'Global_reactive_power'));

par(par.defaults); # reverse plot parameter defaults
dev.off();

##------------------------------------------------------------------------------------------------------
#                               THE END -- THANKS FOR READING
##------------------------------------------------------------------------------------------------------