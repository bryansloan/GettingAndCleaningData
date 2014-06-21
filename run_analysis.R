## Begin run_analysis.R

## Class Project for GettingAndCleaningData

## Merge the training and the test sets to create one data set.
## Use descriptive activity names to name the activities in the data set.
## Appropriately label the data set with descriptive variable names.
## Creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.


## Load 'features.txt' to get the variables used on the feature vector.

featureNames = read.table("UCI HAR Dataset/features.txt", sep="")
featureNames = featureNames[,2]


## Give the features more meaningful names.

## Remove Parenthisis
featureNames <- gsub("\\(\\)", featureNames, replacement="")

## Capitalize Mean
featureNames <- gsub("-mean", featureNames, replacement="Mean")

## Expand Standard Deviation
featureNames <- gsub("-std", featureNames, replacement="StdDeviation")

## Substitute first character
featureNames <- gsub("^t", featureNames, replacement="time")
featureNames <- gsub("^f", featureNames, replacement="frequency")

## Expand Measurement Names
featureNames <- gsub("tBody", featureNames, replacement="timeBody")
featureNames <- gsub("Mag", featureNames, replacement="Magnitude")
featureNames <- gsub("Gyro", featureNames, replacement="Gyroscope")
featureNames <- gsub("Acc", featureNames, replacement="Acceleration")
featureNames <- gsub("Jerk", featureNames, replacement="JerkSignals")


## Load 'X' data which contains observations where 70% of the volunteers
## generated the training data and 30% generated the test data.

dataTrainX <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

dataTestX <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

dataX = rbind(dataTrainX,dataTestX)    ## Merge Test and Train data sets

names(dataX) <- featureNames           ## Label the data with descriptive names

rm(dataTrainX)                         ## Clean temporary variables from memory
rm(dataTestX)                          ## Clean temporary variables from memory


## Load "Activity Labels" which link activity numbers with activity names.

activityLabels = read.table("UCI HAR Dataset/activity_labels.txt",
                            header=FALSE,
                            col.names=c("activity", "activityName"))


## Load "Y" data which contains activity numbers for training and test groups

dataTrainY <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

dataTestY <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

dataY = rbind(dataTrainY,dataTestY)    ## Merge Test and Train data sets

names(dataY) <- "activity"             ## Label the data with descriptive name

dataY <- merge(dataY, activityLabels, by="activity",
               all.x=TRUE)             ## Add names to activity numbers

rm(dataTrainY)                         ## Clean temporary variables from memory
rm(dataTestY)                          ## Clean temporary variables from memory


## Load "Subject" data for both training and test groups

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = " ")

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = " ")

dataSubject = rbind(subjectTrain,subjectTest) ## Merge Test and Train data sets

names(dataSubject) <- "subject"        ## Label the data with descriptive name

rm(subjectTrain)                       ## Clean temporary variables from memory
rm(subjectTest)                        ## Clean temporary variables from memory


## Join obervations with subjects and activity names

library("plyr")
dataAll <- arrange(join(dataY,activityLabels),activity)
dataAll <- cbind(dataSubject,dataAll, dataX)


## Extract measurements of mean and standard deviation for each measurement. 

dataExtract <- grep(".*subject*|.*activityName*|.*Mean*|.*StdDeviation*",
                 colnames(dataAll))

dataAll <- dataAll[, dataExtract]

rm(dataExtract)                        ## Clean temporary variables from memory


## Creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.


## Melt the joined data frame into form suitable for casting.

library(reshape2)

dataAllMelt <- melt(dataAll, c("subject", "activityName"))


## Cast the molten data frame into an tidy data frame.

dataTidy <- dcast(dataAllMelt, subject + activityName ~ variable, mean)

rm(dataAllMelt)                        ## Clean temporary variables from memory


## Write the tidy data to disk

write.table(dataTidy, file = "dataTidy.txt", sep = ",")


## End of run_analysis.R
