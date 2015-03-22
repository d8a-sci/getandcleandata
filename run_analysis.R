# Load useful libraries/packages
library(dplyr)
library(reshape2)
library(qdapTools)


# Read all the data files
# At this stage it's not relevant which is which, though the names are known/fixed
datafiles	<- list.files(c("./test","./train"), pattern="*.txt", full.names=TRUE)
df.list		<- lapply(datafiles, read.table)
basenames	<- sub(".*/(.*).txt", "\\1", datafiles)
names(df.list)	<- basenames

# Concatenate the training data and test data
subject.concat	<- do.call(rbind, c(df.list[c("subject_train","subject_test")]))	# Subjects
X.concat	<- do.call(rbind, c(df.list[c("X_train",      "X_test")]))		# Features
y.concat	<- do.call(rbind, c(df.list[c("y_train",      "y_test")]))		# Activities

# Check number of observations in each set
n <- nrow(subject.concat)
if ( (nrow(X.concat) != n) || (nrow(y.concat) != n) ) {
        stop("Data mismatch")
} 

# Get metadata
activity.labels	<- read.table("activity_labels.txt")
features	<- read.table("features.txt", stringsAsFactors = FALSE)

# Appropriately label the data  (Project item 4)
names(subject.concat)	<- c("s_id")
names(X.concat)		<- features$V2
names(y.concat)		<- c("activity")

# Drop irrelevant columns/attributes (Project item 2)
# Keep only mean and standard deviation for each measurement
#	Requirements are not specific about what means are relevant,
# 	so including means like meanFreq values!
X.concat		<- X.concat[,grep("mean|std",x = features$V2)]


# Use descriptive names for the activities (Project item 3)
# Use shorthand for y.concat$V1<-lookup(y.concat$V1, activity.labels, missing = NULL)
y.concat$activity	<- y.concat$activity %lc+% activity.labels 


# Merge all (Project item 1)
# No point in joining on a certain id; all data files are sequential per subject id
data0		<- cbind(subject.concat,y.concat,X.concat)

# Create new data set (Project item 5)
# This set contains the average of each variable (79 x) for each activity and each subject
m		<- melt(data0, id=c("s_id","activity"))		# All others are used for measured variables
data		<- dcast(m, s_id + activity ~ variable, mean)

# Save the result
# Obtain this reults back in R through the command:
# > data.means <- read.table("data_means.txt", header = TRUE, stringsAsFactors=FALSE, check.names = F)
# Inspect with:
# > View(data.means)
write.table(data, file="data_means.txt", row.names=FALSE)

