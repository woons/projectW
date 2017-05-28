##############################
# Day14 _ Regular Expression
##############################
library(stringr)
library(rebus)

x <- c("cat", "coat", "scotland", "tic toc")

# Match two characters, where the second is a "t"
str_view(x, pattern = ANY_CHAR %R% "t")

# Match a "t" followed by any character
str_view(x, pattern = "t" %R% ANY_CHAR)

# Match two characters
str_view(x, pattern = ANY_CHAR %R% ANY_CHAR)

# Match a string with exactly three characters
str_view(x, pattern = START %R% ANY_CHAR %R% ANY_CHAR %R% ANY_CHAR %R% END)

test <- c("배상재", "배여운 바보입니까?", "임송이 바보네", "다이소")
str_view(test, pattern = START %R% ANY_CHAR %R% ANY_CHAR %R% ANY_CHAR)

####################################################################
#---------Combining with stringr functions--------------------------
####################################################################

# q followed by any character
pattern <- "q" %R% ANY_CHAR

# Test pattern 
str_view(c("Quentin", "Kaliq", "Jacques",  "Jacqes"), pattern)  

# Find names that have the pattern
names_with_q <- str_subset(boy_names, pattern)
head(names_with_q)
length(names_with_q)

# Find part of name that matches pattern
part_with_q <- str_extract(boy_names, pattern)
table(part_with_q)

# Did any names have the pattern more than once?
count_of_q <- str_count(boy_names, pattern)
table(count_of_q)
# Which babies got these names?
with_q <- str_detect(boy_names, pattern)

# What fraction of babies got these names?
mean(with_q)

############################################################
#---------------Alternation------------------
############################################################

boy_names <- c("Katherine", "Jeffrey", "Geoffrey", "Deffrey", 
               "Kathryn", "Cathleen", "Kathalina")

# Match Jeffrey or Geoffrey
whole_names <- or("Jeffrey", "Geoffrey")
str_view(boy_names, pattern = whole_names, match = TRUE)

# Match Jeffrey or Geoffrey, another way
common_ending <- or("Je", "Geo") %R% "ffrey"
str_view(boy_names, pattern = common_ending, match = TRUE)

# Match with alternate endings
by_parts <- or("Je", "Geo") %R% "ff" %R% or("ry", "ery", "rey", "erey")
str_view(boy_names, pattern = by_parts, match = TRUE)

# Match names that start with Cath or Kath
ckath <- START %R% or("C", "K") %R% "ath"
str_view(boy_names, pattern = ckath, match = TRUE)

