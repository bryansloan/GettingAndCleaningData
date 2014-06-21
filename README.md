Class Project for Getting and Cleaning Data
===========================================

This project is based on data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0.  The observations are from a group of volunteers, each performing  six activities (walking, waling upstairs, walking downstairs, sitting, standing, and laying).  The participants were wearing a smartphone (Samsung Galaxy S II) on the waist using its embedded accelerometer and gyroscope.

For this project, the instructor provided a specific URL for students to download the data.

[Course URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This repository contains the downloaded data and all the files needed to reproduce my project.  If you wish to download the data from the course URL separately, unzip the file so the "UCI HAR Dataset"" folder is in the same directory as the run-analysis.R script.

The output of this project is a tidy data set of the mean of each of the recorded data features, by partipant and by activity.


To replicate the data cleanup process
-------------------------------------

Clone the repository to your local machine

Set your R working directory to your cloned repository

Run the R script run_analysis.R to create the tidy data set (dataTidy.txt).


Checking the output file
--------------------

The tidy data set output file can be loaded in R and examined by using commands

```{r}
dataCheck <- read.table("dataTidy.txt", sep = ",")
View(dataCheck)
```


Prerequisites
-------------

The run_analysis.R script requires packages "plyr", and "reshape2".


Coding
------

The single R script is used to

* Merge the training and the test sets to create one data set.
* Use descriptive activity names to name the activities in the data set.
* Appropriately label the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable
for each activity and each subject.

This is accomplished by the following operations.

* Load "features.txt" to get the variables used on the feature vector.
* Give the features more meaningful names.
* Load and join "X" data which contains observations where 70% of the volunteers
generated the training data and 30% generated the test data.
* Load "Activity Labels" which link activity numbers with activity names.
* Load and join "Y" data which contains activity numbers for training and test groups
* Load and join "Subject" data for both training and test groups
* Join obervations with subjects and activity names
* Extract measurements of mean and standard deviation for each measurement. 
* Melt the joined data frame into a form suitable for casting.
* Cast the molten data frame into a tidy data frame that meets the principles
of tidy data taught in this class.
* Write a tidy data text file to disk.


END OF README.md FILE


