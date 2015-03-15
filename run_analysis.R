# run_analysis.R
# Author: Bill Ferro

#1. Merge the training and the test sets to create one data set.

# Read in the activities list
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Read in the features list
features <- read.table("./UCI HAR Dataset/features.txt")

#
# Read in the Test data Set
# Read in the Training data set
# Merge(concatenate) the 3 contents together
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", col.names=features[,2])
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", col.names=features[,2])
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"))

subject <- rbind(subject_test, subject_train)
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)

#2. Extract only the measurements on the mean and standard deviation 
# for each measurement. 
# Filter out the columns based on the appearance of "mean" or "std" in the current labels
cols <- grep(".*mean|.*std", features$V2, ignore.case=TRUE)
# combine the 3 data sets as we extract
ds <- cbind(subject, y, x[,cols])

#3. Use descriptive activity names to name the activities in the data set
# Get the factors as labels
f <- factor(ds$Activity, levels=activities[,1], labels=activities[,2])
# Replace the Activity column with labels
ds$Activity <- f

#4. Appropriately labels the data set with descriptive variable names.
# did this at the Read Table level
#TODO: Change the names to something more descriptive
#  by loading them up from a txt file

#5. From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.
library(plyr)
tidyDS <- ddply(ds, .(Subject, Activity), numcolwise(mean))

write.table(tidyDS, file="TidyDataSet.txt", row.name=FALSE)
