op=par(mfrow=c(1,3))
 x=seq(1,30)
 y=x+rnorm(30)
 lmr=lm(y~x)
 plot(x,y, pch=16,  ann = par("ann"))
 lines(x,lmr$fitted.values)

 cor(x,y)

 x=seq(1,30)
 y=-x+rnorm(30)
 lmr=lm(y~x)
 plot(x,y, pch=16,  ann = par("ann"))
 lines(x,lmr$fitted.values)

 cor(x,y)

 x=seq(1,30)
 y=rnorm(30, 0, 0.5)
 lmr=lm(y~x)
 plot(x,y, pch=16,  ann = par("ann"))
 lines(x,lmr$fitted.values)

 cor(x,y)

par(op)

data(cars)
cars
attach(cars)
plot(speed, dist)
cor(speed, dist)
cor.test(speed, dist)
