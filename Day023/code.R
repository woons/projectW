# library needed
library(tidyverse)
library(stringr)

#--------------------------------------------------
# R ggplot2 + Guide to Information Graphics (WSK)
#--------------------------------------------------

#--------------------
# Vertical_Bar Chart
#--------------------

#sample data set1
animal <- c("Dog", "Cat", "Monkey", "Chicken", "Duck", "Tiger", "Lion")
value <- sample(100, length(animal), replace = TRUE)
category <- c("house", "house", "outside", "outside", "outside", "outside", "outside")
myanimal <- data.frame(animal, value, category)

#sample data set2
year <- seq(1990, 2017, 5)
year <- rep(year, 6)
year <- sort(year)
year
price <- sample(100, length(year), replace = TRUE)
price <- rep(price, 6)

company <- c("KOREA", "USA", "CHINA", "JAPAN", "INDIA", "FRANCE")
company <- rep(company, 6)

label <- rep(c(1,2,2,2,2,2),6)
stocks <- data.frame(year, price, company,label)
dim(stocks)
# basic bar chart
basic.bar <- ggplot(myanimal, aes(x= reorder(animal, -value), y=value, fill=category)) + 
  geom_bar(stat = "identity")

# y축 scale 범위 조정
basic.bar + ylim(0, max(myanimal$value)) #기본적으로 ggplot2에선 y값의 최대값을 잡는다

# y축 scale 범위 조정 및 ticks 조절 (y 범위 조절의 다른 방법)
# scale_y_continous 함수 안에서 많은 것들을 컨트롤 할 수 있음
basic.bar + scale_y_continuous(breaks = seq(0, max(myanimal$value), 10), # for ticks
                               limits = c(0, max(myanimal$value)), # for range yAxis
                               name = "MY ANIMAL", # name of yAxis
                               position = "left") # yAxis position left(default) or right

# title of chart
basic.bar + ggtitle("What I like Animals", "source : 1997-2017") # main, sub title

# Bar width
ggplot(myanimal, aes(x= animal, y=value)) + 
  geom_bar(stat = "identity", width = 0.95) # width default 0.9

# Manual Colors (fill인지 colour인지 구별잘할것!) 
ggplot(myanimal, aes(x= animal, y=value, fill=category)) + 
  geom_bar(stat = "identity", width = 0.95) +
  scale_fill_manual(values = c("blue", "purple"))

#-------------------------- END --------------------------

#--------------------
# Line Chart
#--------------------
ggplot(stocks, aes(x=year, y=price, group=company), color = label) + 
  geom_line(stat = "identity", size = 0.4, aes(alpha = label)) + # 투명도를 줄 조건 지정
  scale_alpha(c(0.3, 1.0)) + # 투명도 조절
  scale_y_continuous(name = "Stocks in Yeowoon",
                     breaks = seq(0, max(stocks$price), 10)) +
  theme(legend.position = "top") +
  scale_color_manual(values = c("red", "blue"))

