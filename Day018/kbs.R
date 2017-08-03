library(tidyverse)
library(stringr)
library(rvest)
library(httr)
library(purrr)


# KBS 데이터저널리즘, 
kbs.url <- "http://news.kbs.co.kr/news/getMenuNewsList.do" 
kbs.article <- POST(kbs.url,
                    body = list(
                      CURRENT_PAGE_NO = 1,
                      ROW_PER_PAGE = 12,
                      SEARCH_LIST_TYPE = 701,
                      SEARCH_MENU_CODE = 0909
                    ))

final <- NULL

#현재 KBS는 17페이지
for(j in 1:17){
  
  #URL구조 만들기
  parsed_paste <- paste0("http://news.kbs.co.kr/news/getMenuNewsList.do?CURRENT_PAGE_NO=",j,"&ROW_PER_PAGE=12&SEARCH_LIST_TYPE=701&SEARCH_MENU_CODE=0909&")
  
  #POST로 응답받기
  h <- POST(parsed_paste)
  x <- content(h, "parsed", "application/json")
  
  # 기사제목 loop
  total <- NULL 
  headline <- character()
  date <- character()
  url <- character()
  for(i in 1:12){
    headline <- c(headline, x$page_list[[i]]$NEWS_TITLE)
    url <- c(url,x$page_list[[i]]$NEWS_IMG_URL)
    date <- c(date,x$page_list[[i]]$NEWS_SERVICE_DATE)
    total <- data.frame(headline, url, date)
    total$url <- str_extract_all(total$url, "\\d{7}")
    total$url <- paste0("http://news.kbs.co.kr/news/view.do?ncd=", total$url)
  }
  final <- rbind(final, total)
}#end

#write.csv
write.csv(final, "final_kbs.csv")
