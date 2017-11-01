library(ggplot2)
Demon=read.csv(file.choose(), header = T)
attach(Demon)

row <- which(age == 1130)
Demon1 <- Demon[-47,]
attach(Demon1)

Demonitisation[Demonitisation == 'not Yes'] <- 'No'
Demon2 <- Demon1[,-8]
Demon3 <- cbind(Demon2, Demonitisation)


categoryinc <- cut(monthly.income, c(-1,30000,100000,500000), labels = c("Poor","Middle","Rich"))

Demon4 <- cbind(Demon3, categoryinc) 

#Queries

# 1. no of people in support and against of demonitisation income wise
q1 <- qplot(x = Demonitisation, data = Demon4, fill = categoryinc, geom="bar") 

# 2. co-relation between income and demonitisation

q2 <- qplot(data=Demon4[categoryinc=='Poor',], x=Residence) +geom_bar(aes(fill=Demonitisation))


q3 <- qplot(data=Demon4[categoryinc=='Middle',], x=Residence) +geom_bar(aes(fill=Demonitisation))

q4 <- qplot(data=Demon4[categoryinc=='Rich',], x=Residence) +geom_bar(aes(fill=Demonitisation))
