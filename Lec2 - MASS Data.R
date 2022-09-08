install.packages("MASS")
library(MASS)

?Boston

head(Boston)
summary(Boston)
colnames(Boston)
dim(Boston)
ncol <- dim(Boston)[2]
nrow <- dim(Boston)[1]
head(Boston$medv)
summary(Boston$medv)
str(Boston)
