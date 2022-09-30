# Creating a matrix with random numbers
# and plotting the matrix using the image() function
set.seed(12345)
help(par) 
# par can we used to set graphical parameters
# Parameters can be set by specifying them as arguments
# to par in tag = value form, or by passing them as a list of tagged values
par(mar = rep(0.2,4)))
data_Matrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(data_Matrix)[,nrow(data_Matrix):1])

par(mar = rep(0.2,4))
heatmap(data_Matrix)
# When we run the heatmap() here, we get dendrograms printed on both columns and ros and still there
# is still no real emerging pattern, 
# This is because there is no pattern in the data we generated

set.seed(678910)
for (i in 1:40){
  coin_flip <- rbinom(1,1,0.5)
  if(coin_flip){
    data_Matrix[i,] <- data_Matrix[i,] + rep(c(0,3), each = 5)
  }
}

# What I did here was I looped through all the rows and on a random row, flipped a coin
# during the coin flip, if it turns out to be one (true) then, just added a pattern to my data in a
# way that the five of the columns have a mean
# of zero and others have mean of three

par(mar= rep(0.2, 4))
image(1:10, 1:40, t(data_Matrix)[, nrow(data_Matrix):1])

par(mar=rep(0.2, 4))
heatmap(data_Matrix)

hh <- hclust(dist(data_Matrix))
data_Matrix_Ordered <- data_Matrix[hh$order,]
par(mfrow = c(1,3))
image(t(data_Matrix_Ordered)[, nrow(data_Matrix_Ordered):1])
plot(rowMeans(data_Matrix_Ordered), 40:1, xlab='The Row Mean', ylab='Row',pch = 19)
plot(colMeans(data_Matrix_Ordered), xlab='Column', ylab='Column Mean',pch = 19)

