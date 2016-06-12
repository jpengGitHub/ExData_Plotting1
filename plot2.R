#########################################################################################################
## Program Name:    plot2.R
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
#                               THE END -- THANKS FOR READING
##------------------------------------------------------------------------------------------------------