This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

* Download the dataset if it does not already exist in the working directory.
* Loads the activity labels and features.
* Extracts features related to mean and standard deviation measurements.
* Loads both the training and test datasets.
* Extracts columns in the training and test datasets, which reflect a mean or standard deviation.
* Loads the activity and subject data for training and test datasets, and merges those columns with the datasets.
* Merges the two datasets.
* modifies the variable names to Make the merged dataset a tidier one.
* Creates an independent tidy data set with the average of each variable for each activity and each subject