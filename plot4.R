#########################################################################################################
## Program Name:    plot4.R
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
# load data
load('./data/hpc_sub.RData');
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