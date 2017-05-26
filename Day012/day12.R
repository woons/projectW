################################
# Day12 _ Data Manipulation
# stringr pacakage
###############################

library(stringr)

my_toppings <- c("cheese", NA, NA)
my_toppings_and <- paste(c("", "", "and "), my_toppings, sep = "")

# Print my_toppings_and
print(my_toppings_and)

# Use str_c() instead of paste(): my_toppings_str
my_toppings_str <- str_c(c("", "", "and "), my_toppings)

# Print my_toppings_str
print(my_toppings_str)

# paste() my_toppings_and with collapse = ", "
paste(my_toppings_and, collapse = ", ")

# str_c() my_toppings_str with collapse = ", "
str_c(my_toppings_str, collapse = ", ")

##############
# 한국어 적용
##############

#샘플데이터 (pattern에서 fixed의 기능)
myname <- c("배여운", "배여삼", "배여", "임송이", "임곱단", "임단이", "김민호", "고단배", "김배여", "배배배")
str_subset(myname, pattern = fixed("배여")) 
str_subset(myname, pattern = "배여")
str_subset(myname, pattern = fixed("임"))
str_subset(myname, pattern = "여")

str_subset(myname, pattern = fixed("여"))

pizzas <- c("cheese", "pepperoni", "sausage and green peppers")
str_subset(pizzas, pattern = fixed("pepper"))

####################################################################
# str_count()
# 벡터의 문자열에서 pattern으로 지정된 문자가 몇 번 사용됐는지
####################################################################

pizzas <- c("cheese", "pepperoni", 
            "sausage and green peppers")
str_count(pizzas, pattern = fixed("pepper"))
str_count(pizzas, pattern = fixed("e"))

str_count(myname, pattern = fixed("배"))
