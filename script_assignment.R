filename <- "Coursera_DS3_Final.zip"

# Checking whether zip file exists
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename)
}  

# Checking whether unzip file exists
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

#Basic Info
features <- read.table("UCI HAR Dataset/features.txt",col.names = c("index","variables"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("actvity_no","activity"))

#Test data
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$variables)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_no")

#Train data
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$variables)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_no")

#Merge test data
test_data= cbind(test_subject,test_y, test_x)

#Merged train data
train_data=cbind(train_subject,train_y,train_x)

#Final dataset (step 1)
finaldataset=rbind(test_data,train_data)

#Extracting mean and standard deviation (step 2)
finaldataset=select(finaldataset,subject,activity_no,contains("mean"), contains("std"))

#Descriptive activity names to name the activities in the dataset (step 3)
finaldataset$activity_no <- activities[finaldataset$activity_no,"activity"]

#Labels for the data set with descriptive variable names (step 4)
finaldataset <- rename(finaldataset,activity =activity_no)
names(finaldataset)<-gsub("\\.", "", names(finaldataset))
names(finaldataset)<-gsub("\\...", "", names(finaldataset))
names(finaldataset)<-gsub("Acc", "Accelerometer", names(finaldataset))
names(finaldataset)<-gsub("Gyro", "Gyroscope", names(finaldataset))
names(finaldataset)<-gsub("BodyBody", "Body", names(finaldataset))
names(finaldataset)<-gsub("Mag", "Magnitude", names(finaldataset))
names(finaldataset)<-gsub("^t", "Time", names(finaldataset))
names(finaldataset)<-gsub("tBody", "TimeBody", names(finaldataset))
names(finaldataset)<-gsub("[mM]ean", "Mean", names(finaldataset))
names(finaldataset)<-gsub("[sS]td", "STD", names(finaldataset))
names(finaldataset)<-gsub("(^f|[Ff]req)", "Frequency", names(finaldataset))
names(finaldataset)<-gsub("angle", "Angle", names(finaldataset))
names(finaldataset)<-gsub("gravity", "Gravity", names(finaldataset))

# independent tidy data set (step 5)
second_dataset <- group_by(finaldataset,subject,activity)
second_dataset <- summarise_all(second_dataset, mean)
write.table(second_dataset, "Results.txt", row.name=FALSE)
