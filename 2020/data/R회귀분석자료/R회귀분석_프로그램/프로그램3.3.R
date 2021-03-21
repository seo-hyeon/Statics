##  Simple Linear Regression    ##
 volumn = c(412, 953, 929, 1492, 419, 1010, 595, 1034)
 weight = c(250, 700, 650, 975, 350, 950, 425, 725)
 book.lm = lm(weight ~ volumn )    # weight = alpha + beta*volumn 
 summary(book.lm)
 par(mfrow=c(2,2))                   # ±×¸² 3.6
 plot(volumn, weight)                # scatterplot
 lines(volumn, book.lm$fitted.values)
 plot( book.lm, which=1)
 plot( book.lm, which=2, pch=16)