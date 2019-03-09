## Getting and Cleaning Data Assignment
##Part1: Merges the training and test sets to create one data set

library(dplyr)

#read in the test data
sub_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

#read in the training data
sub_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

# read in the data description and activity labels
var_names <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

##merging the training  set to make one
x_total <- rbind(x_train, x_test)
y_total <- rbind(y_train, y_test)
sub_total <- rbind(sub_train, sub_test)

## Part 2: Extracting mean and standard deviation
##extracting mean and stdev for each measurement
mean_stdev <- var_names[grep("mean\\(\\)|std\\(\\)",var_names[,2]),]
x_values <-x_total[,mean_stdev[,1]] #x_values is the mean and standard deviation


## Part 3: Adding descriptive activity names to name the activities in the data
colnames(y_total) <- "activity"
y_total$activitylabel <- factor(y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- y_total[,-1]

## Part 4: Labels the data set with descriptive variable names
colnames(x_total) <- var_names[mean_stdev[,1],2]

## Part 5: Creates a tidy data set with the mean of each variable for each activity and each subject
colnames(sub_total) <- "subject" # already did activity and variable
total <- cbind(x_values, activitylabel, sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/tidydata.txt", row.names= FALSE, col.names = TRUE)

