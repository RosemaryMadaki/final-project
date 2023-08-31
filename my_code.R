#start of my work

#reading in my data

#Step1 loaded the package tidyverse in order to use the readcsv option
library(tidyverse)

#Step2 loading my data, the step below worked
sodium <- read_csv(here::here("mdata", "sodium.csv"))

#Step 3 Creating Table 1, descriptive statistics table
#Step 3a, load gtsummary package

library(gtsummary)

# tbl_summary(
	#nlsy,
	#by = sex_cat,
	#include = c(sex_cat, race_eth_cat, region_cat,
							#eyesight_cat, glasses, age_bir))

#Step 3b, try the code for the table below

tbl_summary(
	sodium,
	by = Patient,
	include = c(Sodium, BP))

#BEGIN HERE!!!!!
#Step2 loading my A NEW dataset, the step below worked
sosonew <- read_csv(here::here("mdata", "sosonew.csv"))

#Step 3b REAL, try the code for the table below for descriptive table

tbl_summary(
	sosonew,
	by = Sex,
	include = c(Sodium, BP, Site))
