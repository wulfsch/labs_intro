install.packages("geodata")
library(ggplot2)
library(geodata)

county_borders <- gadm(country = "Germany", level = 2, path = ".")
county_borders <- sf::st_as_sf(county_borders)

ggplot() +
  geom_sf(data = county_borders) +
  coord_sf() +
  theme_bw()