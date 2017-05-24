library(tidyverse)
library(countrycode)

x <- read.csv("country_master2.csv", stringsAsFactors = F, encoding = "utf-8")
x <- x[3:368,]
colnames(x) <- c("n", "country", "value")
x <- x %>% select(-n)
x <- x %>% group_by(country) %>% summarise_each(funs(sum))

x$country <- str_replace_all(x$country, 
                             c("BUTAN" = "Bhutan",
                               "Mongol" = "Mongolia",
                               "Scotland" = "Scotland"))
x$continent <- countrycode(x$country, "country.name", "continent") #library 'countrycode'
x <- x %>% arrange(continent)
x <- na.omit(x)
