#Rafael Veloso
#Programming Assignment 1: Air Pollution - Part 3
#https://class.coursera.org/rprog-003/assignment/view?assignment_id=3

# Write a function that takes a directory of data files and a threshold for 
# complete cases and calculates the correlation between sulfate and nitrate for 
# monitor locations where the number of completely observed cases 
# (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors that meet 
# the threshold requirement.
setwd("~/Data Science/Coursera/R Programming/Programming Assignments/wk2/")

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations

        correlations <- numeric(0)
        
        filenames <- list.files(path=directory, pattern="*.csv")
        
        for(i in 1:length(filenames)) {
                data <- na.omit(read.csv(paste(directory, "/",filenames[i], sep = "")))
                
                if (nrow(data) >= threshold) {
                        cr <- cor(data["sulfate"], data["nitrate"])
                        
                        if (!is.na(cr)) {
                                correlations <- append(correlations, cr)
                        }
                }
        }
        
        correlations
}
