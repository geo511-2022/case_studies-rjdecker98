#load library
library(tidyverse)

# define the link to the data - you can try this in your browser too.  Note that the URL ends in .txt.
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"

#the next line tells the NASA site to create the temporary file
httr::GET("https://data.giss.nasa.gov/cgi-bin/gistemp/stdata_show_v4.cgi?id=USW00014733&ds=14&dt=1")

#download the data
temp=read_table(dataurl,
                skip=3, #skip the first line which has column names
                na="999.90", # tell R that 999.90 means missing in this dataset
                col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))

#create plot
ggplot(temp, aes(YEAR, JJA)) +
  geom_line(size=0.75, color = "blue") +
  geom_smooth(size=1.75, color="red") +
  labs(
    title = "Mean Summer temperatures in Buffalo, NY",
    subtitle = "Summer includes June, July, August 
    Data from the Global Historic Climate Network
    Red line is a LOESS smooth",
    x = "Year",
    y = "Mean Summer Temperatures (C)"
  )

ggsave(
  filename = "mean_summer_temp_buffalo.png",
  plot = last_plot(),
  device = png(),
  scale = 1,
  width = 1920,
  height = 1080,
  units = c("px"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL,
)

