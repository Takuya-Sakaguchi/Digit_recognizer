
library(randomForest)
library(readr)

set.seed(0)

train <- read_csv("train.csv")
test <- read_csv("test.csv")


labels <- as.factor(unlist(train[,c("label")]))
train <- train[,-1]

rf <- randomForest(train, labels, xtest=test, ntree=25)
predictions <- data.frame(ImageId=1:nrow(test), Label=levels(labels)[rf$test$predicted])
head(predictions)

write_csv(predictions, "R-randomforest.csv") 