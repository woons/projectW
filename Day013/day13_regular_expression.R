#################################
# Day13 _ Regular expression
#################################

# Some strings to practice with
x <- c("cat", "coat", "scotland", "tic toc")

# Print END
print(END)

# Run me
str_view(x, pattern = START %R% "c")

# Match the strings that start with "co" 
str_view(x, pattern = START %R% "co")

# Match the strings that end with "at"
str_view(x, pattern = "at" %R% END)

# Match the strings that is exactly "cat"
str_view(x, pattern = START %R% "cat" %R% END)
