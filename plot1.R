#########################################################################################################
## Program Name:    plot1.R
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
#                               THE END -- THANKS FOR READING
##------------------------------------------------------------------------------------------------------