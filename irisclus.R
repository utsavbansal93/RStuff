head(iris)
irisFeatures = iris[-5] #remove last col
iriskm1 = kmeans(women, centers=3)
iriskm1$tot.withinss
iriskm1$size #no of rows in each class
iriskm1$cluster #row no to cluster
plot(women$height, col=iriskm1$cluster)
iriskm1$centers #characteristics of each cluster
iris()

library(NbClust)
nc = NbClust(women, distance = "euclidean", min.nc=2, max.nc=7, method ="average")
