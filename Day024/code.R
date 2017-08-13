#벡터와 리스트의 구분

myvector <- c(1:4, "a")
mylist <- list(1:4, "a")
mylist

name <- c("갑", "을", "병", "정")
gender <- c(2, 1, 1, 2)
mydata <- data.frame(name, gender)

attr(mydata$name, "what the variable means") <- "응답자의 이름"
mydata$name

attr(mydata$gender, "what the variable means") <- "응답자의 성별"
mydata$gender

myvalues <- c()
for (i in seq_along(gender)) {
  myvalues[i] <- ifelse(gender[i] == 1, "남성", "여성")
}
myvalues


mysentence <- "Learning R is so interesting"
mywords <- strsplit(mysentence, " ")
strsplit(mywords[[1]][5], "")

mylist2<- list()
for (i in seq_along(mywords[[1]])){
  mylist2[i] <- strsplit(mywords[[1]][i], "")
}

mylist2
mylist3 <- list()
for (i in seq_along(mylist2)){
  mylist3[i] <- paste0(mylist2[[i]], collapse = "")
}
mylist3
paste(mylist3, collapse = " ")


regexpr("ing", mysentence)

loc.begin <- as.vector(regexpr("ing", mysentence))
loc.length <- as.vector(attr(regexpr("ing", mysentence), "match.length"))
loc.end <- loc.begin + loc.length - 1

a <- gregexpr("ing", mysentence)

regexec("interestin(g)", mysentence)
mysentence

r_wiki <- 'R is an open source programming language and software environment for statistical computing and graphics that is supported by the R Foundation for Statistical Computing. The R language is widely used among statisticians and data miners for developing statistical software and data analysis. Polls, surveys of data miners, and studies of scholarly literature databases show that R\'s popularity has increased substantially in recent years.\nR is a GNU package. The source code for the R software environment is written primarily in C, Fortran, and R. R is freely available under the GNU General Public License, and pre-compiled binary versions are provided for various operating systems. While R has a command line interface, there are several graphical front-ends available.'

r_wiki_para <- strsplit(r_wiki, split = "\n")
r_wiki_sent <- strsplit(r_wiki_para[[1]], split = "\\.")
r_wiki_sent

mysentence2 <- unlist(r_wiki_sent)
mysentence2
regexpr("software", mysentence2)

gregexpr("software", mysentence2)


#시작과 종료를 알리는 함수 만들기
mysentence2
mytemp <- regexpr("software", mysentence2)
mybegin <- as.vector(mytemp)
mybegin
mysentence2
test <- "I'm yeowoon, his origin name is sangjae, but he changed his name as yeowoon. yeowoon means reaching cloud"
gregexpr("yeowoon", test)
