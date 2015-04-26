##Getting and Cleaning Data Course Project

Welcome to my Course Project. The run_analysis.R file assumes that in the working directory there is the folder ```./UCI HAR Dataset/``` with all the data.


The run_analysis.R goes through all 5 steps and will generate the file ```subset_average_all.txt``` after running. Each step has a comment on top. To shortly go through each step:
  1. In this step I've defined all the data that will be used for the other steps. At the end of step one I've defined my merged set named dataset. 
  2. I regex search with grepl on mean, std, activity and subject and filter my dataset on those.
  3. Here I've added the activity labels to my second column. Which is the activity column.
  4. Then several gsub's apply to the header names to make it more readable. The BodyBody I've changed to singular Body and added extra '-' for readability.
  5. Last a subset dataset names ```subset_average_all.txt``` will generate with the mean of each variable applied to this subset
