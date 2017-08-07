library(tidyverse)
library(lubridate)

# some cases of date
birthday <- c("1986-02-14", "1991-10-24") # correct format
birthday2 <- c("1986.02.14", "1991.10.24") # wrong date format
birthday3 <- c("19860214", "19911024") # wrong date format

birthday22 <- as.Date(birthday2, format = "%Y.%m.%d") # edited
birthday22

birthday33 <- as.Date(birthday3, format = "%Y%m%d") # edited
birthday33

# Using lubridate 
# it automatically recognizes some separators ("-", "/", ".", "")
ymd(birthday2)
ymd(birthday3)

# lubridate functions of extract date
year(birthday22)
month(birthday22)
month(birthday22, label = TRUE)
day(birthday22)
wday(birthday22, label = TRUE)

# manipulation of date format
update(birthday22, year = c(1991, 1986)) #update function
birthday22 + years(10) + days(5)
today() - birthday22

# creating Date Sequence
seq(as.Date("1986-02-14"), as.Date("2017-02-14"), by="years") # by years
seq(as.Date("1986-02-14"), as.Date("2017-02-14"), by="quarter") # by quarters
seq(as.Date("1986-02-14"), as.Date("2017-02-14"), by="10 years") # by 10 years
seq(as.Date("1986-02-14"), as.Date("2017-02-14"), by="100 days") # by 100 days

seq(ymd("1986-02-14"), ymd("2017-02-14"), by = "years") # lubridate
