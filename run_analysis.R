library(plyr)

########################
# Part 1
# Merge test and train sets
# Set additional data
########################

features <- read.table('UCI HAR Dataset/features.txt', header = FALSE)
labels <- read.table('UCI HAR Dataset//activity_labels.txt',header = FALSE)

x_train <- read.table('UCI HAR Dataset/train/X_train.txt', header = FALSE)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt', header = FALSE)
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt', header = FALSE)

x_test <- read.table('UCI HAR Dataset/test/X_test.txt', header = FALSE)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt', header = FALSE)
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt', header = FALSE)

x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

#Set Headers on all merges
names(x_merge) <- features$V2
names(y_merge) <- c("activity")
names(subject_merge) <- c("subject")

#Merge into one big set
xy_merge <- cbind(y_merge,x_merge)
dataset <- cbind(subject_merge ,xy_merge)

########################
# Part 2
# Extract mean and std colums only with the activity and subject colums
########################

dataset <- dataset[,grepl("mean|std|subject|activity", names(dataset))]

########################
# Part 3
# Replace label id's with label names
########################

dataset[, 2] <- labels[dataset[,2],2]

########################
# Part 4
# Rename parts of headers to make it more clear
########################

names(dataset)<-gsub("^t", "time-", names(dataset))
names(dataset)<-gsub("^f", "frequency-", names(dataset))
names(dataset)<-gsub("Acc", "Acceleration", names(dataset))
names(dataset)<-gsub("Gyro", "Gyroscope", names(dataset))
names(dataset)<-gsub("Mag", "Magnitude", names(dataset))
names(dataset)<-gsub("BodyBody", "Body", names(dataset))
names(dataset)<-gsub("Body", "Body-", names(dataset))
names(dataset)<-gsub("Gravity", "Gravity-", names(dataset))

########################
# Part 5
# Create independent tidy data set 
# with the average of each variable for each activity and each subject
########################

subset_average_all = ddply(dataset, c("subject","activity"), numcolwise(mean))
write.table(subset_average_all, file = "subset_average_all.txt", row.name=FALSE )
