library(car)
data(mtcars);  attach(mtcars)
mtcars[1:3,]    # data

fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)   # OLS fit
summary(fit)

# residuals
par(mfrow=c(1,2))   # 그림 5.3
plot(mpg, rstandard(fit), ylim=c(-2,2.5), pch="*",main="standadized residual")
plot(mpg, rstudent(fit), ylim=c(-2,2.5), pch="*",main="studentized residual")

dffits(fit)   # DFFITS

# influece measure
inflm.fit <- influence.measures(fit)
which(apply(inflm.fit$is.inf, 1, any))
     # which observations 'are' influential: 영향점만 출력
summary(inflm.fit)   # only these
inflm.fit            # all 모든 경우에 대해 영향점 관련 통계량 출력