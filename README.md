# Getting-and-Cleaning-Data-Week-4-Project

# Data Description
The variables used in this project are sensor signals measured from waist mounted smartphones worn by 30 individuals between the ages of 19-48. Each person performed six activities (listed in CodeBook.md). The tidydata.txt is the mean of each variable for each activity and each subject.  

# Summary of Code
1. Read *test* and *train* data into R envrionment using **read.table**
1. Merged *test* and *train* data using **rbind**
1. Extracted mean and standard deviation using **grep**
1. Added labels to columns using **colnames**
1. Merged mean and standard deviation data with labels using **cbind**
1. Created tidy data with the mean of each variable for each activity and each subject using **group_by** and **summarize_each**

## Assignment Instructions
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
