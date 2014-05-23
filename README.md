Getting_and_Cleaning_Data
=========================

Getting_and_Cleaning_Data

This repository contains the code used in R to import and process the raw data indicated in the course project.

All files should be available in your working directory as .txt (the original format in raw data).

The output is a "tidydata.txt" file that can be read using read.table("tidydata.txt", check.names = F) command

Rownames of tidydata object identify the number of the subject "1-30" followed by the name of the activity he is performing (Laying, Sitting, Standing, Walking, Walking Downstairs, Walking Upstairs)
Colnames of tidydata reflect the different variable names, calculated by grouping and calculating the mean of the several measures in axis X, Y, Z for each variable.
The final table is 180 * 34, containing "average of each variable for each activity and each subject" as requested in the course project.

Instructions in the course project about the desired output and the overall process were extremely vague, and I tried to follow my own common sense :)
