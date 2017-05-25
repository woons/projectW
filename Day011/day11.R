##############################
# Day11 _ stringr
# paste 함수 활용 : collapse
##############################

pretty_income <- c("72", "1,030", "10,292", "1,189,192")
pretty_percent <- c("+4.0", "-1.9", "+3.0", "-5.0")
years <- c(2010, 2011, 2012, 2013)
# Add $ to pretty_income
paste("$", pretty_income, sep = "") 

# Add % to pretty_percent
paste(pretty_percent, "%", sep = "")

# Create vector with elements like 2010: +4.0%`
year_percent <- paste(years, ": ", pretty_percent, "%", sep = "")
year_percent
# Collapse all years into single string
paste(year_percent, collapse = ", ")

#------------------------------------------------------------------

#샘플데이터
income <- c( 72.19, 1030.18, 10291.93, 1189192.18)
print(income)

# Define the names vector
income_names <- c("Year 0", "Year 1", "Year 2", "Project Lifetime")
print(income_names)

# Create pretty_income
pretty_income <- format(income, digits = 2, big.mark = ",")
print(pretty_income)

# Create dollar_income
dollar_income <- paste("$", pretty_income, sep = "")
print(dollar_income)

# Create formatted_names
formatted_names <- format(income_names, justify = "right")
print(formatted_names)

# Create rows
rows <- paste(formatted_names, dollar_income, sep = "   ")
print(rows)
# Write rows
writeLines(rows)

##############################
# 피자 주문하기 실습!!!
##############################
# Randomly sample 3 toppings

toppings <- c("anchovies", "artichoke", "bacon", "breakfast bacon", 
              "Canadian bacon", "cheese", "chicken", "chili peppers",
              "feta", "garlic", "green peppers", "grilled onions", 
              "ground beef", "ham", "hot sauce", "meatballs", "mushrooms",
              "olives", "onions", "pepperoni", "pineapple", "sausage", 
              "spinach", "sun-dried tomato",  "tomatoes")
my_toppings <- sample(toppings, size = 3)

# Print my_toppings
my_toppings

# Paste "and " to last element: my_toppings_and
my_toppings_and <- paste(c("", "", "and "), my_toppings, sep = "")
my_toppings_and

# Collapse with comma space: these_toppings
these_toppings <- paste(my_toppings_and, collapse = ", ")

# Add rest of sentence: my_order
my_order <- paste("I want to order a pizza with ", these_toppings, ".", sep = "")

# Order pizza with writeLines()
writeLines(my_order)

