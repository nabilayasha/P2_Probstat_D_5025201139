#No1
n <- c(1,2,3,4,5,6,7,8,9)
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)

#A
data <- data.frame(n,X,Y)
standardev <- sd(x-y)
print(standardev)

#B
t.test(X, Y, alternative = "greater", var.equal = FALSE)

#C. 
var.test(X, Y)
t.test(X, Y, var.equal = TRUE)

#No2

#b
mu = 20000
n = 100
xbar = 23500
sd = 3900

tsum.test(mean.x = 23500, s.x = 3900, n.x = 100,
          alternative = "greater", mu = 20000,
          conf.level = 0.95,  var.equal =  TRUE)

#3
#b
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79, s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

#c
df <- 2
plotDist(dist = 't', df = df)

#d
qt(p = 0.05, df = 2, lower.tail = FALSE)

#4
#a
myFile  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")) 
dim(myFile)
head(myFile)

myFile$Group <- as.factor(myFile$Group)
myFile$Group = factor(myFile$Group,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih"))

class(myFile$Group)

group1 <- subset(myFile, Group=="Kucing Oren")
group2 <- subset(myFile, Group=="Kucing Hitam")
group3 <- subset(myFile, Group=="Kucing Putih")

#b
bartlett.test(Length~Group, data=dataoneway)

#c
qqnorm(grup1$Length)
qqline(grup1$Length)

#e
model1 <- lm(Length~Group, data=myFile)

anova(model1)

TukeyHSD(aov(model1))

#f
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
