# run_analysis.R
# Author: Bill Ferro
# Overview:
#  The goal of this project is to 
#    1. Merge two data sets from the UCI HAR Data Set at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#    2. Extract only the mean and standard deviation measurements from both data sets
#    3. Use descriptive activity names to name the activities in the data set
#    4. From the combined data set, create a new tidy data set with the
#       average of each variable for each activity and each subject combination
# Assumptions:
#  1. The source data set has been downloaded and unzipped into a folder
#     named "UCI HAR Dataset" in the current working directory
# Full description of the project and output data set are in the README.md and 
# CodeBook.md files

#
# Load in data definitions for use later in the script
#
#     Read in the activities list to convert the activity numbers to names
#     Read in the features list for the input data set column labels
#     Read in the features list for the output data set column labels
#
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
tds_features <- read.table("./features.txt")

#
# Load the first data set: TEST
#   1. Read in the user ID of the subject for each entry in the data set
#   2. Read in the Activity that the user was performing for each entry in the data set
#   3. Read in the test data set setting the column names to features list loaded above
#
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", col.names=features[,2])

# Load the second data set: TRAIN
#   1. Read in the user ID of the subject for each entry in the data set
#   2. Read in the Activity that the user was performing for each entry in the data set
#   3. Read in the test data set setting the column names to features list loaded above
#
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"))
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", col.names=features[,2])

#
# Merge the two data sets together by creating new data frames with the combined parts
#   (Part 1 of the assignment)
#
subject <- rbind(subject_test, subject_train)
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)

#
# Extract only the measurements on the mean and standard deviation for each measurement. 
# Filter out the columns based on the appearance of "mean" or "std" in the current labels
# ignoring the angle... definitions
# Combine the Subject, Activity and required columns into a new data set (ds)
#    (Part 2 of the assignment)
#
cols <- grep("[tf].*mean\\(|[tf].*std\\(", features$V2, ignore.case=TRUE)
ds <- cbind(subject, y, x[,cols])

#
# Use descriptive activity names to name the activities in the data set
# by first getting the factors as labels from the activity list loaded above
# and then replacing the Activity column in the data set with the new labels
#    (Part 3 of the assignment)
#
f <- factor(ds$Activity, levels=activities[,1], labels=activities[,2])
ds$Activity <- f

#
# For each Subject/Activity combination in the data set, calculate
# the average.  Create a new, tidy data set with the average for each
# activity and subject combination and label each column appropriately
#
# Note: numcolwise takes advantage of the fact that the data set contains
# numeric data types for every column that we care about and the other columns
# are int or factor data types
#    (Part 4 of the assignment)
#
library(plyr)
tidyDS <- ddply(ds, .(Subject, Activity), numcolwise(mean))
names(tidyDS) <- tds_features[,1]

#
# Output the tidy data set for review.  You can read this back in using
#  read.table("TidyDataSet.txt", header=TRUE)
#
write.table(tidyDS, file="TidyDataSet.txt", row.name=FALSE)
