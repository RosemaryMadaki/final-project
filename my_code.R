#Here you will find my codes.

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

#load broom package
library(broom.helpers)



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

#Step4 my regression table, NB, IT uses the gtsummary package Regression table
tbl_uvregression(
	sosonew,
	y = Sodium,
	include = c(BP, Patient,
							Sex, Site),
	method = lm)


#Step7 Figure
#Some of the packages used
install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(readr)
library(dplyr)



#7B CREATING HISTOGRAM
#7B Simple Histogram of Blood pressure
ggplot(data = sosonew, aes(x = BP)) +
	geom_histogram()






#####PERSONAL NOTES for TROUBLESHOOTING
#8 Applying renv, after the first innit, always check status and snapshot when you use a new package and endeavor to update it and commit

#Run renv::status() to make sure your project picked up the package as a dependency.

#Run renv::snapshot() to record that package in your lockfile.

#Open your lockfile and look for your new package. For example, mine now has:


#ALWAYS MAKE CHANGES IN THE LOCAL REPO BFR COMMITING NOT DOING SO DIRECTLY FROM THE REPO
 #Fixing those wahala dem
 #git pull --no--ff
 #git config --global pull.rebase true
 #git pull origin --rebase


