library(networkD3)
library(tidyverse)

head(MisLinks) #source, target, value
head(MisNodes) #name, group, size 

nodes <- data.frame(
  name = c("김정원", "신혜정", "이혜미", "박소영", "배여운"), 
  group = c(1,1,1,1,2), # 색으로 구별되는 값
  size = c(30, 10, 5, 40, 20)
)

edges <- data.frame(
  source = c(0,1,2,3,4), # node의 ID : 0부터 시작한다
  target = c(2,3,4,1,1),
  value = c(10, 3, 5, 8, 20)
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
