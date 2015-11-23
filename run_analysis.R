#Coursera- Data Science Specializaton- Getting and Cleaning Data
##Course Project
##Completed 11/22/15
##David Myers 
rm(list=ls())

#Purpose-provide reproducible method for generating single clean datafiles for 
## analysis of activity

#Data Source
###UCI acclerometer data source: 
####https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###USI reference page: 
#####http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Please check working directory to make sure it is set to ./UCI HAR Dataset
####personal set of wd
####setwd("/Users/DAMMD/DataAnalysis/Coursera03- DataCleaning/UCI HAR Dataset")
getwd()


#Step 1- loading and merging data from training and test sets
#get data-labels/input/acitivity

##test data
    test.subjects <- read.table("test/subject_test.txt", col.names="subject")
    test.activity <- read.table("test/y_test.txt", col.names="Activity Code")
    test.data <- read.table("test/X_test.txt")
    
##training data
    train.subjects <- read.table("train/subject_train.txt", col.names="subject")
    train.activity <- read.table("train/y_train.txt", col.names="Activity Code")
    train.data <- read.table("train/X_train.txt")

##Merge datasets with columns for test.[] and train.[] then rows for test.combined
    #and train.combined 
    data.combined <- rbind(cbind(test.subjects, test.activity, test.data),
                  cbind(train.subjects, train.activity, train.data))
    
#Step 2
    #set up table of column names from features.txt for the X data in test/train
    #talbe with have V column # matched to column names from data source
    features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
    #retain only those with mean or std in column names along with V column #
    features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
    #select combined data for the columns with means and std values
    #Note value of features$V1 is 2 less than column in data.combined due to 
    #merge with subjects and Acitivity Code columns (cbind above)
    data.mean.std <- data.combined[, c(1, 2, features.mean.std$V1+2)]
    
#Step 3
    #Generate Factor for lableling activities later
    activity.labels<- read.table("activity_labels.txt", 
                                 col.names=c("Activity Code", "Activity"),
                                 stringsAsFactors = FALSE)
    
    #replace Activity Code with Activity description
    data.mean.std$Activity.Code<-activity.labels[data.mean.std$Activity.Code,2]
    
#Step 4
    #name columns of data.mean.std from X_test/train with appropriate titles
    
    #create list of column names from pattern of cBinds above and selected columns
    column.names<- c("subject", "activity", features.mean.std$V2)
    
    #Adjust column names to be more humanly readable
    #Note: complete common English names would be overly long and not add 
    #to comprehension from the coder's point of view
    for (i in 1:length(column.names)) {
        column.names[i] = gsub("\\()","",column.names[i])
        column.names[i] = gsub("-std$","StdDev",column.names[i])
        column.names[i] = gsub("-mean","Mean",column.names[i])
        column.names[i] = gsub("^(t)","time",column.names[i])
        column.names[i] = gsub("^(f)","frequency",column.names[i])
        column.names[i] = gsub("([Gg]ravity)","Gravity",column.names[i])
        column.names[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",
                               column.names[i])
        column.names[i] = gsub("[Gg]yro","Gyro",column.names[i])
        column.names[i] = gsub("AccMag","AccelerationMagnitude",column.names[i])
        column.names[i] = gsub("([Bb]odyaccjerkmag)",
                               "BodyAccelerationJerkMagnitude",column.names[i])
        column.names[i] = gsub("JerkMag","JerkMagnitude",column.names[i])
        column.names[i] = gsub("GyroMag","GyroMagnitude",column.names[i])
    }
 
    #apply names to selected data set
    colnames(data.mean.std)<-column.names
    
#Step 5
    #make aggregates of data from each subject for each acvitiy
    tidydata<- aggregate(data.mean.std[, 3:ncol(data.mean.std)], 
                         by=list(subject = data.mean.std$subject, 
                                   acitvity = data.mean.std$activity), mean)
    
    #Save to outputfile
    write.table(tidydata, file="UCI-HumanActivityRecognitionDataCleaned.txt", 
                row.names = FALSE)
    
    