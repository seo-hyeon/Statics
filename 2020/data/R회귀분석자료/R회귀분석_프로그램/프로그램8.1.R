#physics data
x<-c(0.345,0.287,0.251,0.225,0.207,0.186,0.161,0.132,0.084,0.060)
y<-c(367,311,295,268,253,239,220,213,193,192)
w<-c(17, 9, 9, 7, 7, 6, 6, 6, 5, 5)

a<-lm(y~x, weights=w^(-1))         # 가중회귀식
plot(x,y)
abline(a)

a2<-lm(y~x+I(x^2), weights=w^(-1) )
plot(x,y)
lines(x,a2$fitted.values)

matplot(x, cbind(y,a$fitted.values, a2$fitted.values), 
        type="pll", pch="*", lty=c(1,2), ylab="y", las=1)  #그림 8.1