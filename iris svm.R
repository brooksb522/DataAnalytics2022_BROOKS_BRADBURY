data("iris")
head(iris)
str(iris)

library(ggplot2)
library(e1071)

qplot(Petal.Length, Petal.Width, data = iris, color = Species)


help("svm")
svm_model1 <- svm(Species~., data = iris)
summary(svm_model1)

qplot(Sepal.Length, Sepal.Width, data = iris, color = Species)

pred1 <- predict(svm_model1,iris)

table1 <- table(Predicted = pred1, actual = iris$Species)
table1

plot(svm_model1, data = iris,
     Petal.Width~Petal.Length, slice =
       list(Sepal.Width = 3, Sepal.Length = 4))


Model1_AccuracyRate = sum(diag(table1))/sum(table1)
Model1_AccuracyRate