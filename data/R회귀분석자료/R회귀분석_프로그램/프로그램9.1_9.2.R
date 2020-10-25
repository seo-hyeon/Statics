library(HSAUR)
data("clouds", package = "HSAUR")
attach(clouds)
seeding<-as.numeric(clouds$seeding)-1              # yes=1  no=0  가변수 생성
echomotion<-as.numeric(clouds$echomotion)-1      # stationary=1  moving=0  

ra<- lm(rainfall~ seeding  + sne  )           # 가변수 seeding 포함
summary(ra)
grid<-seq(1,5, by=0.5)
seed1<- ra$coefficients[[1]]+ra$coefficients[[2]] +ra$coefficients[[3]]*grid
seed0<- ra$coefficients[[1]]+ra$coefficients[[3]]*grid

plot(sne, rainfall, pch=seeding, sub="seeding : yes or no")   #그림 9.2(a)
legend(2.7,11, c("seeding=yes" ,"seeding=no"), pch=c(1,0))          
lines(grid, seed1, lty=1)
lines(grid, seed0, lty=2)

ra<- lm(rainfall~ echomotion   + sne  )       # 가변수 echomotion 포함
summary(ra)
grid<-seq(1,5, by=0.5)
echo1<- ra$coefficients[[1]]+ra$coefficients[[2]] +ra$coefficients[[3]]*grid
echo0<- ra$coefficients[[1]]+ra$coefficients[[3]]*grid

plot(sne,rainfall, pch=echomotion+2, sub="echomotion : 1(st) or 0(mov)")  #그림 9.2(b)
legend(2.7,11, c("echo=stationary", "echo=moving"), pch=c(3,2))          
lines(grid, echo1, lty=1)
lines(grid, echo0, lty=2)



# interaction term of seeding
ra<- lm(rainfall~ seeding  + sne  + seeding:sne)
summary(ra)
grid<-seq(1,5, by=0.5)
seed1<-ra$coefficients[[1]]+ra$coefficients[[2]]
      +ra$coefficients[[3]]*grid+ra$coefficients[[4]]*grid
seed0<- ra$coefficients[[1]]+ra$coefficients[[3]]*grid

plot(sne, rainfall, pch=seeding, sub="suitability for seeding")    #그림 9.3
   legend(2.7,11, c("seeding=yes" ,"seeding=no"), pch=c(1,0), lty=c(1,2))          
lines(grid, seed1, lty=1)
lines(grid, seed0, lty=2)

# interaction term of echomotion
ra<- lm(rainfall~ echomotion  + sne  + echomotion:sne)
