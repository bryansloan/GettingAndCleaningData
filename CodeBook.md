Class Project for Getting and Cleaning Data
===========================================

Create A Tidy Data Set
=======================================

The single R script (run_analysis.R) is used to

* Merge the training and the test sets to create one data set.
* Use descriptive activity names to name the activities in the data set.
* Appropriately label the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable
for each activity and each subject.


Output File
-----------

The tidy data set created by the R script is named "dataTidy.txt", which is a
comma separated file.


Variable List
-------------

The original variable names were altered to expand the name to make it easier to
understand.  Parenthesis were removed.  Capitalization was arranged (upper and
lower case letters) to match the variable names in the tidy data to the rest
of the project.

```{r}
subject
activityName
timeBodyAccelerationMean-X
timeBodyAccelerationMean-Y
timeBodyAccelerationMean-Z
timeBodyAccelerationStdDeviation-X
timeBodyAccelerationStdDeviation-Y
timeBodyAccelerationStdDeviation-Z
timeGravityAccelerationMean-X
timeGravityAccelerationMean-Y
timeGravityAccelerationMean-Z
timeGravityAccelerationStdDeviation-X
timeGravityAccelerationStdDeviation-Y
timeGravityAccelerationStdDeviation-Z
timeBodyAccelerationJerkSignalsMean-X
timeBodyAccelerationJerkSignalsMean-Y
timeBodyAccelerationJerkSignalsMean-Z
timeBodyAccelerationJerkSignalsStdDeviation-X
timeBodyAccelerationJerkSignalsStdDeviation-Y
timeBodyAccelerationJerkSignalsStdDeviation-Z
timeBodyGyroscopeMean-X
timeBodyGyroscopeMean-Y
timeBodyGyroscopeMean-Z
timeBodyGyroscopeStdDeviation-X
timeBodyGyroscopeStdDeviation-Y
timeBodyGyroscopeStdDeviation-Z
timeBodyGyroscopeJerkSignalsMean-X
timeBodyGyroscopeJerkSignalsMean-Y
timeBodyGyroscopeJerkSignalsMean-Z
timeBodyGyroscopeJerkSignalsStdDeviation-X
timeBodyGyroscopeJerkSignalsStdDeviation-Y
timeBodyGyroscopeJerkSignalsStdDeviation-Z
timeBodyAccelerationMagnitudeMean
timeBodyAccelerationMagnitudeStdDeviation
timeGravityAccelerationMagnitudeMean
timeGravityAccelerationMagnitudeStdDeviation
timeBodyAccelerationJerkSignalsMagnitudeMean
timeBodyAccelerationJerkSignalsMagnitudeStdDeviation
timeBodyGyroscopeMagnitudeMean
timeBodyGyroscopeMagnitudeStdDeviation
timeBodyGyroscopeJerkSignalsMagnitudeMean
timeBodyGyroscopeJerkSignalsMagnitudeStdDeviation
frequencyBodyAccelerationMean-X
frequencyBodyAccelerationMean-Y
frequencyBodyAccelerationMean-Z
frequencyBodyAccelerationStdDeviation-X
frequencyBodyAccelerationStdDeviation-Y
frequencyBodyAccelerationStdDeviation-Z
frequencyBodyAccelerationMeanFreq-X
frequencyBodyAccelerationMeanFreq-Y
frequencyBodyAccelerationMeanFreq-Z
frequencyBodyAccelerationJerkSignalsMean-X
frequencyBodyAccelerationJerkSignalsMean-Y
frequencyBodyAccelerationJerkSignalsMean-Z
frequencyBodyAccelerationJerkSignalsStdDeviation-X
frequencyBodyAccelerationJerkSignalsStdDeviation-Y
frequencyBodyAccelerationJerkSignalsStdDeviation-Z
frequencyBodyAccelerationJerkSignalsMeanFreq-X
frequencyBodyAccelerationJerkSignalsMeanFreq-Y
frequencyBodyAccelerationJerkSignalsMeanFreq-Z
frequencyBodyGyroscopeMean-X
frequencyBodyGyroscopeMean-Y
frequencyBodyGyroscopeMean-Z
frequencyBodyGyroscopeStdDeviation-X
frequencyBodyGyroscopeStdDeviation-Y
frequencyBodyGyroscopeStdDeviation-Z
frequencyBodyGyroscopeMeanFreq-X
frequencyBodyGyroscopeMeanFreq-Y
frequencyBodyGyroscopeMeanFreq-Z
frequencyBodyAccelerationMagnitudeMean
frequencyBodyAccelerationMagnitudeStdDeviation
frequencyBodyAccelerationMagnitudeMeanFreq
frequencyBodyBodyAccelerationJerkSignalsMagnitudeMean
frequencyBodyBodyAccelerationJerkSignalsMagnitudeStdDeviation
frequencyBodyBodyAccelerationJerkSignalsMagnitudeMeanFreq
frequencyBodyBodyGyroscopeMagnitudeMean
frequencyBodyBodyGyroscopeMagnitudeStdDeviation
frequencyBodyBodyGyroscopeMagnitudeMeanFreq
frequencyBodyBodyGyroscopeJerkSignalsMagnitudeMean
frequencyBodyBodyGyroscopeJerkSignalsMagnitudeStdDeviation
frequencyBodyBodyGyroscopeJerkSignalsMagnitudeMeanFreq
```


Data Consolidation
------------------

The two "X" data sets were merged.  The X data represents observations where 70% of the volunteers generated the training data and 30% generated the test data.

The "Activity Labels" were loaded into R and assigned names of "activity" and
"activityName".  The Activity Labels are used to link activity numbers with activity names.

```{r}
activity activityName
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
```

The two "Y" data sets were merged.  The Y data contains activity numbers for
the training and test groups.

The two "Subject" data sets (training and test) were merged and assigned the name "subject".

The obervations (X) were joined with subjects (Subject), which were then merged
with the activity names (Y) to create an "all data" table.  This table was
then reduced to include only the Mean and Standard Deviation observations.

The Tidy Data was created by calculating the Mean on all remaining measurements.


Example - Portion of one measurement from the tidy data set
-----------------------------------------------------------

```{r}
subject        activityName        timeBodyAccelerationMean-X
1        WALKING	0.2656969
2        STANDING	0.2731131
3        WALKING	0.2734287
4        STANDING	0.2741831
5        WALKING	0.2791780
```


Original Study and Data Files
=============================

Human Activity Recognition Using Smartphones Dataset, Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The dataset includes the following files located in the "UCI HAR Dataset folder"

* 'README.txt'
* 'features_info.txt': Shows information about the variables used
on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```{r}
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

The set of variables that were estimated from these signals are: 

```{r}
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
```

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

```{r}
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```

The complete list of variables of each feature vector is available in 'features.txt'



END OF CodeBook.md FILE

