# read data in
library(class)
library(naivebayes)
library(dplyr)

aba<-read.csv("C:/Users/brook/OneDrive/Desktop/Folders/RPI Stuff/Fall 2022/MGMT 6600/Class Data/abalone.csv")
aba$Sex[aba$Sex == 'F'] <- 0
aba$Sex[aba$Sex == 'M'] <- 1
aba$Sex[aba$Sex == 'I'] <- 2
head(aba)

naba<-dim(aba)[1]
#90% to train
sampling.rate=0.9
#remainder to test
num.test.set.labels=naba*(1.-sampling.rate)
#construct a random set of training indices (training)
training <-sample(1:naba,sampling.rate*naba, replace=FALSE)
#build the training set (train)
train<-subset(aba[training,],select=c("Sex","Length","Diameter","Height","Whole.weight","Shucked.weight","Viscera.weight","Shell.weight"))
#construct the remaining test indices (testing)
testing<-setdiff(1:naba,training)
#define the test set
test<-subset(aba[testing,],select=c("Sex","Length","Diameter","Height","Whole.weight","Shucked.weight","Viscera.weight","Shell.weight"))
#construct labels for another variable (Rings) in the training set
crings<-aba$Rings[training]
#construct true labels the other variable in the test set
true.labels<-aba$Rings[testing]
#run the classifier, can change k

classif<-knn(train,test,crings,k=5)
#view the classifier
classif
#looks at attributes
attributes(.Last.value)

#now do bayes.

#create an age column
train1 <- aba %>%
  mutate(age=case_when(
    rings %in% 1:13 ~ "young",
    rings %in% 14:30 ~ "old"
  ))
#convert AGE into factor
train1$age <- as.factor(train1$age)

bayes2 <- naive_bayes(Rings ~., data = train1)
bayes2