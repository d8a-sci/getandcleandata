##Project
The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare
tidy data that can be used for later analysis.

##Data origin
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Tidying the data
There are various data files, divided in training and test sets. For each there is a file identifying the subjects, the activities and the measured domain variables.  After all the data files are read, the corresponding training data and test data is concatenated.
Subsequently the metadata (variable names) are read in order to appropriately label the data.
Next, irrelevant columns/attributes are dropped from the data set (as per project instruction only means ad standard deviations need to be considered).
The requirements are not specific about what means are relevant, so any measurement of some kind of mean is kept (including means like meanFreq values!).
In the data the activity codes are then replaced by descriptive names for the activities .
Finally all data sets are merged/joined.  There's no point in joining on a certain id; all data files are sequential per subject id.

For the analysis, a  new data set is created.  This set contains the average of each variable (79 x) for each activity and each subject.
The result is saved in a file "data_means.text". 

##Description of the variables

###s_id
Integer value identifying the subject who performed the activity
 
###activity
Character value indicating one of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by the subject whhile wearing a smartphone.

###Feature variables
The features selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag

The set of variables that were analysed for these signals are: 
 - mean(): Mean value
 - std(): Standard deviation
 - meanFreq(): Weighted average of the frequency components to obtain a mean frequency

The domain variables are:

## tBodyAcc-mean()-X              
## tBodyAcc-mean()-Y              
## tBodyAcc-mean()-Z              
## tBodyAcc-std()-X               
## tBodyAcc-std()-Y               
## tBodyAcc-std()-Z               
## tGravityAcc-mean()-X           
## tGravityAcc-mean()-Y           
## tGravityAcc-mean()-Z           
## tGravityAcc-std()-X            
## tGravityAcc-std()-Y            
## tGravityAcc-std()-Z            
## tBodyAccJerk-mean()-X          
## tBodyAccJerk-mean()-Y          
## tBodyAccJerk-mean()-Z          
## tBodyAccJerk-std()-X           
## tBodyAccJerk-std()-Y           
## tBodyAccJerk-std()-Z           
## tBodyGyro-mean()-X             
## tBodyGyro-mean()-Y             
## tBodyGyro-mean()-Z             
## tBodyGyro-std()-X              
## tBodyGyro-std()-Y              
## tBodyGyro-std()-Z              
## tBodyGyroJerk-mean()-X         
## tBodyGyroJerk-mean()-Y         
## tBodyGyroJerk-mean()-Z         
## tBodyGyroJerk-std()-X          
## tBodyGyroJerk-std()-Y          
## tBodyGyroJerk-std()-Z          
## tBodyAccMag-mean()             
## tBodyAccMag-std()              
## tGravityAccMag-mean()          
## tGravityAccMag-std()           
## tBodyAccJerkMag-mean()         
## tBodyAccJerkMag-std()          
## tBodyGyroMag-mean()            
## tBodyGyroMag-std()             
## tBodyGyroJerkMag-mean()        
## tBodyGyroJerkMag-std()         
## fBodyAcc-mean()-X              
## fBodyAcc-mean()-Y              
## fBodyAcc-mean()-Z              
## fBodyAcc-std()-X               
## fBodyAcc-std()-Y               
## fBodyAcc-std()-Z               
## fBodyAcc-meanFreq()-X          
## fBodyAcc-meanFreq()-Y          
## fBodyAcc-meanFreq()-Z          
## fBodyAccJerk-mean()-X          
## fBodyAccJerk-mean()-Y          
## fBodyAccJerk-mean()-Z          
## fBodyAccJerk-std()-X           
## fBodyAccJerk-std()-Y           
## fBodyAccJerk-std()-Z           
## fBodyAccJerk-meanFreq()-X      
## fBodyAccJerk-meanFreq()-Y      
## fBodyAccJerk-meanFreq()-Z      
## fBodyGyro-mean()-X             
## fBodyGyro-mean()-Y             
## fBodyGyro-mean()-Z             
## fBodyGyro-std()-X              
## fBodyGyro-std()-Y              
## fBodyGyro-std()-Z              
## fBodyGyro-meanFreq()-X         
## fBodyGyro-meanFreq()-Y         
## fBodyGyro-meanFreq()-Z         
## fBodyAccMag-mean()             
## fBodyAccMag-std()              
## fBodyAccMag-meanFreq()         
## fBodyBodyAccJerkMag-mean()     
## fBodyBodyAccJerkMag-std()      
## fBodyBodyAccJerkMag-meanFreq() 
## fBodyBodyGyroMag-mean()        
## fBodyBodyGyroMag-std()         
## fBodyBodyGyroMag-meanFreq()    
## fBodyBodyGyroJerkMag-mean()    
## fBodyBodyGyroJerkMag-std()     
## fBodyBodyGyroJerkMag-meanFreq()
