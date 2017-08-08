library(networkD3)

nodes <- data.frame(
  name = c("유재석", "정준하", "박명수", "하하", "양세형"), 
  group = c("MBC","MBC","KBS","SBS","SBS"), # 색으로 구별되는 값
  size = c(30, 10, 5, 40, 20) # node의 크기
)

edges <- data.frame(
  source = c(0,1,2,3,4,0), # node의 ID : 0부터 시작한다
  target = c(2,3,4,1,1,1),
  value = c(10, 3, 5, 8, 20, 10) # Edge의 굵기
)

forceNetwork(Links = edges, 
             Nodes = nodes, 
             Source = "source",
             Target = "target", 
             Value = "value", 
             NodeID = "name",
             Nodesize = "size",
             radiusCalculation = "Math.sqrt(d.nodesize)+3",
             Group = "group", 
             opacity = 1, 
             legend = TRUE,
             bounded = TRUE,
             opacityNoHover = TRUE,
             zoom = TRUE, 
             arrow = TRUE,
             fontFamily = "NanumGothic",
             linkDistance = 75)

MisNodes
