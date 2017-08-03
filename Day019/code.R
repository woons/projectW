library(tidyverse)
library(data.table) #승욱님 추천 방식 fread

# regx : csv
list_csv <- list.files(pattern = "[0-9]{4}.csv")

# option1 : 4KB
df_test1 <- do.call(rbind, lapply(list_csv, function(x){read_csv(x)}))

# option2 : 1.7KB
df_test2 <- list_csv %>% 
  map_df(~read_csv(.))
??fread

# option3 : 1.5KB
df_test3 <- data.frame()

for(n in 0:3){
  df_sub <- fread(paste0('201', n, ".csv"), data.table = F)
  df_test3 <- rbind(df_test3, df_sub)
}

# compare between df1 and df2
object.size(df_test1)
object.size(df_test2)

glimpse(df_test1)
glimpse(df_test2)
??map_df
