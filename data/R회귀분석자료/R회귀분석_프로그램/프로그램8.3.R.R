data(longley)
attach(longley)

g<-lm(Employed ~ GNP + Population, data=longley)
summary(g)
cor(GNP, Population)
cor(residuals(g)[-1],residuals(g)[-16]) 

library(nlme)        # nonlinear model
gl<-gls(Employed~GNP+Population,correlation=corAR1(form=~Year), data=longley)
                    #generalized least squares method
summary(gl)
intervals(gl)