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

#Step5 #Quoting something from the table,the code below is tentative
inline_text(income_table, variable = "age_bir")

#Step 6 Trying figure

library(ggplot2)
tidy(logistic_model, conf.int = TRUE, exponentiate = TRUE) |>
	tidycat::tidy_categorical(logistic_model, exponentiate = TRUE) |>
	dplyr::slice(-1) |> # remove intercept
	ggplot(mapping = aes(x = level, y = estimate,
											 ymin = conf.low, ymax = conf.high)) +
	geom_point() +
	geom_errorbar() +
	facet_grid(cols = vars(variable), scales = "free", space = "free") +
	scale_y_log10()

#Step7 Figure

install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(readr)
library(dplyr)

#Creating a new dataframe for my histogram

#Sample code
home_data <- read_csv(
	"https://raw.githubusercontent.com/rashida048/Datasets/master/home_data.csv",
	col_select = c(price, condition)
)

# 7A PROPER Creating a new dataframe for my histogram
sodium3 <- read_csv(here::here("mdata", "sosonew.csv"))

#7B CREATING HISTOGRAM
#Sample code for histogram

ggplot(data = home_data, aes(x = price)) +
	geom_histogram()

#7B Simple Histogram of Blood pressure
ggplot(data = sodium3, aes(x = BP)) +
	geom_histogram()

ggplot(data = sodium3, aes(x = Sodium)) +
	geom_histogram()


#7C Anoda Histogram of Blood pressure with more features

#Summarizing a stat for the histogram sample code
price_stats <- home_data |>
	summarize(mean_price = mean(price))
price_stats

#7Ci summary stat i created
price_stats <- sodium3 |>
	summarize(mean_BP = mean(BP))
price_stats

#Applying the summary stat
ggplot(home_data, aes(x = price)) +
	geom_histogram() +
	geom_vline(aes(xintercept = mean_price), price_stats, color = "red", linewidth = 2)


#7Cii Applying some edits to my histogram use this or 7Ciii
ggplot(sodium3, aes(x = BP)) +
	geom_histogram() +
	geom_vline(aes(xintercept = mean_BP), price_stats, color = "red", linewidth = 2)


#7Ciii Anoda colour to histogram
ggplot(sodium3, aes(x = BP)) +
	geom_histogram() +
	geom_vline(aes(xintercept = mean_BP), price_stats, color = "blue", linewidth = 6)



#8 Applying renv, after the first innit, always check status and snapshot when you use a new package and endeavor to update it and commit

#ALWAYS MAKE CHANGES IN THE LOCAL REPO BFR COMMITING NOT DOING SO DIRECTLY FROM THE REPO
 #Fixing those wahala dem
 #git pull --no--ff
 #git config --global pull.rebase true
 #git pull origin --rebase

