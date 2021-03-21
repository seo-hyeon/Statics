library(car)
fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)   # OLS fit
summary(fit)

# Assessing Outliers
outlier.test(fit)            # Bonferonni p-value for most extreme obs
qq.plot(fit, main="QQ Plot")   # qq plot for studentized resid
h <- hat(model.matrix(fit))
plot(h, type = "h", xlab="case index", main="leverage plot")
                              # leverage plots  그림 5.4
# Influential Observations
avPlots(fit,  ask=FALSE)       # added variable plots 그림 5.5

# Cook's D plot  : identify D values > 4/(n-k-1)  # 그림 5.6
cutoff <- 4/((nrow(mtcars)-length(fit$coefficients)-2)) 
plot(fit, which=4, cook.levels=cutoff)    

# Influence Plot  # 그림 5.7
influencePlot(fit, main="Influence Plot",
    sub="Circle size is proportial to Cook's Distance" )

# Normality of Residuals       # 그림 5.8
qqPlot(fit, main="QQ Plot")    # t 분포 Q-Q plot for studentized resid

# distribution of studentized residuals
library(MASS)
sresid <- studres(fit) 
hist(sresid, freq=FALSE, main="Distribution of Studentized Residuals")
xfit<-seq(min(sresid),max(sresid),length=40) 
yfit<-dnorm(xfit) 
lines(xfit, yfit) 

# Evaluate homoscedasticity
ncvTest(fit)     # non-constant error variance test

# plot studentized residuals vs. fitted values 
spread.level.plot(fit)    # 그림 5.9
ls.diag(fit)  # diagnostics statistics