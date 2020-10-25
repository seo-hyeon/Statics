x<-c(1, 2, 3, 4, 5, 6, 7, 8)
y<-c(1, 1.2, 1.8, 2.0, 3.8, 4.3, 6.5, 9.0)

mouse.lm = lm(y ~ x + I(x^2) )   
summary(mouse.lm)

plot(x, y)                     # scatterplot ±×¸² 4.4
 lines(x, mouse.lm$fitted.values)