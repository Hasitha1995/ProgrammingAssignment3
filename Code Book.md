## The script_assignment.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

### Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

### Assigning each data file to variables
* features - features.txt : 561 rows, 2 columns
  * The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* activities - activity_labels.txt : 6 rows, 2 columns
  * List of activities performed when the corresponding measurements were taken and its activity_no (labels)
* test_subject - test/subject_test.txt : 2947 rows, 1 column
  * contains test data of 9/30 volunteer test subjects being observed
* test_x - test/X_test.txt : 2947 rows, 561 columns
  * contains recorded features test data
* test_x - test/y_test.txt : 2947 rows, 1 columns
  * contains test data of activities’activity_no labels
* train_subject - test/subject_train.txt : 7352 rows, 1 column
  * contains train data of 21/30 volunteer subjects being observed
* train_x - test/X_train.txt : 7352 rows, 561 columns
  * contains recorded features train data
* train_y - test/y_train.txt : 7352 rows, 1 columns
  * contains train data of activities’activity_no labels

### Merging the training and the test sets.
* test_data - contains all the data of test and train data

### Extracting only the measurements on the mean and standard deviation for each measurement
finaldataset (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, activity_no and the measurements on the mean and standard deviation (std) for each measurement

### Defining descriptive activity names to name the activities in the data set
Entire numbers in activity_no column of the finaldataset replaced with corresponding activity taken from second column of the activities variable

### Labeling data set with descriptive variable names
* activity_no column in finaldataset renamed into activities
* All Acc in column’s name replaced by Accelerometer
* All Gyro in column’s name replaced by Gyroscope
* All BodyBody in column’s name replaced by Body
* All Mag in column’s name replaced by Magnitude
* All start with character f in column’s name replaced by Frequency
* All start with character t in column’s name replaced by Time

### FA data set in step 4, that creates a second, independent tidy data set with the average of each variable for each activity and each subject
second_dataset (180 rows, 88 columns) is created by sumarizing finaldata taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export second_dataset into Results.txt file.
