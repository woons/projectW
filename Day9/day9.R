##################################
# Day9 - Zoo of Time Series
##################################

library(tidyverse)

# 2016년 6월의 날짜와 요일을 표시해보세요?! (index도 있으면 좋겠다)
startDate <- as.Date("2017-06-01")
endDate <- as.Date("2017-06-30")
seq(startDate, endDate, by="1 days")
