library(lars)
data(longley)
attach(longley)
 
y <-longley[,6]    #Employed
x <-cbind(GNP.deflator, GNP,Unemployed,Armed.Forces,Population)

lm.g<- lm(y~GNP.deflator+GNP+Unemployed+Armed.Forces+Population,
               data=longley)
coef(lm.g)
object1 <- lars(x, y, type="lasso", trace=TRUE)

par(mfrow=c(1,2))
plot(object1, xvar="norm", lwd=2, lty=1:5, breaks=F, col=1:5)
plot(object1, xvar="norm", lwd=2, lty=1:5, breaks=T, col=1:5)
coeffs <- coef(object1)
coeffs

object1
object1$R2

coef1 <- object1$beta   ### Get rid of many zero coefficients
coef1 <- scale(coef1, center=FALSE, 1/object1$normx)
coef1
s1 <- apply(abs(coef1), 1, sum)
s1/max(s1)


