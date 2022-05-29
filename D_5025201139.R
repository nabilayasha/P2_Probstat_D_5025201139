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
#A
mu = 20000
n = 100
xbar = 23500
sd = 3900

tsum.test(mean.X = xbar, s.X = sd, n.X = n,
          alternative = "greater", mu0 = mu,
          conf.level = 0.95,  var.equal =  TRUE)
