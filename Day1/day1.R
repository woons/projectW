## 다시부산 R코드 작업
library(tidyverse)
library(stringr)
library(rvest)
library(httr)

EmptyVectorMain <- NULL

#total 687pages
for(i in 1:4){
  url <- paste0("http://biff.kr/kor/html/archive/arc_history_tsearch.asp?page=",i,"&piff_code=&s1=&search=&keyword=")
  res <- GET(url)
  h <- read_html(res)
  
  #작품이름
  title <- html_nodes(h, "div.txt > h5") %>% 
    html_text
  title2 <- str_split_fixed(title, " / ", 2) %>% as.data.frame()
  colnames(title2) <- c("title_kr", "title_en")
  
  #본문텍스트
  content <- html_nodes(h, "p.note") %>% 
    html_text %>% 
    str_trim
  
  #러닝타임
  time <- html_nodes(h, "span.program_Op1") %>% 
    html_text %>% 
    str_sub(7, 13) %>% 
    str_trim
  
  #감독, 출품국가, 출품년도 for second loop
  director <- NULL
  country <- NULL
  year <- NULL
  for(j in 1:8){
    
    #director
    path = paste0("//*[@id='content_text']/div/ul/li[", j, "]/div[2]/p[1]/text()[1]")
    directorInside <- html_nodes(h, xpath = path) %>% html_text
    director <- c(director, directorInside) %>% str_replace("감독 : ", "")
    
    #year
    path2 = paste0("//*[@id='content_text']/div/ul/li[", j, "]/div[2]/p[1]/text()[2]")
    yearInside <- html_nodes(h, xpath = path2) %>% html_text
    year <- c(year, yearInside) %>% str_replace("출품년도 : ", "") %>% str_sub(1, 4)
    
    #country
    path3 = paste0("//*[@id='content_text']/div/ul/li[", j, "]/div[2]/p[1]/text()[3]")
    countryInside <- html_nodes(h, xpath = path3) %>% html_text
    country <- c(country, countryInside) %>% str_replace("국가 : ", "")
  } 
  EmptyVectorInside <- data.frame(title2, content, time, director, country, year, stringsAsFactors = F)
  EmptyVectorMain <- rbind(EmptyVectorMain, EmptyVectorInside)
}
