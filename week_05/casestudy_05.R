#Bobby Decker
#GEO511
#case_study_05


#load libraries
library(spData)
library(sf)
library(tidyverse)
library(units)
library(ggplot2)

#load 'world' data
data(world)

#load 'states' data
data(us_states)

#albers
albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

#transform world data 
world_canada <- world %>%
  st_transform(world, crs = st_crs(albers)) %>%
  filter(name_long == "Canada") %>%
  st_buffer(dist = 10000)
             

#transform states data 
states_ny <- us_states %>%
  st_transform(us_states, crs = st_crs(albers)) %>%
  filter(NAME == "New York") 


#create border 
border_ny <- st_intersection(world_canada, states_ny)

#plot
ggplot(states_ny) +
  geom_sf() +
  geom_sf(data = border_ny, fill = "red") +
  theme(legend.position = "none", plot.title = element_text(size = 20)) +
  labs(
    title = "New York Land within 10km" 
  ) 
  
#area of border
area <- st_area(border_ny) %>%
  set_units(km^2)

#print area
area

