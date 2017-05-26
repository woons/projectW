# Day12 Exercise

### Issue

* Data Camp 'String Manipulation in R with stringr' course

* `stringr` 본격적으로 활용한 문자열 정제 

* `paste()`를 `str_c`로 변경과 그 효율성  
 +  `str_c()` differs to `paste()` is in its handling of missing values
 +  `paste()` turns missing values into the string "NA", 
 +   whereas `str_c()` propagates missing values. 

* `str_sub`은 **문자열 추출**

* `str_detect`, `str_subset`, `str_count`은 패턴이 필요
 + `str_detect()`는 `TRUE`와 `FALSE`로 반환
 + `str_subset()`은 pattern이 포함된 문자열을 문자로 반환
 + `str_count()`는 문자열의 해당 문자 개수 벡터로 반환