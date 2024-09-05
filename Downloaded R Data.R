install.packages('tidyverse')
library('tidyverse')

install.packages('janitor')
library('janitor')

raw_elections_data <-
  read_csv("table_tableau11.csv")

# We have read the data from the AEC website. We may like to save
# it in case something happens or they move it.
write_csv(
  x = raw_elections_data,
  file = "table_tableau11.csv")

view(raw_elections_data)
