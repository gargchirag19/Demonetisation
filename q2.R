library(ggplot2)
library(MASS)

data<- read.csv("Demon.csv", header = T)
attach(data)

mm<-mean(monthly.income)
varm<-var(monthly.income)
lambda<- mm/varm
alpha<-lambda*mm

six1<-quantile(monthly.income,c(.60))

den <- density(monthly.income)
dat <- data.frame(x = den$x, y = den$y)
g1<-ggplot(data = dat, aes(x = x, y = y)) + geom_point(size = 1, color="red") +theme_classic()

newg<- rgamma(368, alpha, lambda)
six2<- quantile(newg,c(.60))

den2<- density(newg)
dat2<- data.frame(x = den2$x, y = den2$y)
g2<- ggplot(data = dat2, aes(x = x, y = y)) + geom_point(size = 1, color="blue") +theme_classic()
overlay <- ggplot(data = dat2, aes(x = x, y = y)) + geom_line(data=dat, size = 1, color="red") + geom_line(size = 1, color="blue") +theme_classic()
overlay2 <- ggplot(data = dat2, aes(x = x, y = y)) + geom_point(data=dat, size = 1, color="red") + geom_point(size = 1, color="blue") +theme_classic()
