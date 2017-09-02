#practice
#edge list로 데이터를 관리해서 네트워크로 연결시켜보기
# 1. 먼저 연결 데이터셋 만들기
# 2. 노드의 index 사전 만들기
# 3. 시각화


#텍스트 인코딩을 위해서 설정
par(family="NanumGothic")

mat_net <- rbind(c(1, 8),
                 c(2, 9),
                 c(3, 8),
                 c(4, 10),
                 c(5, 10),
                 c(6, 11),
                 c(7, 12))
mat_net2 <- network(mat_net, matrix.type = "edgelist")
network.vertex.names(mat_net2) <- c("문재인", "임종석", "박영선", "장하성", "안철수",
                                "박원순", "추미애", "경희대", "고려대", "서울대", 
                                "검정고시", "연세대")
summary(mat_net2)

gplot(mat_net2, 
      vertex.col = 7, 
      displaylabels = TRUE,
      label.border = TRUE)

#웹(d3.js와 같은 라이브러리) 네트워크에 맞게끔 어떻게 전달할 것인지 고민
as.matrix(mat_net2, matrix.type = "edgelist")
