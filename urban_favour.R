data<- read.csv("Demon.csv", header = T)
attach(data)
x1<- c(nrow(data[data$Urban == "TRUE" & data$Demonitisation == "Yes",]),nrow(data[data$Urban == "TRUE" & data$Demonitisation == "No",]))
x2<-c(nrow(data[data$Urban == "FALSE" & data$Demonitisation == "Yes",]),nrow(data[data$Urban == "FALSE" & data$Demonitisation == "No",]))
#x3<-c(nrow(data[data$Urban == "NA" & data$Demonitisation == "Yes",]),nrow(data[data$Urban == "NA" & data$Demonitisation == "No",]))

y<- c("In favour","Against")
#y2<- c("In favour","Against")
#y3<- c("NA in favour","NA against")

pct1 <- round(x1/sum(x1)*100)
pct1 <- paste(pct1,"%",sep="")

pct2 <- round(x2/sum(x2)*100)
pct2 <- paste(pct2,"%",sep="")

#pct3 <- round(x3/sum(x3)*100)
#pct3 <- paste(pct3,"%",sep="")

names(x1)<- pct1
names(x2)<- pct2
#names(x3)<- pct3

colors<-c("brown", "violetred1")

split.screen( figs = c( 1, 2 ) )
screen(1)
pie(x1, radius = 0.9, col = colors, main="In urban areas")
legend("bottom",y, cex=0.5, fill = colors)
screen(2)
pie(x2, radius = 0.9, col = colors, main="In rural areas")
legend("bottom",y, cex=0.5, fill = colors)
#pie(x3, radius = 0.9, col = colors, main="People in favour/against demonitisation in urban/rural areas")


