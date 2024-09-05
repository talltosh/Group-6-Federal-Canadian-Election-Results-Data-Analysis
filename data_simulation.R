#### Preamble ####
# Purpose: Simulate data for 2021 Canadian Federal Election
# Author: Group 6 
# Date: 5/09/24
# Prerequisites: tidyverse, janitor packages

#### Workspace setup ####
install.packages("tidyverse")
install.packages("janitor")

library(tidyverse)
library(janitor)

#### Simulating Data ####
simulated_data <- tibble(
  "Riding" = 1:338,  # Canada has 338 ridings
  "Party" = sample(
    x = c("Liberal", "Conservative", "Bloc Québécois", "New Democratic", "Green", "Other"),
    size = 338,
    replace = TRUE
  )
)

print(simulated_data)

