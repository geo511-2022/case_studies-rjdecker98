#load library
library(ggplot2) 
library(dplyr)
library(gapminder)

#load dataset
data(gapminder)

#remove Kuwait from gapminder dataset and assign to new variable
gap_filter <- filter(gapminder, !country == "Kuwait") 

#plot
ggplot(gap_filter, aes(lifeExp, gdpPercap, color = continent, size=pop/100000)) +
  geom_point() +
  facet_wrap(~year,nrow=1) +
  scale_y_continuous(trans = "sqrt") +
  labs()
