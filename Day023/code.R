# library needed
# install.packages(c("tidyverse", "stringr", "ggrepel"))
library(tidyverse)
library(stringr)
library(ggrepel)

#--------------------------------------------------
# R ggplot2 + Guide to Information Graphics (WSK)
#--------------------------------------------------

#sample data set1
animal <- c("Dog", "Cat", "Monkey", "Chicken", "Duck", "Tiger", "Lion")
value <- sample(100, length(animal), replace = TRUE)
category <- c("house", "house", "outside", "outside", "outside", "outside", "outside")
myanimal <- data.frame(animal, value, category)

#sample data set2
year <- seq(1990, 2017, 5) %>% 
  rep(6)
year <- sort(year)
price <- sample(100, length(year), replace = TRUE)

company <- c("KOREA", "USA", "CHINA", "JAPAN", "INDIA", "FRANCE") %>% 
  rep(6)
label <- rep(c(1,2,2,2,2,2),6)
stocks <- data.frame(year, price, company,label)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# basic bar chart
# - Y축 스케일 범위
# - ticks 설정, 차트 제목
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
basic.bar <- ggplot(myanimal, aes(x= reorder(animal, -value), y=value, fill=category)) + 
  geom_bar(stat = "identity")
basic.bar
# y축 scale 범위 조정
basic.bar + xlab("동물의 종류") + ylab("개체수") +
  ylim(0, 130) #기본적으로 ggplot2에선 y값의 최대값을 잡는다

# y축 scale 범위 조정 및 ticks 조절 (y 범위 조절의 다른 방법)
# scale_y_continous 함수 안에서 많은 것들을 컨트롤 할 수 있음
basic.bar + scale_y_continuous(breaks = seq(0, max(myanimal$value), 10), # for ticks
                               limits = c(0, max(myanimal$value)), # for range yAxis
                               name = "value", # name of yAxis
                               position = "left") +
  scale_x_discrete(labels = abbreviate) #x축 긴 이름 줄임
# title of chart
basic.bar + ggtitle("What I like Animals", "source : 1997-2017") # main, sub title

# Bar width
ggplot(myanimal, aes(x= animal, y=value)) + 
  geom_bar(stat = "identity", width = 0.95) # width default 0.9

# Manual Colors (fill인지 colour인지 구별잘할것!) 
ggplot(myanimal, aes(x= animal, y=value, fill=category)) + 
  geom_bar(stat = "identity", width = 0.95) +
  scale_fill_manual(values = c("blue", "purple"))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Group Bar Chart
# - group bar color
# - data structure
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
country <- read_csv("group_bar.csv")
head(country)

#차트 만들기 색은 (Adobe Color CC)
ggplot(country, aes(x=year, y=value, fill=country)) +
  geom_bar(stat = "identity", position = "dodge", width = 4) +
  scale_x_continuous(name = "YEAR", 
                     breaks = seq(min(country$year), max(country$year), 5)) + 
  scale_fill_manual(values = c("#EAEFB9","#D1DCBC", "#90AA9D", "#3D6070", "#183442", "#002240")) +
  ylab("VALUE")


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Line Chart
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

stocks$label <- as.character(stocks$label) #숫자형은 scale이 잡히기 때문에

View(stocks)
ggplot(stocks, aes(x=year, y=price, group=company, color = label, label = price)) + 
  geom_line(stat = "identity", size = 0.8) + 
  scale_y_continuous(name = "Stocks in Yeowoon",
                     breaks = seq(0, max(stocks$price), 10),
                     limits = c(0,100)) +
  theme(legend.position = "top") +
  scale_color_manual(values = c("#F95A45", "#3AB782")) +
  ggtitle(label = "연도별 주식 거래량", subtitle = "source : 한국내맘대로연구소") + #제목과 부제
  ylab("주식량") + #scale_y_continous에서 y축 라벨 변경 가능
  xlab("연도별 변화") +
  geom_label() +
  theme_woons()

pool <- c("그리스도敎", "Islam敎", "拉拉隊", "함무라비法典", "니나니노", "Orientalism")
pattern<-"^\\p{Han}+$"
is.hanja <- grep(pattern,pool,perl=T)
is.hanja
unlist(str_extract_all(pool, pattern))
