# EPI_2010 <- read.csv(file = "C:\\Users\\brook\\OneDrive\\Desktop\\Folders\\RPI Stuff\\Fall 2022\\MGMT 6600\\Lecture 3\\2010EPI_data.csv", header = TRUE)
# head(EPI_2010)
# 
# names(EPI_2010) <- EPI_2010[1,]
# EPI_2010 <- EPI_2010[-1,]
# 
# attach(EPI_2010)
# fix(EPI_2010)
# EPI10 <- EPI_2010$EPI # Selecting EPI Column from EPI_2010
# EPI
# tf <- is.na(EPI10)
# tf
# 
# # EPI Summary Stats and 5 number summary
# colnames(EPI_2010)
# summary(EPI10)
# fivenum(EPI10, na.rm = TRUE)
# 
# # Stem and leaf plot
# stem(EPI10)

EPI_data <- read.csv(file = "C:\\Users\\brook\\OneDrive\\Desktop\\Folders\\RPI Stuff\\Fall 2022\\MGMT 6600\\Lecture 2\\EPI_data.csv", header = TRUE)
head(EPI_data)

attach(EPI_data)
fix(EPI_data)
EPI <- EPI_data$EPI # Selecting EPI Column from EPI_data
EPI
tf <- is.na(EPI)
tf

plot(ecdf(EPI),do.points=FALSE,verticals = TRUE)
plot(ecdf(EPI),do.points=TRUE,verticals = TRUE)

qqnorm(EPI)
qqline(EPI)

x <- seq(30,95,1)
x
x2 <-seq(30,95,2)
x2
x2 <-seq(30,96,2)
x2
qqplot(qt(ppoints(250),df=5),x, xlab = "Q-Q plot")
qqline(x)

boxplot(EPI, EPI_data$DALY)
