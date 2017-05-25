###################################
# Day 10 Exercise
# -Data Manipulation with stringr.
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

format(estimate, digits = 5) # 1.3402
format(estimate, digits = 4) # 1.34
format(estimate, digits = 3) # 1.34
format(estimate, digits = 2) # 1.3
format(estimate, digits = 1) # 1 , 즉 digits는 전체 자리 개수를 의미

format(c(0.0011, 0.011, 1), digits = 1) #하지만 digits=1이라도 다음의 경우는 최소 자리 지수가 보여짐

#Fixed & Scientific format (우리가 일반적으로 사용하는 포맷) 
# => 19890000000000000000000000000000000km
# => 1.989 x 34승 

x <- c(19890000000000000000000000000000000, 0.0000000000000000008)
format(x, scientific = TRUE)
formatC(x, format = "f")
formatC(x, format = "e")
formatC(x, format = "g")
format(x)

#format()에서 digit의 기능
numbers1 <- c(1.001123, 0.32342, 0.000123)
format(numbers1, digits = 3)

# Some vectors of numbers
percent_change  <- c(4, -1.91, 3.00, -5.002)
income <-  c(72.19, 1030.18, 10291.93, 1189192.18)
p_values <- c(0.12, 0.98, 0.0000191, 0.00000000002)

# Format c(0.0011, 0.011, 1) with digits = 1
format(c(0.0011, 0.011, 1), digits = 1) #c(0.001, 0.011, 1.000)
format(c(150, 5, 10, 50000000), digits = 1)
format(c(0.000234, 0.01, 0.1, 5.3234234), digits = 2) #c(0.00023, 0.01000, 0.10000, 5.32342)


# Format c(1.0011, 2.011, 1) with digits = 1
format(c(1.0011, 2.011, 1), digits = 1)

# Format percent_change 소수점 한자리로 보여주세요
format(percent_change, digits = 2)

# Format income 정수로 보여주세요!!
format(income, digits = 2)

# Format p_values in fixed format
format(p_values, scientific = FALSE)

#######################################################
# 조금 더 진도를 나가서!
# format & formatC 그리고 digits, flag, format
#######################################################
# 실습 데이터
x <- c(0.0011, 0.011, 1)
y <- c(1.0011, 2.011, 1)
percent_change <- c(4.000, -1.910, 3.000, -5.002)
p_values <- c(1.20e-01, 9.80e-01, 1.91e-05, 2.00e-11)

# formatC() on x with format = "f", digits = 1
formatC(x, format = "f", digits= 1)

# formatC() on y with format = "f", digits = 1
formatC(y, format = "f", digits = 1)

# Format percent_change to one place after the decimal point
formatC(percent_change, format = "f", digits = 1)

# percent_change with flag = "+"
formatC(percent_change, format = "f", digits = 1, flag = "+") 

# Format p_values using format = "g" and digits = 2
formatC(p_values, format = "g", digits = 2)
