twin<-read.csv(file='d:twin.csv', header=T)
attach(twin)
plot(X,Y, pch=c(1,2,3))    # 산점도
 legend(110,80, c("A1=1" ,"A2=1", "A3=1"), pch=c(1,2,3))
   
a<-lm(Y~A1+A2+X)                # 모형1
summary(a)
  anova(a)

grid<-seq(60,140, by=4)
a1<-a$coefficients[[1]]+a$coefficients[[2]]+a$coefficients[[4]]*grid
a2<-a$coefficients[[1]]+a$coefficients[[3]]+a$coefficients[[4]]*grid
a3<-a$coefficients[[1]]+a$coefficients[[4]]*grid

plot(X,Y, pch=c(1,2,3), sub="(a)")
   legend(100,80, c("A1=1" ,"A2=1", "A3=1"), lty=c(1,2,3))        
lines(grid, a1, lty=1)
lines(grid, a2, lty=2)
lines(grid, a3, lty=3)

b<-lm(Y~A1+A2+X + A1:X + A2:X)   # 모형2
summary(b) 
  anova(b)
grid<-seq(60,140, by=4)
b1<-coef(b)[[1]]+coef(b)[[2]]+(coef(b)[[5]]+coef(b)[[4]])*grid
b2<-coef(b)[[1]]+coef(b)[[3]]+(coef(b)[[6]]+coef(b)[[4]])*grid
b3<-coef(b)[[1]]+coef(b)[[4]]*grid

plot(X,Y, pch=c(1,2,3), sub="(b)")
   legend(100,80, c("A1=1" ,"A2=1", "A3=1"), lty=c(1,2,3))        
lines(grid, b1, lty=1)
lines(grid, b2, lty=2)
lines(grid, b3, lty=3)