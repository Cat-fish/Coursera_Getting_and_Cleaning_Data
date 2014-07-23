#Original data
The original data used for this program is located here;
oudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This program uses only some of the data sets in the zip file;
1. /UCI HAR Dataset/features.txt
2. /UCI HAR Dataset/activity_labels.txt
3. /UCI HAR Dataset/test/X_test.txt
4. /UCI HAR Dataset/test/Y_test.txt
5. /UCI HAR Dataset/test/subject_test.txt
6. /UCI HAR Dataset/train/X_train.txt
7. /UCI HAR Dataset/train/Y_train.txt
8. /UCI HAR Dataset/train/subject_train.txt

#Arranged tidy data
An arranged tidy data is in tddt file. 

#Data cleaning 
Data cleaning is done with a little changes of variable and column names from the original files. All variable and colum names are explained in the following section.

#Variables
column1(activity): There are six activities in total (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING,STANDING, and LAYING), and each column has one of six activities.
column2(subject): There are thirty subjects in total, and each column has one of thirty subjects.
column3 to 66: These variables contain the mean values for each activity and each subject. The columns are named based on the rules below (the detailed explanation is available in features_info.txt in the original zip file);


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
