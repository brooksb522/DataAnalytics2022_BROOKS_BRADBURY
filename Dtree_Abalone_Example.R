library(rpart)
library(rpart.plot)

head(iris)
dim(iris)

s_iris <- sample(150,100)
s_iris

iris_train <-iris[s_iris,]
iris_test <-iris[-s_iris,]
dim(iris_test)
dim(iris_train)

dectionTreeModel <- rpart(Species~., iris_train, method = "class")
dectionTreeModel
summary(dectionTreeModel)
rpart.plot(dectionTreeModel)


# abalone dataset from UCI repository
# reading the dataset from UCI repository URL
abalone <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"), header = FALSE,
                    sep = ",")

colnames(abalone) <- c("sex", "length", 'diameter', 'height', 'whole_weight', 'shucked_wieght', 'viscera_wieght', 'shell_weight',
                          'rings' )
summary(abalone)
summary(abalone$rings)
str(abalone)

# As shown above, the "rings" variable has a range between 1-29.
# This is the variable that we want to predict, and predicting this many levels
# might not give us the insight we're looking for.
# For now, we'll break the rings variable
# into 3 levels" "young" for abalones less than 8, "adult" for abalones between 8-11,
# and "old" for abalones older than 11.
abalone$rings <- as.numeric(abalone$rings)
abalone$rings <- cut(abalone$rings, br=c(-1,8,11,35), labels = c("young", 'adult', 'old'))
abalone$rings <- as.factor(abalone$rings)
summary(abalone$rings)

# remove the "sex" variable in abalone, because KNN requires all numeric variables for prediction
# z <- abalone
aba <- abalone
aba$sex <- NULL