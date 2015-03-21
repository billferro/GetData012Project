# GetData012Project CodeBook

##Overview
This CodeBook describes the TidyDataSet.txt output for the course project.  The raw data set used for this assignment is based on a research study involving smartphones and human activity[1].  Description of the study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The raw data set used by the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The TidyDataSet.txt output consists of the **subjects** involved in the study, the **activities** they performed and the **average** of the Mean() and Standard Deviation() readings for select variables of each data reading taken during the study.

For a complete list of all the data captured and a more detailed description of all of the variables, see the `feature_info.txt` file in the raw data set.

##Variables

* `Subject` - An ID uniquely representing a person involved in the study.  Values range from 1 to 30.
* `Activity` - A factor representing one of 6 activities that the subject was performing when the data was captured.  Valid values include: WALKING, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, LAYING
.

* `Time domain` - The raw data readings represent accelerometer (Acc) and gyroscope (Gyro) signals taken across 3 dimensions referenced by X, Y, Z.  The variables in this data set represent the average of these readings from the original raw data set for the specific subject/activity combination:
 * tBodyAccMeanX,tBodyAccMeanY, tBodyAccMeanZ
 * tBodyAccStdX, tBodyAccStdY, tBodyAccStdZ
 * tGravityAccMeanX, tGravityAccMeanY, tGravityAccMeanZ
 * tGravityAccStdX, tGravityAccStdY, tGravityAccStdZ
 * tBodyAccJerkMeanX, tBodyAccJerkMeanY, tBodyAccJerkMeanZ
 * tBodyAccJerkStdX, tBodyAccJerkStdY, tBodyAccJerkStdZ
 * tBodyGyroMeanX, tBodyGyroMeanY, tBodyGyroMeanZ
 * tBodyGyroStdX, tBodyGyroStdY, tBodyGyroStdZ
 * tBodyGyroJerkMeanX, tBodyGyroJerkMeanY, tBodyGyroJerkMeanZ
 * tBodyGyroJerkStdX, tBodyGyroJerkStdY, tBodyGyroJerkStdZ
* `Magnitude` - In the raw data set, the magnitude of the signals was calculated using the Euclidean norm across the 3 dimensions.  The variables in this data set represent the averages of these readings from the original raw data set for the specific subject/activity combination:
 * tBodyAccMagMean
 * tBodyAccMagStd
 * tGravityAccMagMean
 * tGravityAccMagStd
 * tBodyAccJerkMagMean
 * tBodyAccJerkMagStd
 * tBodyGyroMagMean
 * tBodyGyroMagStd
 * tBodyGyroJerkMagMean
 * tBodyGyroJerkMagStd

* `Fast Fourier Transform` - In the raw data set, a Fast Fourier Transform (FFT) was applied to some of the readings.  The variables in this data set represent the average of these FFTs from the original raw data set for the specific subject/activity combination:
 * fBodyAccMeanX, fBodyAccMeanY, fBodyAccMeanZ
 * fBodyAccStdX, fBodyAccStdY, fBodyAccStdZ
 * fBodyAccJerkMeanX, fBodyAccJerkMeanY, fBodyAccJerkMeanZ
 * fBodyAccJerkStdX, fBodyAccJerkStdY, fBodyAccJerkStdZ
 * fBodyGyroMeanX, fBodyGyroMeanY, fBodyGyroMeanZ
 * fBodyGyroStdX, fBodyGyroStdY, fBodyGyroStdZ
 * fBodyAccMagMean
 * fBodyAccMagStd
 * fBodyBodyAccJerkMagMean
 * fBodyBodyAccJerkMagStd
 * fBodyBodyGyroMagMean
 * fBodyBodyGyroMagStd
 * fBodyBodyGyroJerkMagMean
 * fBodyBodyGyroJerkMagStd

##Acknowledgements
The raw data set is part of the following research study

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012	