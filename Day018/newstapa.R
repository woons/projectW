library(tidyverse)
library(stringr)
library(rvest)
library(httr)

#뉴스타파

url.newstapa <- "http://newstapa.org/category/data_journalism/page/1"
res.newstapa <- GET(url.newstapa)
h.newstapa <- read_html(res.newstapa)

#empty vector
first_page_final_newstapa <- NULL

#page loop
for(i in 1:6) {
  url.newstapa <- paste0("http://newstapa.org/category/data_journalism/page/",i)
  res.newstapa <- GET(url.newstapa)
  h.newstapa <- read_html(res.newstapa)
  
  #기사제목
  headline.newstapa <- html_nodes(h.newstapa, ".widget .video-item .all-info .rt-article-title a") %>% html_text()
  
  #기사URL
  link.newstapa <- html_nodes(h.newstapa, ".widget .video-item .all-info .rt-article-title a") %>% 
    html_attr("href")
  
  #기사날짜
  date.newstapa <- html_nodes(h.newstapa, "div.all-info .panel_small_inf") %>% 
    html_text()
  date.newstapa <- date.newstapa[1:14]
  date.newstapa <- str_trim(date.newstapa)
  date.newstapa <- str_replace_all(date.newstapa, pattern = "년", ".") 
  date.newstapa <- str_replace_all(date.newstapa, pattern = "월", ".") 
  date.newstapa <- str_replace_all(date.newstapa, pattern = "일", "")
  date.newstapa <- str_trim(date.newstapa)
  #데이터프레임으로 변환
  final_page_newstapa <- data.frame(headline.newstapa, link.newstapa, date.newstapa)
  
  #결합
  first_page_final_newstapa <- rbind(first_page_final_newstapa, final_page_newstapa)
}
date.newstapa[1:14]
colnames(first_page_final_newstapa) <- c("headline", "url", "date")
View(first_page_final_newstapa)
write.csv(first_page_final_newstapa, "final_newstapa.csv")

