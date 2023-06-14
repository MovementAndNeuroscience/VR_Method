# Paper Title: Developing Virtual Reality and Computer Screen Experiments One to One Using Selective Attention as a Case Study
# Rasmus Ahmt Hansen, Marta Topor 
# June 2023

#------------ Demographics of children who completed the VR and PC selective attention test

# Load Packages 
library(summarytools) 
library(dplyr) 
library(tidyverse) 
library(rstatix)

#Load the dataset that was produced from the big script
demo_data <- read.csv("demographics.csv", row.names = NULL) 

#make factor columns
demo_data$handedness <- as.factor(demo_data$handedness)
demo_data$sex <- as.factor(demo_data$sex)
demo_data$multilingual <- as.factor(demo_data$multilingual)
demo_data$school <- as.factor(demo_data$school)
demo_data$First_condition <- as.factor(demo_data$First_condition)


demo_included <- filter(demo_data, Included == 1)
demo_excluded <- filter(demo_data, is.na(Included))

# Summapry of the demographic data

#Which condition was completed first
#Included
  demo_included %>%
   group_by(First_condition) %>%
   summarise(unique_firsttry_count = n_distinct(id))
#Excluded
  demo_excluded %>%
    group_by(First_condition) %>%
    summarise(unique_firsttry_count = n_distinct(id))
   
#Schools 
#Included
  demo_included %>%
     group_by(school) %>%
     summarise(unique_firsttry_count = n_distinct(id))
#Excluded
  demo_excluded %>%
     group_by(school) %>%
     summarise(unique_firsttry_count = n_distinct(id))
   
#Gender
#Included
  demo_included %>%
     group_by(sex) %>%
     summarise(unique_firsttry_count = n_distinct(id))
  
#Excluded
  demo_excluded %>%
    group_by(sex) %>%
    summarise(unique_firsttry_count = n_distinct(id))

  
#Multilingual
#Included
  demo_included %>%
     group_by(multilingual) %>%
     summarise(unique_firsttry_count = n_distinct(id))
  
#Excluded
  demo_excluded %>%
    group_by(multilingual) %>%
    summarise(unique_firsttry_count = n_distinct(id))
   
#Age
#Included
age_included <- demo_included %>%
     distinct(id, age) 
mean(age_included$age, na.rm = TRUE)
#Excluded
age_excluded <- demo_excluded %>%
  distinct(id, age) 
mean(age_excluded$age, na.rm = TRUE)
       
   
   