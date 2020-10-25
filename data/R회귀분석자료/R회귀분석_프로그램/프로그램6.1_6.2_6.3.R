data(longley) ;  attach(longley)
y<- longley$GNP
x1<-longley$Unemployed ; x2=longley$Population ; x3=longley$Armed.Forces
mydata<-data.frame(y, x1,x2,x3)
fit <- lm(y ~ x1 + x2 + x3, data=mydata)
summary(fit)    # show results

# For a more comprehensive evaluation of model fit see regression diagnostics. 
fit1 <- lm(y ~ x1 + x2 + x3 , data=mydata)
fit2 <- lm(y ~ x1 + x2)
anova(fit1, fit2) 


# Stepwise Regression
 library(MASS)
fit <- lm(y~x1+x2+x3,data=mydata)
step <- stepAIC(fit, direction="both")
step$anova # display results 




# All Subsets Regression
 library(leaps)
ls<-regsubsets(y~x1+x2+x3, data=mydata, nbest=7)
summary(ls)   # view results 
     # plot a table of models showing variables in each model.
     # models are ordered by the selection statistic.
x<-cbind(x1,x2,x3)
lp<-leaps(x,y, method="Cp")     #leaps() 사용
lp                # 모형별 Cp values

 library(car)
subsets(ls, statistic="rsq")    # 그림 6.3 
subsets(ls, statistic="cp")     # click to view  그림 6.4
plot(ls, scale="r2")          # plot statistic by subset size  그림 6.5