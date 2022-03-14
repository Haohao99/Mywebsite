library("ggplot2")
iris = read.csv("iris.csv")

print(ggplot(iris, aes(x=sepal.length, y=petal.width)) + geom_point())