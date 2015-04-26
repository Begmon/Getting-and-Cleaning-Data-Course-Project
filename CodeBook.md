##Code Book

###Description
This repo is for the Coursera course Getting and Cleaning data. For the part Course Project. Following the assignment the file run_analysis.R goes through five steps to generate a subset.

###Data Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The explination of the raw data can be found here: [Human Activity Recognition Using Smartphone]

The raw data can be found here: [Raw Data]

[Human Activity Recognition Using Smartphone]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
[Raw Data]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Tiny Data Set Creation

The X_...txt, y_..txt and subject_...txt files have been merged using cbind() and rbind() into one big dataset named ```dataset```. 

From this big dataset the columns with mean, std, activity and subject have been substracted and placed into ```dataset```.

Then headers have been added from the features.txt. After which the header labels activity and subject have been added respectively.

After which the header names undergo slight name changes for better readability

Last a subset ```subset_average_all.txt``` will be generated with 180 rows and 81 cols. Holding the mean of each value.

