install.packages("ISLR")
library(ISLR)
data(Auto)
head(Auto)
colnames(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg) # min lowerQ median upperQ max

hist(Auto$mpg)
boxplot(Auto$mpg)