#Transpose and Pivots

#A necessary tool in data cleaning is formatting the data in a way that R can 
#perform the necessary analysis.  So far we have worked with data sets stored in
#a format that allows R to read and process them easily.  Unfortunately, not all
#organizations that store data do so with analytics in mind.  Today we will focus
#on transposing data and pivots.  Pivots change the table structure of the data.


#Open the following libraries

library(readxl)
library(tidyverse)


################################################################################
###Identifying the Problem


#First let's look at an example of data stored in an unusable format. Load hospital_patients
#into R, open, and look at the data.

hospital_patients = read_xlsx("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/hospital_patients.xlsx")

hospital_patients = as.data.frame(hospital_patients)

#This data looks fairly clean, but we need to change a few things.  

#See what happens when you attempt to find the summary statistics for the variables.

summary(hospital_patients)

#R understands that columns are variables and rows are observations, not the other
#way around.  To properly assess the data we need to change the structure so that
#The days are the observations and the measurements taken on those days are the 
#variables.  


################################################################################
#Transpose

#First let's go over a transpose. The best way to understand what a transpose does
#is to see how it changes the data.  Using the hospital_patients data use the function
#t().

new_hospital_patients = t(hospital_patients)

#Looking better! Let's do a little more cleaning.

#Fix column names

colnames(new_hospital_patients) = c("Cardiac", "Emergency", "Annual", "Imaging", "ENT")

#Remove first row

new_hospital_patients = new_hospital_patients[-c(1),]

new_hospital_patients = as.data.frame(new_hospital_patients)


#Our data frame is only character variables not numeric, let's change this.

new_hospital_patients$Cardiac = as.numeric(new_hospital_patients$Cardiac)

new_hospital_patients$Emergency = as.numeric(new_hospital_patients$Emergency)

new_hospital_patients$Annual = as.numeric(new_hospital_patients$Annual)

new_hospital_patients$Imaging = as.numeric(new_hospital_patients$Imaging)

new_hospital_patients$ENT = as.numeric(new_hospital_patients$ENT)

#Great work! compare the original data to the transposed data.  You can see that
#all we did was "flip" the data so the old columns are the new rows and vice versa.
#A transpose changes the structure of the table but not the data itself. More or less
#it makes it so we can correctly interpret the data from a table oriented the wrong way.

#Try summary now that the data is reorganized.

summary(new_hospital_patients)

#Now summary gives us the column summaries for the individual categories, not the
#daily summary over the different categories.




################################################################################
###Pivots: Example 1 Pivot Wider

#For this section we will be following the tidyverse tutorial on pivots:
#https://tidyr.tidyverse.org/reference/pivot_wider.html

#Tidyverse has some pre-loaded data sets.  Open the data set "fish_encounters" and
#look at the data.

fish_encounters = as.data.frame(fish_encounters)

#This data set shows the number of fish seen at different fishing stations.  The
#data lists the kind of fish as a number.  You can see that there are individual
#observations for the fish encountered at each station.  This isn't particular useful.
#It would be better to see one row with each fish and the stations that it is seen
#at (like a check list of where that particular type of fish has or hasn't been seen).

#To do this we are going to use a tidyverse function called pivot_wider().  Here the
#data is very long, but not wide.  By specifying the stations as columns out data
#will become wider - have more columns than it does now.


#####   #####   #####   #####   #####   #####   #####   #####   #####   ##### 
#How to use the pivot functions.

#The pivot functions are a bit more confusing than the other functions we have 
#learned so far because we are restructuring the data frame (changing the data
#within the data frame). In the pivot wider function we are adding variables.
#To do this we need to specify where we are getting the new variables from AND
#where are data is going to come from. Using tidyverse formatting:

#fish_encounters %>%
#   pivot_wider(names_from = **current column where you are getting the new columns**, 
#               values_from = **current column where you will get your data from**)



#####   #####   #####   #####   #####   #####   #####   #####   #####   ##### 

#This may be a bit confusing to read to let's get into the example.

#Make columns for the individual stations, take the data from the column "seen".

wider_fish = fish_encounters %>%
  pivot_wider(names_from = station, values_from = seen)

#Check out the new data.  Here the table shows the kind of fish (number) and the 
#different stations where its been seen.




#The big take away here is that we can restructure our data to make it more useful
#to us as the analysts.  

################################################################################
###Pivots: Example 2 Pivot Wider


#In this example we are going to try to get state level estimates of rent and income.

#To start out let's look at the data:

us_rent_income = as.data.frame(us_rent_income)

#We have two observations for each state, one rent and the other income, we want to
#consolidate this into one observation per state.  In order to do this we need
#to set rent and income into variables. However, we already have two variables,
#'estimate' and 'moe'(margin of error) that have corresponding values for rent and income.  

#We need to restructure this data so that the 'estimate' and 'moe' correctly line up
#with the rent and income observations.  Let's walk through this.

#Take the us_rent_income data and pivot wider using 'variable' as the names_from
#selection. This time we will use BOTH 'estimate' and 'moe' in values_from.

new_us = us_rent_income %>%
  pivot_wider(
    names_from = variable,
    values_from = c(estimate, moe))

#Great work! Now when we look at the data we have one observation per state that
#gives us both the estimate and moe for rent and income.


################################################################################
###Pivots: Example 1 Pivot Longer

#For this section we will be following the tidyverse tutorial on pivots:
#https://tidyr.tidyverse.org/reference/pivot_longer.html

#Pivot longer does more or less the opposite of pivot wider. Let's look at the 
#tidyverse data set of religion and income

relig_income = as.data.frame(relig_income)

#Lets restructure this so that the income brackets are a single column with multiple
#observations per religion. Take a careful look at the following code:

longer_relig_income = relig_income %>%
  pivot_longer(!religion, 
               #Removes religion from the pivoted variables, allows us to have multiple observations.
               
               names_to = "income",
               #Gives the column of income brackets a new name.
               
               values_to = "count"
               #Uses the data from the table and sends it to its new spot in the data frame.
               )


#Look at the new data.




################################################################################
################################################################################
###RECAP:

#Transpose: "Flips" the table but does not change the data structure.

#Pivot Wider:  Takes categories from data in the table and makes them columns.

#Pivot Longer: Takes variables and restructures the data so that they become observations.

#Pivots are very useful in data cleaning. Hopefully you will not need to use them
#very often.  The steps you need to take to correctly pivot data are highly dependent
#on the data you are working with and the type of analysis you want to do.

################################################################################

#For additional examples on pivots please check out the links given at the beginnings
#of the pivot wider and longer sections.



