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
#Step1 loaded the package tidyverse in order to use the readcsv option
library(tidyverse)

#Step2 loading my A NEW dataset, the step below worked
sosonew <- read_csv(here::here("mdata", "sosonew.csv"))

#Step 3 Creating Table 1, descriptive statistics table

#Step 3a, load gtsummary package
library(gtsummary)

#Step 3b REAL, try the code for the table below for descriptive table

tbl_summary(
	sosonew,
	by = Sex,
	include = c(Sodium, BP, Site))

#Use this table as it is finer. Code for another descriptive table excluding sodium variable
tbl_summary(
	sosonew,
	by = Sex,
	include = c(BP, Site))

#Adding labels to my table, SAMPLE CODE
tbl_summary(
	nlsy,
	by = sex_cat,
	include = c(sex_cat, race_eth_cat, region_cat,
							eyesight_cat, glasses, age_bir),
	label = list(
		race_eth_cat ~ "Race/ethnicity",
		region_cat ~ "Region",
		eyesight_cat ~ "Eyesight",
		glasses ~ "Wears glasses",
		age_bir ~ "Age at first birth"
	),
	missing_text = "Missing")


#load broom package
library(broom.helpers)

#3c, My final descriptive table with label
tbl_summary(
	sosonew,
	by = Sex,
	include = c(BP, Site),
	label = list(
		BP ~ "Blood Pressure",
		Site ~ "Location"
	),
	missing_text = "Missing")|>
	add_p(test = list(all_continuous() ~ "t.test",
										all_categorical() ~ "chisq.test")) |>
	add_overall(col_label = "**Total**") |>
	bold_labels() |>
	modify_footnote(update = everything() ~ NA) |>
	modify_header(label = "**Variable**", p.value = "**P**")

#3CII or stick to this simple format for my descriptive table
tbl_summary(
	sosonew,
	by = Sex,
	include = c(BP, Site),
	label = list(
		BP ~ "Blood Pressure",
		Site ~ "Location"
	),
	missing_text = "Missing")


#Step4 Regression table
#sample code for linear model
tbl_uvregression(
	nlsy,
	y = income,
	include = c(sex_cat, race_eth_cat,
							eyesight_cat, income, age_bir),
	method = lm)

#Step4 my regression table, NB, IT uses the gtsummary package Regression table
tbl_uvregression(
	sosonew,
	y = Sodium,
	include = c(BP, Patient,
							Sex, Site),
	method = lm)

