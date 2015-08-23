# This script merges the test data and the training data, sorts the data, and adds descriptive names

# create a clean directory in which the merged data will be placed
unlink("merged", recursive = T)
dir.create("merged")
dir.create("merged/Inertial Signals")

# merge the subject numbers
subject_merged <- read.csv("test/subject_test.txt", header = F)
subject_train  <- read.csv("train/subject_train.txt", header = F)
colnames(subject_merged)[1] <- "subject_number"
colnames(subject_train)[1] <- "subject_number"
subject_merged <- rbind(subject_merged, subject_train)

# merge the activity numbers
activity_merged <- read.csv("test/y_test.txt", header = F)
activity_train  <- read.csv("train/y_train.txt", header = F)
colnames(activity_merged)[1] <- "activity"
colnames(activity_train)[1] <- "activity"
activity_merged <- rbind(activity_merged, activity_train)

# read the 561 statistical feature summaries
feature_data <- read.csv("features.txt", header = F, sep = " ")
feature_names <- feature_data[2]
feature_names <- as.character(feature_names[,1])

# merge the 561 statistical feature summaries
width_vector <- rep(16, 561)
features_merged_laf <- laf_open_fwf("test/X_test.txt", 
                                column_types=rep("numeric", length(width_vector)),
                                column_widths = width_vector,
                                column_names = feature_names)
features_train_laf  <- laf_open_fwf("train/X_train.txt", 
                                column_types=rep("numeric", length(width_vector)),
                                column_widths = width_vector,
                                column_names = feature_names)
features_merged <- features_merged_laf[,]
features_train  <- features_train_laf[,]
features_merged <- rbind(features_merged, features_train)

# merge the raw data
# body_acc_x
body_acc_x_merged <- read.csv("test/Inertial Signals/body_acc_x_test.txt", header = F)
body_acc_x_train  <- read.csv("train/Inertial Signals/body_acc_x_train.txt", header = F)
colnames(body_acc_x_merged)[1] <- "body_acc_x"
colnames(body_acc_x_train)[1] <- "body_acc_x"
body_acc_x_merged <- rbind(body_acc_x_merged, body_acc_x_train)

# body_acc_y
body_acc_y_merged <- read.csv("test/Inertial Signals/body_acc_y_test.txt", header = F)
body_acc_y_train  <- read.csv("train/Inertial Signals/body_acc_y_train.txt", header = F)
colnames(body_acc_y_merged)[1] <- "body_acc_y"
colnames(body_acc_y_train)[1] <- "body_acc_y"
body_acc_y_merged <- rbind(body_acc_y_merged, body_acc_y_train)

# body_acc_z
body_acc_z_merged <- read.csv("test/Inertial Signals/body_acc_z_test.txt", header = F)
body_acc_z_train  <- read.csv("train/Inertial Signals/body_acc_z_train.txt", header = F)
colnames(body_acc_z_merged)[1] <- "body_acc_z"
colnames(body_acc_z_train)[1] <- "body_acc_z"
body_acc_z_merged <- rbind(body_acc_z_merged, body_acc_z_train)

# body_gyro_x
body_gyro_x_merged <- read.csv("test/Inertial Signals/body_gyro_x_test.txt", header = F)
body_gyro_x_train  <- read.csv("train/Inertial Signals/body_gyro_x_train.txt", header = F)
colnames(body_gyro_x_merged)[1] <- "body_gyro_x"
colnames(body_gyro_x_train)[1] <- "body_gyro_x"
body_gyro_x_merged <- rbind(body_gyro_x_merged, body_gyro_x_train)

# body_gyro_y
body_gyro_y_merged <- read.csv("test/Inertial Signals/body_gyro_y_test.txt", header = F)
body_gyro_y_train  <- read.csv("train/Inertial Signals/body_gyro_y_train.txt", header = F)
colnames(body_gyro_y_merged)[1] <- "body_gyro_y"
colnames(body_gyro_y_train)[1] <- "body_gyro_y"
body_gyro_y_merged <- rbind(body_gyro_y_merged, body_gyro_y_train)

# body_gyro_z
body_gyro_z_merged <- read.csv("test/Inertial Signals/body_gyro_z_test.txt", header = F)
body_gyro_z_train  <- read.csv("train/Inertial Signals/body_gyro_z_train.txt", header = F)
colnames(body_gyro_z_merged)[1] <- "body_gyro_z"
colnames(body_gyro_z_train)[1] <- "body_gyro_z"
body_gyro_z_merged <- rbind(body_gyro_z_merged, body_gyro_z_train)

# total_acc_x
total_acc_x_merged <- read.csv("test/Inertial Signals/total_acc_x_test.txt", header = F)
total_acc_x_train  <- read.csv("train/Inertial Signals/total_acc_x_train.txt", header = F)
colnames(total_acc_x_merged)[1] <- "total_acc_x"
colnames(total_acc_x_train)[1] <- "total_acc_x"
total_acc_x_merged <- rbind(total_acc_x_merged, total_acc_x_train)

# total_acc_y
total_acc_y_merged <- read.csv("test/Inertial Signals/total_acc_y_test.txt", header = F)
total_acc_y_train  <- read.csv("train/Inertial Signals/total_acc_y_train.txt", header = F)
colnames(total_acc_y_merged)[1] <- "total_acc_y"
colnames(total_acc_y_train)[1] <- "total_acc_y"
total_acc_y_merged <- rbind(total_acc_y_merged, total_acc_y_train)

