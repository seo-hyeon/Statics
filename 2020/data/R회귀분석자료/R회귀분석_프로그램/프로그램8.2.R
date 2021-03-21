apple<-read.csv(file='d:/R선형회귀/프로그램/mcapple.csv', header=T)
attach(apple)

a<-lm(ybar~day, weights=n)   # 가중회귀
summary(a)
plot(day,ybar)
abline(a)

detach(apple)