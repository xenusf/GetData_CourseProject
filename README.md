
## Getting and Cleaning Data: Course Project

The runAnalysis.R script imports a set of Human Activity Recognition data from multiple file sources,
then joins and manipulates them to ultimately output a tidy summary.

The script loads the "dplyr" package for quick and simple data manipulation.

Text files are read to data frames via read.table function, then the objects representing the test 
and training groups' measurements, subject IDs, activity types, and observation types are merged
to a single large data frame.

From the large resulting data frame object labeled "Msds", the observations are grouped by 
subject and activity, with a new table returning the means for all combinations thereof, 
written to the file "tidyset.txt".