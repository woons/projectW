
#SBS 데이터저널리즘_TEST
url <- "http://news.sbs.co.kr/news/newsPlusList.do?pageIdx=1&themeId=10000000114"
url
res <- GET(url)
h <- read_html(res)

#empty vector
first_page_final_sbs <- NULL

#page loop
for(i in 1:13) {
  url.sbs <- paste0("http://news.sbs.co.kr/news/newsPlusList.do?pageIdx=",i,"&themeId=10000000114")
  res.sbs <- GET(url.sbs)
  h.sbs <- read_html(res.sbs)
  
  #기사제목
  headline.sbs <- html_nodes(h.sbs, ".mfn_tit") %>% html_text()
  headline.sbs
  
  #기사URL
  link.sbs <- html_nodes(h.sbs, ".mfn_cont") %>% 
    html_attr("href")
  link.sbs <- paste0("http://news.sbs.co.kr/", link.sbs)
  
  #기사날짜
  date.sbs <- html_nodes(h.sbs, ".mfn_date") %>% 
    html_text()
  date.sbs <- str_extract(date.sbs, "[0-9]{4}.[0-9]{2}.[0-9]{2}")
  
  #데이터프레임으로 변환
  final_page_sbs <- data.frame(headline.sbs, link.sbs, date.sbs)
  
  #결합
  first_page_final_sbs <- rbind(first_page_final_sbs, final_page_sbs)
}

colnames(first_page_final_sbs) <- c("headline", "url", "date")
write.csv(first_page_final_sbs, "final_sbs.csv")
