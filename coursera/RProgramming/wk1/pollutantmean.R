#Rafael Veloso
#Programming Assignment 1: Air Pollution - Part 1
#https://class.coursera.org/rprog-003/assignment/view?assignment_id=3


# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 
# pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory' 
# argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA. A prototype of the function is as 
# follows

#current workspace is different from the one where the datafiles are
setwd("~/Data Science/Coursera/R Programming/Programming Assignments/wk2/")

pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        # get all filenames within the called id's
        filenames <- list.files(path=directory, pattern="*.csv")
        filenames <- filenames[id]
        
        # initialize a vector for results
        res <- c()

        for(i in 1:length(filenames)){
                val <- read.csv(paste(directory, "/",filenames[i], sep = ""))
                res <- c(res, val[[pollutant]])
        }
        
        # return res, removing all NA values
        return(mean(res, na.rm = TRUE))

        
}
