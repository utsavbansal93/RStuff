#Classification - Decision Tree

library(rpart)
library(rpart.plot)

iris
str(iris)
head(iris)

library(dplyr)

sample_n(iris, 3)


ctree=rpart(Species~ ., method ='class', data=iris)
rpart.plot(ctree, nn=T)
names(iris)
rtree = rpart(Sepal.Length ~ Sepal.Width +Petal.Length + Petal.Width + Species, method ="anova", data=iris)
rtree
str(rtree)

plot(rtree)
rpart.plot(rtree, nn=T)



