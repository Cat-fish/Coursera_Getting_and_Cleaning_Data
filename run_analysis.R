#load data
feature <- read.table ("./UCI HAR Dataset/features.txt")
activity <- read.table ("./UCI HAR Dataset/activity_labels.txt")

X_test <- read.table ("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table ("./UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table ("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table ("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table ("./UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")

feat <- read.table("./UCI HAR Dataset/features.txt")

#step1 merge loaded data
#merge test sets
cmb_test <- cbind(X_test,Y_test,sub_test)
colnames(cmb_test)[562] <- "activity"
colnames(cmb_test)[563] <- "subject"
#merge train sets
cmb_train <- cbind(X_train,Y_train,sub_train)
colnames(cmb_train)[562] <- "activity"
colnames(cmb_train)[563] <- "subject"
#merge test and train sets
cmb_set <- rbind(cmb_test,cmb_train)
#check combined set
summary(cmb_set)

#step2 pickup means and standard deviations of each measurement
pick <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228
          ,240,241,253,254,266:271,345:350,424:429,503,504,529,530,542,543,562,563)
cmb_set_pick <- cmb_set[,pick]

#step3 adding activity name

library(plyr)
Y_test_fac <- as.factor(cmb_set$activity)
Y_test_fac2 <- revalue(Y_test_fac, c("1"="WALKING","2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS"
                                     ,"4"="SITTING","5"="STANDING","6"="LAYING"))
cmb_set_pick[,"activity"] <- as.data.frame(Y_test_fac2)
tail(cmb_set_pick)  #check

#step4 adding variable names
colnames(cmb_set_pick)[1:64] <- c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X",
                                  "tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y",
                                  "tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z",
                                  "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z",
                                  "tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
                                  "tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X",
                                  "tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y",
                                  "tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y",
                                  "tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()","tGravityAccMag-mean()",
                                  "tGravityAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()",
                                  "tBodyGyroMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z",
                                  "fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X",
                                  "fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y",
                                  "fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z",
                                  "fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-mean()",
                                  "fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()",
                                  "fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()",
                                  "fBodyBodyGyroJerkMag-std()")


#step5 calcurate mean for tidy data
cmb_set_splt <- split(cmb_set_pick, cmb_set_pick$activity)
cmb_set_splt1 <- cmb_set_splt$WALKING
cmb_set_splt2 <- cmb_set_splt$WALKING_UPSTAIRS
cmb_set_splt3 <- cmb_set_splt$WALKING_DOWNSTAIRS
cmb_set_splt4 <- cmb_set_splt$SITTING
cmb_set_splt5 <- cmb_set_splt$STANDING
cmb_set_splt6 <- cmb_set_splt$LAYING

cmb_set_mean1 <- aggregate(cmb_set_splt1[,c(1:64)],by=list(cmb_set_splt1$subject),mean)
cmb_set_mean2 <- aggregate(cmb_set_splt2[,c(1:64)],by=list(cmb_set_splt2$subject),mean)
cmb_set_mean3 <- aggregate(cmb_set_splt3[,c(1:64)],by=list(cmb_set_splt3$subject),mean)
cmb_set_mean4 <- aggregate(cmb_set_splt4[,c(1:64)],by=list(cmb_set_splt4$subject),mean)
cmb_set_mean5 <- aggregate(cmb_set_splt5[,c(1:64)],by=list(cmb_set_splt5$subject),mean)
cmb_set_mean6 <- aggregate(cmb_set_splt6[,c(1:64)],by=list(cmb_set_splt6$subject),mean)

cmb_set_mean1$activity <- "WAlKING"
cmb_set_mean2$activity <- "WALKING_UPSTAIRS"
cmb_set_mean3$activity <- "WALKING_DOWNSTAIRS"
cmb_set_mean4$activity <- "SITTING"
cmb_set_mean5$activity <- "STANDING"
cmb_set_mean6$activity <- "LAYING"

colnames(cmb_set_mean1)[1] <- "subject"
colnames(cmb_set_mean2)[1] <- "subject"
colnames(cmb_set_mean3)[1] <- "subject"
colnames(cmb_set_mean4)[1] <- "subject"
colnames(cmb_set_mean5)[1] <- "subject"
colnames(cmb_set_mean6)[1] <- "subject"

tddt <- rbind(cmb_set_mean1,cmb_set_mean2,cmb_set_mean3,cmb_set_mean4,cmb_set_mean5,cmb_set_mean6)
tddt <- tddt[c(66,1,2:65)]

#export the data
write.table(tddt, "./tidy_data.txt", sep=", ")
