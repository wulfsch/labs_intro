library(tidyverse)

# Exercise 1

# a) How many flights have missing plane data?
flights |>
  dplyr::anti_join(planes, by = "tailnum") |>
  dplyr::count()

# b) Which airline has the most flights with unregistered planes?
flights |>
  dplyr::anti_join(planes, by = "tailnum") |>
  dplyr::count(carrier, sort = TRUE) |>
  dplyr::left_join(airlines, by = "carrier")


# Exercise 2
# a) Inspect the airports dataset
head(nycflights13::airports)
# or
dplyr::glimpse(nycflights13::airports)

# b) Add the airports table with the appropriate index
dplyr::copy_to(
  dest = con, 
  df = nycflights13::airports, 
  name = "airports",
  temporary = FALSE, 
  indexes = "faa"
)