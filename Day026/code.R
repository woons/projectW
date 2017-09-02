#network visualization 공부
#install_github("DougLuke/UserNetR")
library(statnet)
library(UserNetR)

#1--------------------------------------------------
netmat1 <- rbind(c(0,1,1,0,0),
                 c(0,0,1,1,0),
                 c(0,1,0,0,0),
                 c(0,0,0,0,0),
                 c(0,0,1,0,0))

rownames(netmat1) <- c("A", "B", "C", "D", "E")
colnames(netmat1) <- c("A", "B", "C", "D", "E")
net1 <- network(netmat1, matrix.type = "adjacency")
class(net1)

summary(net1)
gplot(net1, vertex.col = 2, displaylabels = TRUE)

#2--------------------------------------------------
#edgelist기반으로 matrix => vertex name을 별도 merge
#2--------------------------------------------------

netmat2 <- rbind(c(1, 2),
                 c(1, 3),
                 c(2, 3),
                 c(2, 4),
                 c(3, 2),
                 c(5, 3))
netmat2
net2 <- network(netmat2, matrix.type = "edgelist")
network.vertex.names(net2) <- c("A", "B", "C", "D", "E")
summary(net2)

test1 <- as.sociomatrix(net1)
class(test1)
test2 <- as.matrix(net1, matrix.type = "edgelist")
test2

#기존의 network class의 데이터를 as.sociomatrix()를 통해서 edgelist의 matrix로 
#변환시키고 vertex.name과 갯수를 속성값으로 알려준다. 관리의 용이성 

#node attribute
set.vertex.attribute(net1, "gender", c("F", "F", "M", "F", "M"))
net1 %v% "alldeg" <- degree(net1)
list.vertex.attributes(net1)
summary(net1)

get.vertex.attribute(net1, "gender") #속성값 확인 첫번째 방법
net1 %v% "gender" #속성값 확인 두번째 방법
net1 %v% "gender" <- c("Male", "Female", "Male", "Male", "Female")
net1 %v% "gender"

#edge attribute
list.edge.attributes(net1)
set.edge.attribute(net1, "rndval", 
                   runif(network.size(net1), 0, 1))
list.edge.attributes(net1)
summary(net1 %e% "rndval")
summary(get.edge.attribute(net1, "rndval"))

netval1 <- rbind(c(0,2,3,0,0),
                 c(0,0,3,1,0),
                 c(0,1,0,0,0),
                 c(0,0,0,0,0),
                 c(0,0,2,0,0))

netval1 <- network(netval1, matrix.type = "adjacency",
                   ignore.eval = FALSE, names.eval = "like")

network.vertex.names(netval1) <- c("A", "B", "C", "D", "E")
list.edge.attributes(netval1)
get.edge.attribute(netval1, "like")

