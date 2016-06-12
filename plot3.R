#########################################################################################################
## Program Name:    plot3.R
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
#                               THE END -- THANKS FOR READING
##------------------------------------------------------------------------------------------------------