# total_acc_z
total_acc_z_merged <- read.csv("test/Inertial Signals/total_acc_z_test.txt", header = F)
total_acc_z_train  <- read.csv("train/Inertial Signals/total_acc_z_train.txt", header = F)
colnames(total_acc_z_merged)[1] <- "total_acc_z"
colnames(total_acc_z_train)[1] <- "total_acc_z"
total_acc_z_merged <- rbind(total_acc_z_merged, total_acc_z_train)

# bind the subjects, activities, features and raw data together
data_merged <- cbind(subject_merged, 
                     activity_merged, 
                     features_merged,
                     body_acc_x_merged,
                     body_acc_y_merged,
                     body_acc_z_merged,
                     body_gyro_x_merged,
                     body_gyro_y_merged,
                     body_gyro_z_merged,
                     total_acc_x_merged,
                     total_acc_y_merged,
                     total_acc_z_merged)

# sort the data, first on subject, then on activity
data_merged <- data_merged[order(data_merged$subject_number, data_merged$activity),]

# replace activity numbers by descriptive names
data_merged$activity[data_merged$activity=="1"] <- "WALKING"
data_merged$activity[data_merged$activity=="2"] <- "WALKING_UPSTAIRS"
data_merged$activity[data_merged$activity=="3"] <- "WALKING_DOWNSTAIRS"
data_merged$activity[data_merged$activity=="4"] <- "SITTING"
data_merged$activity[data_merged$activity=="5"] <- "STANDING"
data_merged$activity[data_merged$activity=="6"] <- "LAYING"


# Extract the features on the mean or the standard deviation
mean_std_names <- colnames(data_merged)
mean_std_names <- mean_std_names[grep("mean|std", mean_std_names)]
extract_column_names <- c("subject_number", "activity", mean_std_names)
extracted_merged_data <- subset(data_merged, select = extract_column_names)

# create data objects that will be written to files in the merged directory
subject_export  <- data_merged[,1]
activity_export <- data_merged[,2]
features_export <- data_merged[,3]
body_acc_x_export <- data_merged[,4]
body_acc_y_export <- data_merged[,5]
body_acc_z_export <- data_merged[,6]
body_gyro_x_export <- data_merged[,7]
body_gyro_y_export <- data_merged[,8]
body_gyro_z_export <- data_merged[,9]
total_acc_x_export <- data_merged[,10]
total_acc_y_export <- data_merged[,11]
total_acc_z_export <- data_merged[,12]

# write the data objects
write.table(extracted_merged_data, "merged/extracted_data.txt", quote = F, row.names = F)
write.table(data_merged, "merged/all_data.txt", quote = F, row.names = F)
write.table(subject_export, "merged/subject.txt", row.names = F)
write.table(activity_export, "merged/activity.txt", quote = F, row.names = F)
write.table(features_export, "merged/features.txt", quote = F, row.names = F)
write.table(body_acc_x_export, "merged/Inertial Signals/body_acc_x.txt", quote = F, row.names = F)
write.table(body_acc_y_export, "merged/Inertial Signals/body_acc_y.txt", quote = F, row.names = F)
write.table(body_acc_z_export, "merged/Inertial Signals/body_acc_z.txt", quote = F, row.names = F)
write.table(body_gyro_x_export, "merged/Inertial Signals/body_gyro_x.txt", quote = F, row.names = F)
write.table(body_gyro_y_export, "merged/Inertial Signals/body_gyro_y.txt", quote = F, row.names = F)
write.table(body_gyro_z_export, "merged/Inertial Signals/body_gyro_z.txt", quote = F, row.names = F)
write.table(total_acc_x_export, "merged/Inertial Signals/total_acc_x.txt", quote = F, row.names = F)
write.table(total_acc_y_export, "merged/Inertial Signals/total_acc_y.txt", quote = F, row.names = F)
write.table(total_acc_z_export, "merged/Inertial Signals/total_acc_z.txt", quote = F, row.names = F)

# Split the extracted_merged_data on subject number and activity and compute the averages
list_of_split_extracted <- split(extracted_merged_data, 
                                 list(extracted_merged_data$subject_number, 
                                      extracted_merged_data$activity))

# Arrange the first column of the tidy data
col <-1
tidy_df <- as.data.frame(rep(c(1:30),6))
t(tidy_df)
colnames(tidy_df) <- colnames(extracted_merged_data)[col]

# Arrange the second column of the tidy data
col <-2
temp <- as.data.frame(rep(c("LAYING", 
                               "SITTING", 
                               "STANDING", 
                               "WALKING", 
                               "WALKING_DOWNSTAIRS", 
                               "WALKING_UPSTAIRS"),each=30))
t(temp)
colnames(temp) <- colnames(extracted_merged_data)[col]
tidy_df <- cbind(tidy_df, temp)

# Arrange the third till last column of the tidy data
for (col in 3:length(colnames(extracted_merged_data))) {
        temp <- as.data.frame(sapply(list_of_split_extracted, 
                                        function(df) {
                                                mean(df[,col])
                                        }))
        colnames(temp) <- colnames(extracted_merged_data)[col]
        tidy_df <- cbind(tidy_df, temp)
}



# Write the tidy data
write.table(tidy_df, "merged/tidy_data.txt", quote = F, row.names = F)



