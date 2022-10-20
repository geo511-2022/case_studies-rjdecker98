#Bobby Decker
#GEO511
#Case Study 07
#10/20/2022

#load libraries and data
library(tidyverse)
library(reprex)
library(sf)

library(spData)
data(world)

#plot
ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)

#reprex
reprex(venue="gh")