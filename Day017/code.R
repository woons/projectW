all <- c("충청남도", "충남", "충남", "충청남", "충청남도", "충청도")
wrong <- c("충청도",  "충남",   "충청남")
replacements <- c("충청도로 교체", "충남으로 교체", "충청남으로 교체")

#만약에 원래 데이터랑 오류 사전이랑 비교해서 오류 사전의 내용이 포함되어 있으면
#올바른 단어로 교체하세요

idx <- match(all, wrong) 
idx #wrong에서 몇번째꺼랑 match 되는지 index번호를 알려준다
replacements[idx]

ifelse(is.na(idx), "충청남도", "충청남도") #1
ifelse(is.na(idx), all, replacements[idx] ) #1

ifelse(all != "충청남도", "충청남도", "충청남도") #2


