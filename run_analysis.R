#Peer-graded Assignment: Getting and Cleaning Data Course Project

# 1. Merges the training and the test sets to create one data set.

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# 3. Uses descriptive activity names to name the activities in the data set

# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject

# Download, store and read all datasets with R

setwd("C:/Users/Luis/OneDrive/Data Science John Hopkins")

if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl, destfile = "./data/dataset.zip")
unzip("./data/dataset.zip", exdir = "./data/")
activitylabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("activityid", "activity"))
features <- read.table("./data/UCI HAR Dataset/features.txt")
traininglabels <- as.vector(read.table("./data/UCI HAR Dataset/train/Y_train.txt"))
testlabels <- as.vector(read.table("./data/UCI HAR Dataset/test/Y_test.txt"))
subjecttest <- as.vector(read.table("./data/UCI HAR Dataset/test/subject_test.txt"))
subjecttrain <- as.vector(read.table("./data/UCI HAR Dataset/train/subject_train.txt"))
testset <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
trainingset <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
names(testset) <- features$V2
names(trainingset) <- features$V2

# Loading necessary packages

library(dplyr)
library(tidyr)

# Create test and training sets by binding the subject id and 
# adding an indentification label of the origin of the set

test <- testset %>%
        bind_cols (testlabels, subjecttest) %>%
        rename (activityid = 'V1', subject = "V11") %>%
        mutate(dataset = "test")
training <- trainingset %>%
            bind_cols (traininglabels, subjecttrain) %>%
            rename (activityid = 'V1', subject = "V11") %>%
            mutate(dataset = "training")

# Merge test and training datasets

complete_set <- bind_rows (test, training)

# Extract Select measurements on the mean and standard deviation for each measurement
# use descriptive activity names to name the activities in the data set
# Separate variables in the same column 

complete_set <- complete_set %>% 
                select (subject, activityid, dataset, contains("mean()"), contains("std()")) %>% 
                inner_join(activitylabels) %>%
                select (-activityid) %>%
                gather(variable, value, "tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-std()") %>%
                separate(variable,into = c("signal", "variable", "axialdirection"), sep = "-")

# Change the texts with descriptive variable names.

complete_set <- complete_set %>% mutate(activity=tolower(activity)) 
complete_set$variable <- gsub("()", "", complete_set$variable, fixed = TRUE)
complete_set$signal <- gsub("^t", "Time", complete_set$signal)
complete_set$signal <- gsub("^f", "Frequency", complete_set$signal)
complete_set$signal <- gsub("Acc", "Accelerometer", complete_set$signal)
complete_set$signal <- gsub("Gyro", "Giroscope", complete_set$signal)
complete_set$signal <- gsub("Mag", "Magnitude", complete_set$signal)
complete_set$signal <- gsub("BodyBody", "Body", complete_set$signal)

# export dataset

write.table(complete_set, "complete_set.txt", row.names = FALSE)

# creation of a second tidy data set with the average of each variable for each activity and each subject

average_grouped <- complete_set %>% 
                   group_by(subject, dataset, signal, variable, axialdirection) %>%
                   summarize(average=mean(value))

# export dataset

write.table(average_grouped, "average_grouped.txt", row.names = FALSE)
