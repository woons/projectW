#ytn

url.ytn <- "http://www.ytn.co.kr/video/video_list.php?page=1&s_mcd=dJournalism"
res.ytn <- GET(url.ytn)
h.ytn <- read_html(res.ytn)

#empty vector
first_page_final_ytn <- NULL

#page loop
for(i in 1:2) {
  url.ytn <- paste0("http://www.ytn.co.kr/video/video_list.php?page=",i,"&s_mcd=dJournalism")
  res.ytn <- GET(url.ytn)
  h.ytn <- read_html(res.ytn)
  
  #기사제목
  headline.ytn <- html_nodes(h.ytn, ".news_list2014 dt a") %>% html_text()
  headline.ytn
  
  #기사URL
  link.ytn <- html_nodes(h.ytn, ".news_list2014 dt a") %>% 
    html_attr("href")
  link.ytn <- paste0("http://www.ytn.co.kr", link.ytn)
  
  #기사날짜
  date.ytn <- html_nodes(h.ytn, ".news_list2014 dd.date") %>% 
    html_text()
  
  #데이터프레임으로 변환
  final_page_ytn <- data.frame(headline.ytn, link.ytn, date.ytn)
  
  #결합
  first_page_final_ytn <- rbind(first_page_final_ytn, final_page_ytn)
}

colnames(first_page_final_ytn) <- c("headline", "url", "date")
View(first_page_final_ytn)
write.csv(first_page_final_ytn, "final_ytn.csv")

