# dplyr::summarise에서 n_distinct와 n 함수의 차이점
library(tidyverse)

#샘플데이터 제작
airport <- c("김해", "김해", "김포", "김포", "대구", "대구",
             "김해", "김포", "김포", "인천", "인천", "인천")

airlines <- c("대한항공", "아시아나", "대한항공", "아시아나",
              "대한항공", "아시아나", "대한항공", "에어차이나", "대한항공", "에어인디아", "대한항공", "에어프랑스")

value <- c(3,2,4,2,9,3,
           5,2,1,10,14,3)

#데이터프레임 완성
sample <- tibble(airport, airlines, value)

#-------------------------------------------------------

#공항별로 가지는 항공사의 종류를 구할땐 n_distinct
sample %>% 
  group_by(airport) %>% 
  summarise(n = n_distinct(airlines))

#공항별 변수 구분없이 모든 항공사의 카운팅
sample %>% 
  group_by(airport, airlines) %>% 
  summarise(n = n())
