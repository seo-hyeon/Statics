data(longley)
y=longley$GNP           # 반응변수
x1=longley$Unemployed; x2=longley$Population ; x3=longley$Armed.Forces
mydata<-data.frame(y, x1,x2,x3)       
fit <- lm(y ~ x1 + x2 + x3, data=mydata)
summary(fit)             # show results

coefficients(fit)           # model coefficients
confint(fit, level=0.95)    # CIs for model parameters 
fitted(fit)                # predicted values
residuals(fit)             # residuals
anova(fit)                # anova table 
vcov(fit)             # covariance matrix for model parameters 
influence(fit)         # regression diagnostics 
ls.diag(fit)   

# Residual Diagnostic plots 
layout(matrix(c(1,2,3,4), 2,2))  # optional 4 graphs/page 
plot(fit)                     # 그림 5.13