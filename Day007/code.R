library(readr)
library(tidyverse)
library(stringr)

###################################################
## 5월 마포구 선거 분석
### - 득표율 계산 & 스케일
### - 평균연령과 득표율 scatter plot
### - 마포구의 순위 확인 (ohmy) : 연령, 후보별 등 
### - 후보별로 하려면 대입 데이터가 동단위
### - 동단위 데이터 : 평균연령, 득표율 
###################################################

#import data
dong_age_detail <- read_csv("dong_detail_rate.csv")
rate <- read_csv("polling_rate.csv")
age <- read_csv("age.csv")
age2 <- read_csv("age2.csv")
ohmy <- read_csv("ohmy.csv") %>% 
  select(-선거구코드, -시구군코드, -기호)
winner <- read_csv("winner.csv")

colnames(ohmy) <- c("sigungu", "sido", "party", "candidate", 
                    "win", "avg_age", "age_edu", "avg_land_price", 
                    "avg_insurance","polling_rate", "polling_sore")

#reshape rate in long form
rate <- gather(rate, "candidate", "rates", 2:6, convert = TRUE) %>% 
  filter(candidate %in% c("유승민", "심상정"))
colnames(rate)[1] <- "dong"

dong_age_rate <- dong_age_detail %>% gather("category", "rate", 2:8, convert = TRUE)
age2 <- age2 %>% gather("category", "rate", 2:3, convert = TRUE)
#서울, 유승민, 심상정 group_by로 각종 지표 순위 확인
rate_index <- ohmy %>% 
  filter(candidate %in% c("유승민", "심상정"), 
                              sido == "서울") %>% 
  select(-win, -sido)


rate_index$sigungu <- str_replace(rate_index$sigungu, "서울 ", "")

#유승민, 심상정 분리
ryu <- rate_index %>% filter(candidate == "유승민")
sim <- rate_index %>% filter(candidate == "심상정")

#득표율과 나이 join
age$dong <- str_replace(age$dong, "제", "")
rate$rates <- str_replace(rate$rates, "%", "") %>% as.numeric()
age <- left_join(age, winner)
rate_age <- left_join(rate, age)

#dong_rate와 winner 결합
dong_age_rate <- left_join(dong_age_rate, winner)

# VIS1 _ 득표율 시각화 (심상정 vs. 유승민)
ggplot(rate, aes(x=dong, candidate, y=rates, fill=candidate)) + 
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  scale_fill_manual(values=c("#FFCB00", "#00B2EE")) +
  ylab("득표율(%)") +
  xlab("행정동") +
  theme_woons()

#VIS2 _ 평균연령 시각화 (심상정 vs. 유승민)
ggplot(age, aes(x=reorder(dong, -avg_age), y=avg_age, fill=winner)) + 
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  scale_fill_manual(values=c("#FFCB00", "#00B2EE")) +
  scale_y_continuous(limits = c(0,60)) +
  xlab("행정동") + 
  ylab("평균연령")
  theme_woons()
  
#VIS3 _ 연령별 구성과 당선자
ggplot(dong_age_rate, aes(x=dong, y=rate, fill=category)) +
  geom_bar(stat = "identity", position = "dodge")

ggplot(age2, aes(x=dong, y=rate, fill=category)) +
  geom_bar(stat = "identity", position = "dodge")
