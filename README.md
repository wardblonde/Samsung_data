
This script, run_analysis.R, merges the test data and the training data of Samsung phones that were attached to the waist during activities:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It merges, sorts and adds descriptive names

The script contains the following sections:
* create a clean directory in which the merged data will be placed
* merge the subject numbers of test and training data
* merge the activity numbers of test and training data
* read the 561 statistical feature summaries
* merge the 561 statistical feature summaries of test and training data
* merge the raw data: body_acc_x, body_acc_y, body_acc_z, body_gyro_x, body_gyro_y, body_gyro_z, total_acc_x, total_acc_y, total_acc_z
* bind the subjects, activities, features and raw data together
* sort the data, first on subject, then on activity
* replace activity numbers by descriptive names
* Extract the features on the mean or the standard deviation
* create data objects that will be written to files in the merged directory
* write the data objects

One of the written files, extracted_data.txt, is used further for to calculate the averages for each subject and each activity. The script continues as follows to produce the tidy data in tidy_data.txt:

* Split the extracted_merged_data on subject number and activity and compute the averages
* Arrange the first column of the tidy data
* Arrange the second column of the tidy data
* Arrange the third till last column of the tidy data
* Write the tidy data

The variable names are explained in the codebook.