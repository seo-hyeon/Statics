data(airquality)
airquality[1:3,]

pairs(airquality[,1:4], panel=panel.smooth)

lm.a<- lm(Ozone~ Solar.R + Wind + Temp, data=airquality)
summary(lm.a)
lm.ab<- lm(log(Ozone)~ Solar.R + Wind + Temp, data=airquality)
summary(lm.ab)

op=par(mfrow=c(1,2))
plot(fitted(lm.a), residuals(lm.a), xlab="fitted", ylab="residual")
plot(fitted(lm.ab), residuals(lm.ab), xlab="fitted", ylab="residual")
abline(h=0)
par(op)

shapiro.test(residuals(lm.a)) 
shapiro.test(residuals(lm.ab))

library(lmtest)
dwtest(Ozone~ Solar.R + Wind + Temp, data= na.omit(airquality))
dwtest(log(Ozone)~ Solar.R + Wind + Temp, data= na.omit(airquality))



confint(lm.ab)                    # 95% CI
coef(lm.ab)                       # parameter coeff

library(ellipse)
op=par(mfrow=c(1,3))
plot(ellipse(lm.ab,c(2,3)), type="l")
   points(coef(lm.ab)[2], coef(lm.ab)[3], pch=18)
   abline(v=confint(lm.ab)[2,], lty=2)
   abline(h=confint(lm.ab)[3,], lty=2)
plot(ellipse(lm.ab,c(2,4)), type="l")
    points(coef(lm.ab)[2], coef(lm.ab)[4], pch=18)
plot(ellipse(lm.ab,c(3,4)), type="l")
     points(coef(lm.ab)[3], coef(lm.ab)[4], pch=18)
par(op)

x0<- data.frame(Solar.R=170, Wind=8, Temp=70, Month=0, Day=0)
x0
predict(lm.ab, x0,interval="confidence")
predict(lm.ab, x0,interval="prediction")

conf<-predict(lm.ab, airquality,interval="confidence")
matplot( seq(1,length(conf[,1])), conf,type="lll", lty=c(1,2,2))

pred<-predict(lm.ab, airquality,interval="prediction")