library(dplyr)
#download the unzip file
project_file<-"project_dataset.zip"
if(!file.exists(project_file))
{url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,project_file)
}
if(!file.exists("UCI HAR Dataset"))
{
  unzip(project_file)
}
#reading features and activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2]=as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2]=as.character(features[,2])
#extracting mean and standard deviation faetures
featureswanted<-grep(".*mean.*|.*std.*",features[,2])
featureswanted.names <- features[featureswanted,2]
#reading train and test datas and combining them in ot a single data set
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featureswanted]
trainactivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainsubjects, trainactivities, train)
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featureswanted]
testactivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testsubjects, testactivities, test)
alldata <- rbind(train, test)
#making the features varibale names neat and clean
featureswanted.names <- gsub('[-()]', '', featureswanted.names)
colnames(alldata) <- c("subject", "activity", featureswanted.names)
colnames(alldata)<-gsub("mean", "Mean",colnames(alldata))
colnames(alldata)<-gsub("std", "Std",colnames(alldata))
#creating the final tidy data set with the average of each variable for each activity and each subject.
alldatamean<- alldata %>% group_by(activity, subject) %>% summarise_all(funs(mean))
