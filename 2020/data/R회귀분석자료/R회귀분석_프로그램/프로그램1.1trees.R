# ¿¹ 1.1 trees data initial data analysis

trees$Girth[trees$Girth==0]<-NA
trees$Height[trees$Height==0]<-NA
trees$Volume[trees$Volume==0]<-NA

par(mfrow=c(1,3))
boxplot(trees$Girth, xlab="Girth")
boxplot(trees$Height,xlab="Height")
boxplot(trees$Volume,xlab="Volume")

par(mfrow=c(1,3))
hist(trees$Girth, xlab="Girth")
hist(trees$Height,xlab="Height")
hist(trees$Volume,xlab="Volume")

par(mfrow=c(1,3))
plot(density(trees$Girth), main="kernel density est for Girth")
plot(density(trees$Height), main="kernel density est for Height")
plot(density(trees$Volume), main="kernel density est for Volume")

plot(sort(trees$Volume), pch="*")

par(mfrow=c(1,3))
qqnorm(trees$Girth, main="NormalQ-Q plot for Girth")
  qqline(trees$Girth)
qqnorm(trees$Height, main="NormalQ-Q plot for Height")
  qqline(trees$Height)
qqnorm(trees$Volume, main="NormalQ-Q plot for Volume")
  qqline(trees$Volume)

library(lattice)
splom(trees)    #scatterplot matrix
