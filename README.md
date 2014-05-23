Getting_and_Cleaning_Data
=========================

Getting_and_Cleaning_Data

This repository contains the code used in R to import and process the raw data indicated in the course project.

All files relevant to the project should be available in your working directory as .txt (the original format in raw data).

Relevant files are "features.txt", "X_test.txt", "X_train.txt", "subject_test.txt", "subject_train.txt",  "y_train.txt", "y_test.txt", "activity_labels.txt", as far as I have correctly interpreted the troublesome instructions of the project. the easiest way to run my code is having extracted all the files from the .rar file to your working directory by choosing "not to keep routes" in winrar.

The output is a "tidydata.txt" file that can be read using read.table("tidydata.txt", check.names = F) command

Rownames of tidydata object identify the number of the subject "1-30" followed by the name of the activity he is performing (Laying, Sitting, Standing, Walking, Walking Downstairs, Walking Upstairs)
Colnames of tidydata reflect the different variable names, calculated by grouping and calculating the mean of the several measures in axis X, Y, Z for each variable.
The final table is 180 * 34, containing "average of each variable for each activity and each subject" as requested in the course project.

Instructions in the course project about the desired output and the overall process were extremely vague, and I tried to follow my own common sense :)
