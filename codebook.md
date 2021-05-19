#Codebook for Course Project

xtrain <- Reading the data of X_train.txt
ytrain <- Reading the data of Y-train.txt
trainsubjects <- Reading the data of train subjects

xtest <- Reading the data of X_test.txt
ytest <- Reading the data of Y_test.txt
testsubjects <- Reading the data of test subjects

var_names <- Reading the data of features.txt
activity_labels <- Reading the data of activity_labels.txt

Step 1: rbind the various datasets together. 

Step 2: Select names that have mean and std inside
Filter our specific columns which have those characters

Step 3: Substitute numbers in ytotal with activity_labels

Step 4: Substitute column names with the descriptive variable names

Step 5: Combine columns together and summarise mean