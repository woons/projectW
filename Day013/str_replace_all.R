library(tidyverse)
library(stringr)
library(readr)

# import data
df_test_time <- read_csv("time.csv")


# str_replace_all과 regular expression 활용
df_test_time$time <- str_replace_all(df_test_time$time, 
                                     pattern = "([^0-9]{0,5})[a-z]+", 
                                     replacement = "")

df_test_time$time <- str_replace_all(df_test_time$time, 
                                     pattern = c("러닝타임 : " = "",
                                                 "러닝타임 :" = ""))
df_test_time$time <- as.numeric(df_test_time$time)
