#Original data
Original data used for this program is located here;
oudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This program uses some of the data sets in the zup file;
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
column1(activity): This variable explains which activity a subject did. There are six activities in total (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING,STANDING, and LAYING), and each column has one of six activities.
column2(subject): This variable explains who did an activity. There are thirty subjects in total, and each column has one of thirty subjects.
column3 to 66: These varialbes contain the mean values of each activity and each subject. The column names are following the rules below;
