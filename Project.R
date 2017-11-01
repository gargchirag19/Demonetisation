library(ggplot2)
library(MASS)
attach(Demon)

row <- which(age == 1130)
Demon1 <- Demon[-47,]
attach(Demon1)

Demonitisation[Demonitisation == 'not Yes'] <- 'No

v_1to21 = sqldf("SELECT COUNT(*) FROM Demon WHERE age BETWEEN 1 AND 21 AND Demonitisation LIKE 'Yes'")

v_22to60 = sqldf("SELECT COUNT(*) FROM Demon WHERE age BETWEEN 22 AND 60 AND Demonitisation LIKE 'Yes'")

v_61to150 = sqldf("SELECT COUNT(*) FROM Demon WHERE age BETWEEN 61 AND 150 AND Demonitisation LIKE 'Yes'")

vn_1to21 = sqldf("SELECT COUNT(*) FROM Demon WHERE age BETWEEN 1 AND 21 AND Demonitisation LIKE 'No'")

vn_22to60 = sqldf("SELECT COUNT(*) FROM Demon WHERE age BETWEEN 22 AND 60 AND Demonitisation LIKE 'No'")

vn_61to150 = sqldf("SELECT COUNT(*) FROM Demon WHERE age BETWEEN 61 AND 150 AND Demonitisation LIKE 'No'")

v_1to21p <- (v_1to21/(v_1to21 + vn_1to21))*100

v_22to60p <- (v_22to60/(v_22to60 + vn_22to60))*100

v_61to150p <- (v_61to150/(v_61to150 + vn_61to150))*100

sup_per <- c(v_1to21p, v_22to60p, v_61to150p)

cbind(Demon, fill = sup_per)

category <- cut(Demon$age, c(-1,21,60,150), labels = c("Teenager", "Adult", "Old"))

Demon2 <- cbind(Demon, category)

graph <- qplot(data = Demon2, x = Demon2$category, fill = Demon2$Demonitisation, geom = "bar")
