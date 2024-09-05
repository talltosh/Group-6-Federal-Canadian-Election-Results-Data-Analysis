#### Preamble ####
# Purpose: Clean data for 2021 Canadian Federal Election
# Author: Group 6
# Date: 5/09/2024
# Prerequisites: tidyverse, janitor

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Reading in Raw Data ####
raw_elections_data <- read_csv("canadian_voting_raw.csv", show_col_types = FALSE)


#### Basic Cleaning ####
# Clean the column names
cleaned_elections_data <- raw_elections_data |> clean_names()

# Select only the columns of interest
cleaned_elections_data <- cleaned_elections_data |> 
  select(electoral_district_name_nom_de_circonscription, elected_candidate_candidat_elu)

# Rename the columns 
cleaned_elections_data <- cleaned_elections_data |> 
  rename(
    riding = electoral_district_name_nom_de_circonscription,
    elected_candidate = elected_candidate_candidat_elu
  )

# Separate the candidate name and party info
cleaned_elections_data <- cleaned_elections_data |> 
  separate(
    col = elected_candidate,
    into = c("Other", "party"),
    sep = "/"
  ) |> 
  select(-Other)

# change party names from French to English
cleaned_elections_data <- cleaned_elections_data |> 
  mutate(
    party = case_match(
      party,
      "Liberal" ~ "Liberal",
      "Conservateur" ~ "Conservative",
      "Bloc Québécois" ~ "Bloc Québécois",
      "Nouveau Parti Démocratique" ~ "New Democratic",
      "Vert" ~ "Green",
      .default = "Other"
    )
  )

# Save the cleaned data
write_csv(cleaned_elections_data, "cleaned_elections_data.csv")

