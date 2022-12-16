#load package
library(ggplot2)

#load iris dataset
data(iris)

#summary of iris
summary(iris)

#get mean of species column
mean(iris$Petal.Length)

#make histogram of iris petal length
hist(iris$Petal.Length, labels = )

ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram() +
  facet_grid(. ~ Species) 

ggtitle("Iris Dataset")+
  theme(plot.title = element_text(hjust = 1))
