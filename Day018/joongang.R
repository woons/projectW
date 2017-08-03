#중앙일보

url.joongang <- "http://news.joins.com/DigitalSpecial/List?page=1"
res.joongang <- GET(url.joongang)
h.joongang <- read_html(res.joongang)

#empty vector
first_page_final_joongang <- NULL

#page loop
for(i in 1:2) {
  url.joongang <- paste0("http://news.joins.com/DigitalSpecial/List?page=",i)
  res.joongang <- GET(url.joongang)
  h.joongang <- read_html(res.joongang)
  
  #기사제목
  headline.joongang <- html_nodes(h.joongang, ".headline a") %>% 
    html_text()
  headline.joongang
  
  #기사URL
  link.joongang <- html_nodes(h.joongang, ".headline a") %>% 
    html_attr("href")

  #기사날짜
  date.joongang <- html_nodes(h.joongang, ".byline") %>% 
    html_text()
  
  #데이터프레임으로 변환
  final_page_joongang <- data.frame(headline.joongang, link.joongang, date.joongang)
  
  #결합
  first_page_final_joongang <- rbind(first_page_final_joongang, final_page_joongang)
}

colnames(first_page_final_joongang) <- c("headline", "url", "date")
write.csv(first_page_final_joongang, "final_joongang.csv")

