# 모든 언론사 기사 합치기
library(tidyverse)
library(readr)
library(stringr)

#중앙일보
joongang <- read_csv("final_joongang.csv")
joongang$media <- "중앙일보"

#YTN
ytn <- read_csv("final_ytn.csv")
ytn$media <- "YTN"
ytn$date <- str_replace_all(ytn$date, "-", ".")

#KBS
kbs <- read_csv("final_kbs.csv")
kbs$media <- "KBS"

#SBS
sbs <- read_csv("final_sbs.csv")
sbs$media <- "SBS"

#TOTAL
total_article <- rbind(joongang, ytn, kbs, sbs)
write_csv(total_article, "total.csv")
