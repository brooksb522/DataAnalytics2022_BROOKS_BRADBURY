# Import data
EPI_data <- read.csv(file = "C:\\Users\\brook\\OneDrive\\Desktop\\Folders\\RPI Stuff\\Fall 2022\\MGMT 6600\\Lecture 2\\EPI_data.csv", header = TRUE)
head(EPI_data)

attach(EPI_data)
fix(EPI_data)
EPI <- EPI_data$EPI # Selecting EPI Column from EPI_data
EPI
tf <- is.na(EPI)
tf

# EPI Summary Stats and 5 number summary
colnames(EPI_data)
summary(EPI)
fivenum(EPI, na.rm = TRUE)

# Stem and leaf plot
stem(EPI)

# Plot histogram
hist(EPI,seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.))
rug(EPI)

# Exercise 1.1

# Plot CDF of EPI
plot(ecdf(EPI),do.points=FALSE, verticals=TRUE)

# QQ Plot of EPI
par(pty = 's')
qqnorm(EPI)
qqline(EPI)

# QQ Plot against generating dist for EPI
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)

# Exercise 1.2: Using FORESTRY

forest <- EPI_data$FORESTRY
tf_forest <- is.na(forest)
tf_forest
summary(forest)
fivenum(forest)

# Plot CDF of FOREST
plot(ecdf(forest),do.points=FALSE, verticals=TRUE)

# QQ Plot of pop7
par(pty = 's')
qqnorm(forest)
qqline(forest)

# QQ Plot against generating dist for forest
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)

# Exercise 1.3: Using DALY

DALY <- EPI_data$DALY
tf_DALY <- is.na(DALY)
tf_DALY
summary(DALY)
fivenum(DALY)

# Plot CDF of DALY
plot(ecdf(DALY),do.points=FALSE, verticals=TRUE)

# QQ Plot of DALY
par(pty = 's')
qqnorm(DALY)
qqline(DALY)

# QQ Plot against generating dist for DALY
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)

# Exercise 1.4: Comparing EPI, forest, DALY

boxplot(EPI,pop7,DALY)
qqplot(EPI,pop7)
qqplot(EPI,DALY)

# Exercise 1.5: EPI, ENVHEALTH, ECOSYSTEM, DALY, and more

EPI <- EPI_data$EPI
ENNVHEALTH <- EPI_data$ENVHEALTH
ECOSYSTEM <- EPI_data$ECOSYSTEM
DALY <- EPI_data$DALY
AIR_H <- EPI_data$AIR_H
WATER_H <- EPI_data$WATER_H
WATER_E <- EPI_data$WATER_E
BIODIVERSITY <- EPI_data$BIODIVERSITY
AIR_E <- EPI_data$AIR_E

boxplot(EPI, ENNVHEALTH, ECOSYSTEM, DALY, AIR_H, WATER_H, WATER_E, BIODIVERSITY, AIR_E,
        ylab = "Y labels", las = 2,
        names = c('EPI', 'ENNVHEALTH', 'ECOSYSTEM', 'DALY', 'AIR_H', 'WATER_H', 'WATER_E', 'BIODIVERSITY', 'AIR_E'))

