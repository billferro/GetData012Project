# GetData012Project
Project for Johns Hopkins' Getting and Cleaning Data Coursera course
## Source Data

The data used for this assignment is based on a research study involving smartphones and human activity[1].  Description of the study 
can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The raw dataset used by the project
can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

This project assumes that you have downloaded the raw data set and unzipped it into a subfolder named "UCI HAR Dataset" in your current working directory.

## Project Files

* `run_analysis.R` - Script that performs the project steps required to combine the initial raw data sets and produce the resulting tidy data set.
####Requirements
The script must meet the following requirements:
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement.
	3. Uses descriptive activity names to name the activities in the data set.
	4. Appropriately labels the data set with descriptive variable names.
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
####Tidy Data Set
The resulting output txt file meets the principals of a tidy data set because
<ol>
	<li>Each measured variable is in one column as noted by the xxMean and xxStd columns in the resulting file.</li>
	<li>Each obvservation is on a different row as noted by the 180 rows representing 30 subjects and 6 activities for each subject.</li>
	<li>There is one table for each kind of variable.  In this case, there is only one table and it represents the calculated averages of the subject/activity combinations.</li>
</ol>
* `features.txt` - List of all of the features in the original data set for which we have calculated the averages

* `CodeBook.md` - Description of the columns in the output data set, TidyDataSet.txt

* `README.md` - This file


## Output File

TidyDataSet.txt - See `CodeBook.md` for a description of the data.


## Acknowledgements
The raw data set is part of the following research study

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
