library(dplyr)

## read test/training files
xtst <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytst <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtrn <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrn <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subtrn <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## bind columns for x/y pairs
Test <- bind_cols(xtst, ytst, subtest)
  names(Test)[562] <- "V562"
  names(Test)[563] <- "V563"
Train <- bind_cols(xtrn, ytrn, subtrn)
  names(Train)[562] <- "V562"
  names(Train)[563] <- "V563"
Mrgd <- bind_rows(Test, Train)

## read feature list & activity names; apply features list as column names, 
hdrs <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
names(act_labels) <- c("ActivityID", "ActivityName")
names(Mrgd) <- hdrs$V2
names(Mrgd)[562] <- "ActivityID"
names(Mrgd)[563] <- "SubjectID"

## isolate columns with mean() & std() values & join activity labels
Msds <- Mrgd[, c(grep("mean()",names(Mrgd), fixed=TRUE), 
                 grep("std()", names(Mrgd), fixed=TRUE), 562:563)] %>%
  inner_join(act_labels)

## group by subject & activity; means of all variables to single dataset
subs <- group_by(Msds, SubjectID, ActivityName)
means <- subs %>% summarise_each(funs(mean), -ActivityID)

## write to table
write.table(means, "tidyset.txt", row.names = FALSE)


