# 세션 정보/필요한 패키지
sessionInfo()

library(tidyverse)
library(tidymodels)

DF <- read_csv('C:/Users/nabib/Documents/GitHub/Statics/DataMining/0309/sample.csv') # (기본) read.csv
DF

# 변수
# 이산형(셀 수 있는 숫자), 연속형(셀 수 없는 숫자)
# 키, 체중 = 연속형, 성별 = 문자(R에서 처리 못함)
# 성별을 이산형으로 변환 (factor화)
# bmi = wt(kg) / ht(m)^2  변수 추가

DF <- mutate(DF,
       sx = factor(sx),
       bmi = wt / (ht / 100)^2)  # DF 데이터에 있는 성별을 factor로 변환한 후 저장

# 파이프 %>%
# A %>% B => 함수 B의 첫번째 인수로  A를 사용 => B(A)

DF <- DF %>% mutate(sx = factor(sx),
                    bmi = wt / (ht / 100)^2)

# 기초통계
summary(DF)  # factor 변수는 빈도를 알려줌.

# 성별 기초통계
DF %>% 
  group_by(sx) %>% 
  summarize(mnht=mean(ht), 
            mnwt=mean(wt), 
            mnbmi=mean(bmi))

# 성별 표준편차
DF %>%
  group_by(sx) %>%
  summarize(sdht = sd(ht),
            sdwt = sd(wt),
            sdbmi = sd(bmi))

# 성별 빈도
table(DF$sx)
xtabs(~sx, data=DF)

# 시각화
# 쓰는 방식: ggplot() + geom_????()
# ggplot: 사용할 데이터 명시, geom_????(): 그림 모양 지정

# 산점도
ggplot(DF, aes(x=wt, y=ht)) + geom_point()
ggplot(DF, aes(x=wt, y=ht, col=sx, shape=sx)) + geom_point() #성별에 따라 색, 모양 바꿈

# 상자그림
ggplot(DF, aes(x=sx, y=ht)) + geom_boxplot()

       