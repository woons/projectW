###############################
# Day13_Data Manipulation
###############################

library(stringr)
library(rebus)

ids <- c("ID#: 192", "ID#: 118", "ID#: 001")

# Replace "ID#: " with ""
id_nums <- str_replace(ids, pattern = "ID#: ", replacement = "")

# Turn id_nums into numbers
id_ints <- as.numeric(id_nums)

# Some (fake) phone numbers
phone_numbers <- c("510-555-0123", "541-555-0167")

# Use str_replace() to replace "-" with " "
str_replace(phone_numbers, pattern = "-", replacement = " ")

# Use str_replace_all() to replace "-" with " "
str_replace_all(phone_numbers, pattern = "-", replacement = " ")

# Turn phone numbers into the format xxx.xxx.xxxx
str_replace_all(phone_numbers, pattern = "-", replacement = ".")

########################
# Final exam
########################

# Extract the first letter in the first name
abb_first <- str_sub(names_split[,1], 0,1)

# Combine the first letter ". " and last name
str_c(abb_first, names_split[,2], sep = ". ")

# --- Task 2 ----
# Use all names in babynames_2014
all_names <- babynames_2014$name

# Get the last two letters of all_names
last_two_letters <- str_sub(all_names, -2)

# Does the name end in "ee"?
ends_in_ee <- str_detect(last_two_letters, pattern = "ee")

# Extract rows and "sex" column
sex <-  babynames_2014$sex[ends_in_ee]

# Display result as a table
table(sex)