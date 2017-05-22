###################################################
## Day8 Exercise
### Data Wrangling - dplyr
###################################################

library(readr)
library(tidyverse)
library(stringr)
library(EDAWR)

#rename columns
x <- read_csv("sample.csv")
glimpse(x)
x <- x %>% rename(No = X1, contents = content) #rename(NEW NAME = OLD NAME) !!

#seperate & unite
#devtools::install_github("rstudio/EDAWR")
y <- data_frame(country=c("Korea-Seoul", "Korea,Busan", "Spain-Madrid", "Japan-Tokyo"), 
                value=c(43, 21, 50, 23))

y_edit <- y %>% separate(country, c("country1", "city")) #separate one column into several
y_again <- y_edit %>% unite(full_address, country1, city, sep="-") #Unite several columns into one

#subset observation
z <- data_frame(name=c("yeowoon", "songyi", "taehoon", "yeowoon", "songyi", "minho", "yeowoon", "hongkil"), 
                price=c(43, 21, 50, 43, 43, 50, 41, 21))

#binding
set1 <- data_frame(name = c("yeowoon", "songyi", "minho", "taeho"), 
                   age = c(32, 27, 29, 40))

set2 <- data_frame(name = c("mother", "father", "yeowoon"), 
                   age = c(63, 53, 32))


intersect(set1, set2) # appear both two data sets 
union(set1, set2) 
setdiff(set1, set2) #only appear set1
bind_rows(set1, set2)

##finished
