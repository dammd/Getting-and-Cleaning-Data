---
title: "README"
author: "David Myers"
date: "November 22, 2015"
output: html_document
---

This file provides first entry into the results for the Coursera: Getting and Cleaning Data Class Project.  
 
Files in this result set include the following
    *README.md-this file
    *run_analsis.R-The Rscript file for the analysis with reference comments 
       correspond to for discussion of mark up in README.md

##Rscript Discussion
###run_analysis.R
####Part 1
Data files for primary data are loaded in to memory to construction a column 
bound merge within test and train groups of data. The resulting data are then 
row bound to stack test data on top of training data. This is placed in a 
temporary dataset "data.combined"

####Part 2
The columns label from features.txt are read into memory.  The text values are 
selected for "std" and "mean" in the text values.  The select column names and 
there realitve positions are saved.  A *if* driven segment substitution of
abreviations in the column names for longer words is done next.

The column numbers of the column.names are used with adjustment in data.combinded 
table to select for the desired columns with mean and standard deviation of the
mean data. Finally the column names are attached after assembling a new list of
all desired column names. 

####Part 3

The activity _labels.txt file is used to decode the activities for entries and
store the factor with the activities common name in the data. 

####Part 4
The mean of each subject's values by activity are calculated by the *aggergate*
function and the resulting data table is saved as the final result. 

####Part 5
The cleaned data table is exported as a space delimited text file.  
    

##Codebook For UCI-HumanActivityRecognitionDataCleaned.txt
###UCI Human Activity by Waist Worn Accelerometer Summary Data Set

####File specifications
    text file
    space delimited
    row unique identifier -> subject+activity 
    
####File Conventions 
Mean data by each participant is presented by activity in file. 

####Data Specifications

No documentation of units was present in the original dataset. 

    "subject"                       Subject identification number                         
    "activity"                      Activity recorded by subject
    "timeBodyAccMean-X"             average duration of acceleration in X plane of phone
    "timeBodyAccMean-Y"             average duration of acceleration in Y plane of phone
    "timeBodyAccMean-Z"             average duration of acceleration in Z plane of phone                  
    "timeBodyAcc-std-X"               standard deviation of the mean in X                  
    "timeBodyAcc-std-Y"               standard deviation of the mean in Y                   
    "timeBodyAcc-std-Z"               standard deviation of the mean in Z                   
    "timeGravityAccMean-X"          average duration of acceleration in X due to gravity                  
    "timeGravityAccMean-Y"          average duration of acceleration in Y due to gravity                  
    "timeGravityAccMean-Z"          average duration of acceleration in Z due to gravity                  
    "timeGravityAcc-std-X"            standard deviation of the mean in X                  
    "timeGravityAcc-std-Y"            standard deviation of the mean in Y                  
    "timeGravityAcc-std-Z"            standard deviation of the mean in Z
    "timeBodyAccJerkMean-X"         average duration of acceleration in X due to jerky movements
    "timeBodyAccJerkMean-Y"         average duration of acceleration in Y due to jerky movements                  
    "timeBodyAccJerkMean-Z"         average duration of acceleration in Z due to jerky movements                  
    "timeBodyAccJerk-std-X"           standard deviation of the mean in X                
    "timeBodyAccJerk-std-Y"           standard deviation of the mean in Y                  
    "timeBodyAccJerk-std-Z"           standard deviation of the mean in Z                  
    "timeBodyGyroMean-X"            average duration of a body's gyroscopic motion in X                  
    "timeBodyGyroMean-Y"            average duration of a body's gyroscopic motion in Y                
    "timeBodyGyroMean-Z"            average duration of a body's gyroscopic motion in Z                  
    "timeBodyGyro-std-X"              standard deviation of the mean in X          
    "timeBodyGyro-std-Y"              standard deviation of the mean in Y
    "timeBodyGyro-std-Z"              standard deviation of the mean in Z
    "timeBodyGyroJerkMean-X"        average duration of gyroscopic motion in X due to jerky movements 
    "timeBodyGyroJerkMean-Y"        average duration of gyroscopic motion in Y due to jerky movements           
    "timeBodyGyroJerkMean-Z"        average duration of gyroscopic motion in Z due to jerky movements           
    "timeBodyGyroJerk-std-X"          standard deviation of the mean in X 
    "timeBodyGyroJerk-std-Y"          standard deviation of the mean in Y 
    "timeBodyGyroJerk-std-Z"          standard deviation of the mean in Z 
    "timeBodyAccelerationMagnitudeMean"       average of magnitude of body acceleration
    "timeBodyAccelerationMagnitudeStdDev"      standard deviation of the mean 
    "timeGravityAccelerationMagnitudeMean"    average of magnitude of gravity acceleration
    "timeGravityAccelerationMagnitudeStdDev"    standard deviation of the mean
    "timeBodyAccJerkMagnitudeMean"            average of magnitude of the jerky motion acceleration
    "timeBodyAccJerkMagnitudeStdDev"            standard deviation of the mean
    "timeBodyGyroMagnitudeMean"               average of magnitude of the gyroscopic motion 
    "timeBodyGyroMagnitudeStdDev"               standard deviation of the mean
    "timeBodyGyroJerkMagnitudeMean"           average of magnitude of the jerky gyroscopic acceleration
    "timeBodyGyroJerkMagnitudeStdDev"           standard deviation of the mean
    "frequencyBodyAccMean-X"                  average frequency of body acceleration in X
    "frequencyBodyAccMean-Y"                  average frequency of body acceleration in Y
    "frequencyBodyAccMean-Z"                  average frequency of body acceleration in Z
    "frequencyBodyAcc-std-X"                    standard deviation of the mean in X
    "frequencyBodyAcc-std-Y"                    standard deviation of the mean in Y
    "frequencyBodyAcc-std-Z"                    standard deviation of the mean in Z
    "frequencyBodyAccJerkMean-X"              average frequency of jerky acceleration in X
    "frequencyBodyAccJerkMean-Y"              average frequency of jerky acceleration in Y
    "frequencyBodyAccJerkMean-Z"              average frequency of jerky acceleration in Z
    "frequencyBodyAccJerk-std-X"                standard deviation of the mean in X
    "frequencyBodyAccJerk-std-Y"                standard deviation of the mean in Y
    "frequencyBodyAccJerk-std-Z"                standard deviation of the mean in Z
    "frequencyBodyGyroMean-X"                 average frequency of gryoscopic acceleration in X
    "frequencyBodyGyroMean-Y"                 average frequency of gryoscopic acceleration in Y
    "frequencyBodyGyroMean-Z"                 average frequency of gryoscopic acceleration in Z
    "frequencyBodyGyro-std-X"                   standard deviation of the mean in X
    "frequencyBodyGyro-std-Y"                   standard deviation of the mean in Y
    "frequencyBodyGyro-std-Z"                   standard deviation of the mean in Z
    "frequencyBodyAccelerationMagnitudeMean"  average frequency of magnitude in body acceleration
    "frequencyBodyAccelerationMagnitudeStdDev"  standard deviation of the mean
    "frequencyBodyAccJerkMagnitudeMean"       average frequency of magnitude of jerky motion
    "frequencyBodyAccJerkMagnitudeStdDev"       standard deviation of the mean
    "frequencyBodyGyroMagnitudeMean"          average frequency of magnitude of gyroscopic motion
    "frequencyBodyGyroMagnitudeStdDev"          standard deviation of the mean
    "frequencyBodyGyroJerkMagnitudeMean"      average frequency of magnitude of jerky motion
    "frequencyBodyGyroJerkMagnitudeStdDev"      standard deviation of the mean
   
    