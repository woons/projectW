library(tidyverse)

murders_separate <- read.csv("murders_separate.csv", stringsAsFactors = F, encoding = "utf-8")
dim(murders_separate)
names(murders_separate)

#Line Chart 만들기
ggplot(subset(murders_separate, murders > 200), # dplyr에서 filter 굳이 미리 쓰지 않아도 됨
       aes(x=year, y=murders, group=city, color=city)) +  
  geom_line() + 
  scale_x_continuous(breaks=c(2014,2015)) + # x축 break 설정 
  facet_wrap(~city) + # city를 기준으로 facet_wrap 설정
  labs(title = "Murder change between 2014 and 2015") +
  theme_woons()



