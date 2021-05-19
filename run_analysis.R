s <- function() {
  
  #The main directory
  list.files("./UCI HAR Dataset/")
  
  library(dplyr)
  
  # reading train data into tables
  xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  # reading test data into tables
  xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  # reading data description (561 elements)
  var_names <- read.table("./UCI HAR Dataset/features.txt")
  
  # read activity labels (6 elements)
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  
  # STEP 1: Merging the training and the test sets to create one data set.
  xtotal <- rbind(xtrain, xtest)
  ytotal <- rbind(ytrain, ytest)
  totalsubjects <- rbind(trainsubjects, testsubjects)
  
  # STEP 2: Extracting measurements on mean and s.d for each measurement
  meanstd <- var_names[grep("mean\\(\\)|std\\(\\)", var_names[,2]),]
  extract <- xtotal[, meanstd[,1]]
  
  # STEP 3: Naming activities in data set
  colnames(ytotal) <- "activity"
  ytotal$activitylabel <- factor(ytotal$a, labels = as.character(activity_labels[,2]))
  Namedactivities <- ytotal[,-1]
  
  #STEP 4: Label with descriptive var names
  colnames(xtotal) <- var_names[meanstd[,1],2]
  
  #STEP 5
  colnames(totalsubjects) <- "subs"
  everything <- cbind(xtotal, Namedactivities, totalsubjects)
  meanseverything <- everything %>% group_by(Namedactivities, subs) %>% summarize_each(list(mean))
  write.table(meanseverything, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
  
}