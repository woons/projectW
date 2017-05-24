##################################
# Day9 - Zoo of Time Series
##################################

library(tidyverse)
library(lubridate)

# 기본적인 lubridate format
format(Sys.time(), "%a %A %d %m")
as.Date("02/14/1986", format = "%m/%d/%Y")
as.Date(-15, origin = "1986-02-14")
as.Date("2017-02-14") - as.Date("1986-02-14")


# 2016년 6월의 날짜와 요일을 표시해보세요?! (index도 있으면 좋겠다)
startDate <- as.Date("2017-06-01")
endDate <- as.Date("2017-06-30")
seq(startDate, endDate, by="1 days")

#두 날짜 사이의 일자 계산
dateA <- ymd_h("2017-05-23 13")
dateB <- ymd_h("2011-02-11 0")
ourTime <- dateA - dateB
ourTime
