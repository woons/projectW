##########################################
# Day16 _ character class & alternation
##########################################

library(rebus)
library(stringr)
library(neiss)

#-------------Character Classes--------------------------

x <- c("grey sky", "gray elephant")
vowels <- char_class("aeiouAEIOU")

# Print vowels
vowels
x
boy_names <- babynames::babynames$name

# See vowels in x with str_view()
str_view(x, pattern = vowels)

# See vowels in x with str_view_all()
str_view_all(x, pattern = vowels)

# Number of vowels in boy_names
num_vowels <- str_count(boy_names, pattern = vowels)
mean(num_vowels)

# Proportion of vowels in boy_names
name_length <- str_length(boy_names)
mean(num_vowels/name_length)

#-------------Repetition(반복) PART1 ---------------------------


# Vowels from last exercise
vowels <- char_class("aeiouAEIOU")

# Use `negated_char_class()` for everything but vowels
not_vowels <- negated_char_class(vowels)

# See names with only vowels
str_view(boy_names, pattern = vowels,match = TRUE)

# See names with no vowels
str_view(boy_names, pattern = not_vowels, match = TRUE)


#-------------Repetition(반복) PART2 ---------------------------


# Vowels from last exercise
vowels <- char_class("aeiouAEIOU")

# Use `negated_char_class()` for everything but vowels
not_vowels <- negated_char_class("aeiouAEIOU")

# See names with only vowels
str_view(boy_names, pattern = exactly(one_or_more(vowels)), match = TRUE)

# See names with no vowels
str_view(boy_names, pattern =  exactly(one_or_more(not_vowels)), match = TRUE)

#------------ add explanation -----------------
x <- c("catfish", "tomcat", "cat")
(rx_start <- START %R% "cat")
(rx_end <- "cat" %R% END)
(rx_exact <- exactly("cat"))
stringi::stri_detect_regex(x, rx_start)
stringi::stri_detect_regex(x, rx_end)
stringi::stri_detect_regex(x, rx_exact)

mydata <- c("Bae Yeowoon", "Lim Songyi", "bae Ona")
mypatterns <- char_class("bae")
str_view(mydata, pattern = mypatterns, match = TRUE)

dd <- c("100d", "5000d", "50t", "392k")
str_view(dd, pattern = "\[0-9][0-9][0-9][a-z]")
