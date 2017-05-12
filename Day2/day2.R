library(tidyverse)
library(stringr)

# 구분자와 문자열 분할하기
# strsplit & str_split_fixed 함수

places <- c("마포구-연남동-커피", "마포구-상수동-일식", "마포구-서교동-한식", "마포구-망원동-중식")
df_places <- as.data.frame(places) #data.frame으로 변경

# 우선 strsplit 기본함수는 list로 반환
places_edit <- strsplit(places, "-") 
unlist(places_edit)

#################################################################
# stringr 
#################################################################
#str_split 함수(stringr)에서 simplify 옵션 추가하면 list가 아닌 matrix로 구분시킴 (권장)
str_split(places, "-", simplify = TRUE)

# str_split_fixed 함수 (stringr)에서 데이터가 vector일때 (o)
places_edit2 <- str_split_fixed(places, "-", 3) %>% as.data.frame
colnames(places_edit2) <- c("gu", "dong", "category")
places_edit2

# str_split_fixed 함수에서 데이터가 data.frame일때(x)
places_edit3 <- str_split_fixed(df_places, "-", 3)
places_edit3

