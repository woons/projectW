library(tidyverse)
library(nycflights13)

df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df2 <- vector("double", ncol(df))
for(i in seq_along(df2)) {
  df2[[i]] = median(df[[i]])  
}
df[[1]]

# exercise1 : compute the mean of every column in mtcars
head(mtcars)
df <- mtcars
output1 <- vector("double", ncol(df))
for(i in seq_along(df)){
  output1[[i]] <- mean(df[[i]])
}

# functional
colmean <- function(x) {
  output1 <- vector("double", ncol(x))
  for(i in seq_along(x)){
    output1[[i]] <- mean(x[[i]])
  }
  output1
}
colmean(mtcars)

# exercise2 : Determine the type of each column in nycflights13::flights
df2 <- flights
output2 <- vector(mode = "character", ncol(df2))
for(i in seq_along(df2)){
  output2[[i]] <- typeof(df2[[i]])
}
output2
output22 <- df2 %>% map_chr(typeof) #purr function

# functional
coltype <- function(x){
  output2 <- vector("character", ncol(x))
  for(i in seq_along(x)){
    output2[[i]] <- typeof(x[[i]])
  }
  output2
}
coltype(iris)

# exercise3 : compute the number of unique values in each column of iris
df3 <- iris
length(unique(iris[[3]]))

output3 <- vector("double", ncol(df3))
for(i in seq_along(df3)) {
  output3[[i]] <- length(unique(df3[[i]]))
}

