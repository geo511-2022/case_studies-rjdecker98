#load libraries
library(ggplot2) 
library(dplyr)
library(gapminder)

#load dataset
data(gapminder)

#remove Kuwait from gapminder dataset 
gap_1 <- gapminder%>%
  filter(country!="Kuwait")

#plot 1
gdp_life<-ggplot(gap_1,aes(lifeExp,gdpPercap,color=continent,size=pop/100000))+
  geom_point()+
  facet_wrap(~year,nrow=1)+
  scale_y_continuous(trans="sqrt")+
  theme_bw()+
  labs(
    title="Wealth and life expectancy through time",
    x="Life Expectancy",
    y="GDP per Capita",
    size="Population(100K)",
    color="Continent"
  )
#print plot
gdp_life

#export png
png("CS03gdp_life.png", width = 15, height = 7, units = "in", res = 300)
gdp_life
dev.off()

#create gapminder_continent
gapminder_continent = gap_1 %>% 
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop))) 

#plot 2
gdp_year<-ggplot(gap_1,aes(year,gdpPercap))+
  geom_line(aes(color=continent,group=country))+
  geom_point(aes(color=continent,group=country))+
  geom_line(data=gapminder_continent,aes(x=year,y=gdpPercapweighted))+
  geom_point(data=gapminder_continent,aes(x=year,y=gdpPercapweighted,size=pop/100000))+
  facet_wrap(~continent,nrow=1)+
  theme_bw()+
  labs(title="GDP Over Time by Continent",
       x="year",
       y="GDP per capita",
       size="Population (100k)",
       color="Continent")
gdp_year

#export second png
png("CS03gdp_year.png", width = 15, height = 7, units = "in", res = 300)
gdp_year
dev.off()