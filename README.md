# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

## Project

The R script run_analysis.R does:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Load ```run_analysis.R``` and set your working directory in  ```"PUT YOUR DIRECTORY HERE"```.
2. Run ```"run_analysis.R"```, then it will generate a datafile ```average_grouped.txt``` in your working directory.
3. ```average_grouped.txt``` is the second, independent tidy data set with the average of each variable for each activity and each subject 
4. Read [Codebook](https://github.com/Lurace/Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project/blob/master/Codebook.md) for more information about the variables in ```complete_set.txt```  and ```average_grouped.txt``` 

## R Packages needed

```run_analysis.R``` file require on ```tidyr``` and ```dplyr```.
