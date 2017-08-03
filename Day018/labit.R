#뉴스래빗

#labit

url.labit <- "http://newslabit.hankyung.com/apps.frm/tag.article.list?slug=%EB%8D%B0%EC%9D%B4%ED%84%B0%ED%85%94%EB%A7%81&page=1"
res.labit <- GET(url.labit)
h.labit <- read_html(res.labit)

date.labit <- html_nodes(h.labit, ".itm-list-box a") %>% 
  html_attr("href")
date.labit <- date.labit[str_detect(date.labit, "newsview")]
date.labit <- str_extract_all(date.labit, pattern = "[0-9]{8}")
unlist(date.labit)
#empty vector
first_page_final_labit <- NULL

#page loop
for(i in 1:3) {
  url.labit <- paste0("http://newslabit.hankyung.com/apps.frm/tag.article.list?slug=%EB%8D%B0%EC%9D%B4%ED%84%B0%ED%85%94%EB%A7%81&page=",i)
  res.labit <- GET(url.labit)
  h.labit <- read_html(res.labit)
  
  #기사제목
  headline.labit <- html_nodes(h.labit, ".itm-list-box .sbj") %>% html_text()

  #기사URL
  link.labit <- html_nodes(h.labit, ".itm-list-box a") %>% 
    html_attr("href")
  link.labit <- link.labit[str_detect(link.labit, "newsview")]
  

  #기사날짜
  date.labit <- html_nodes(h.labit, ".itm-list-box a") %>% 
    html_attr("href")
  date.labit <- date.labit[str_detect(date.labit, "newsview")]
  date.labit <- unlist(str_extract_all(date.labit, pattern = "[0-9]{8}"))
  
  #데이터프레임으로 변환
  final_page_labit <- data.frame(headline.labit, link.labit, date.labit)
  
  #결합
  first_page_final_labit <- rbind(first_page_final_labit, final_page_labit)
}

colnames(first_page_final_labit) <- c("headline", "url", "date")
View(first_page_final_labit)
write.csv(first_page_final_labit, "final_labit.csv")

