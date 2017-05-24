###################################
# Day 10 Exercise
# -Data Manipulation with stringr
# #################################

library(stringr)

#이상한 나라의 앨리스 문장을 활용한 writeLines 실습
line1 <- "The table was a large one, but the three were all crowded together at one corner of it:"
line2 <- "\"No room! No room!\" they cried out when they saw Alice coming."
line3 <- "\"There's plenty of room!\" said Alice indignantly, and she sat down in a large arm-chair at one end of the table."
lines <- c(line1, line2, line3)

print(lines)
writeLines(lines)
writeLines(lines, sep = " ")
test1 <- writeLines("To have a \\ you need \\\\")

#한줄 띄어쓰기 \n은 기준 단어 앞에 붙인다 
writeLines("This is a really \nreally really \nlong string")

#Turning numbers into strings
estimate <- 1.34019029100
as.character(estimate)

format(estimate, digits = 3)
format(estimate, digits = 2)

#Fixed & Scientific format (우리가 일반적으로 사용하는 포맷) 
# => 19890000000000000000000000000000000km
# => 1.989 x 34승 

x <- c(19890000000000000000000000000000000, 0.0000000000000000008)
format(x, scientific = TRUE)
formatC(x, format = "f")
formatC(x, format = "e")
formatC(x, format = "g")
format(x)
