#install.packages("ggmap")
library(ggmap)
library(tidyverse)

#read sample data
res <- read_csv("address.csv")

#set coordinate
seoul <- c(lon = 126.977869 , lat = 37.567597)

#map setting
map_13 <- get_map(seoul, zoom = 12, scale = 1, source = "stamen", maptype = "toner")

#draw map : ggmap pacakges
ggmap(map_13)

#draw map : ggplot2
ggmap(map_13) + 
  geom_point(aes(x=Longitude, y=Latitude, colour = category), data = res) +
  facet_wrap(~category)

# Use base_layer argument to ggmap() to specify data and x, y mappings
ggmap(corvallis_map_bw, base_layer = ggplot(sales, aes(lon, lat))) +
  geom_point(aes(color = year_built))

# qmplot
qmplot(Longitude, Latitude, data = res, geom = "point", color = category) +
  facet_wrap(~category)

# Use base_layer argument to ggmap() and add facet_wrap()
ggmap(corvallis_map_bw, base_layer = ggplot(sales, aes(lon, lat))) +
  geom_point(aes(color = class)) +
  facet_wrap(~ class)