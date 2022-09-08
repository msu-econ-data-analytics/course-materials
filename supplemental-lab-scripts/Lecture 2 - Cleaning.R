#Data Cleaning Basics

#Welcome to the 2nd lecture! In this tutorial we will cover installing packages,
#importing data, cleaning data, and saving altered data sets.  

#To start out let's think back to the functions we have used so far such as 
#summary(), rnorm(), max(), min(), and others.  To use these functions all you had 
#to do was type them into your code. They are included in what is known as base-R,
#the pre-programmed functions in R.  However there are millions of functions in 
#the R universe, created by thousands of individuals which allow us to perform 
#functions and calculations that would otherwise take a lot of time to figure out.
#To access these resources we need to install packages.

### How to install a package in R:
# 1. In the console type "install.packages()"
# 2. Type the package name into the brackets
# 3. Run the line of code

#That's it! It is an incredibly simple process that does not need to be repeated.
#Do not include the install.packages() command in your script, it is unnecessary.
#To access the downloaded package and it's commands use library(package_name).




#Let's give this a go.  This tutorial will focus on downloading data sets and 
#manipulating that data.  To begin let's download some packages for reading in 
#data sets. Install the packages in the console and then run the code below to 
#activate the packages for this R session.




library(readxl)
#   readxl: reads in excel files


library(foreign)
#   foreign: reads in data stored in Stata, SPSS, S, SAS, Epi Info, Minitab, Weka, and Systat


library(haven)
#   haven: downloads all tables covered by foreign, automatically downloads tables into 
#           data sets.



#Perfect! In this tutorial we will be using readxl. We will be using the UN Human Development
#Report data from 2020.  You can download this data set on the following page:
#https://hdr.undp.org/data-center/human-development-index#/indicies/HDI




#Step 1. Create a new folder on your computer named "R_practice"
#Step 2. Download the UN data to that folder

#Keeping your data organized will save you a ton of time and energy later on.

#Step 3. Find the file path name. Right click on the file and scroll down to properties.
#         There are two parts to the file path name the 'Location' and the 'File Name'.
#         I usually copy and paste these to avoid typos. 

#Step 4. Using the function read_excel from the readxl package type, in " ", the 
#         file location a / and then the file name.  If your location uses \ you
#         may need to replace these with /. REMEMBER: you need to end the file name
#         with the appropriate file type such as .xlsx, .Rdata, .csv, and so on.
#         Your code should look something like:





#un_data = read_excel("C:/Users/Your_Name/Desktop/R_practice/2020_Statistical_Annex_Table_1.xlsx")

un_data = read_excel("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/2020_Statistical_Annex_Table_1.xlsx")

un_data = as.data.frame(un_data)

#Try to run the summary() function on this data set.

summary(un_data)


#Tada! Take a look at the data, it is not pretty.  You will find that a lot of data
#you download is not in a usable format when you get it. The best way to learn how
#to clean data, is to clean data.  We will approach this step by step to get what is
#known as 'tidy' data.  We will get into the benefits of tidy data later on.  For now
#think of it as a data set that R can easily read and use for analysis.




#Step 1. Get rid of the empty spaces. (But not the true NA's)

#Think back to the tables you made in the first tutorial.  All of the columns were
#the same length and each had a clear title.  We want to get our data to look like that.
#Look at the data.  The first three rows are empty, several columns are mostly NA's, and the
#rows 197 and beyond are not related to the country data HDI data. (The last several
#countries do not have an HDI rank, so we will be removing them.)

#Let's clean it up.






################################################################################
#Getting rid of rows


#To remove rows from a table follow the format:

#new_data_frame = old_data_frame[-c(rows to be removed),]

#In the square brackets the area before the comma designates rows, after the comma
#columns.  We know that rows 197 onward are not needed, there are 270 observations.
#We will remove rows 197 - 270.

no_rows_un_data = un_data[-c(197:270),]


#Great work! Check the new data set.  Now let's get rid of the top three rows.

no_rows_2_un_data = no_rows_un_data[-c(1:3),]



#And now let's remove the columns without any data.  In this table we will remove
#4, 6, 8, 10, 12, and 14. The code for removing columns is similar to removing rows.

no_columns_un_data = no_rows_2_un_data[, -c(4, 6, 8, 10, 12, 14)]



#Wow! This data already looks much better.  Let's look at it some more. We still have
#some bad rows in there. But first let's fix the column names. The variable names are 
#in the 1st row instead of the title line. The variable names also have spaces, 
#which is not ideal for writing code. (If you ever run into this problem but can't / don't
#want to re-code the names putting ` ` around the name will let you write code with
#the spaces in there.)




################################################################################
#Naming columns

#We went through and assigned column names when we made data frames in the last
#tutorial.  Now we will learn how to re-name columns. The most common function for
#this is colnames(). To use colnames():

#colnames(data_frame) = c("list", "of", "new", "variable", "names")

#If there are more columns than new column names the remaining columns will keep 
#their old names.


#Let's rename our columns.  

colnames(no_columns_un_data) = c("HDI_rank_2019", "Country", "HDI_value", "life_expectancy",
                                 "schooling_expected", "schooling_mean", "GNI", "GNI_minus_HDI",
                                 "HDI_rank_2018")






#Yay! Now our columns have clear names and we can delete rows 1 - 4.


almost_clean_un_data = no_columns_un_data[-c(1:4),]





#There is one last thing to take care of.  There are three rows that designate
#subcategories in the table that are full of NA's.  We won't be needing these so 
#let's remove them.  We could use the row removal technique we know or we can use 
#the function na.omit(). na.omit() removes entries (rows) with missing data.  Be
#careful when using this function because you may want to keep certain missing values
#in your data.  Some missing values may be incorrectly recorded 0's or they may
#indicate important patterns in your data collection.  Here the only remaining NA's
#are in these rows.

clean_un_data = na.omit(almost_clean_un_data)



#Look at that data frame. Absoluteness gorgeous.  Now let's run summary().

summary(clean_un_data)



#NO! WHAT HAPPENED! Well it appears that instead of numbers our data is recorded
#as a character variable, so R is reading it like a string of letters and can't
#do any summary statistics on it.  (This is one of those moments you can feel smarter
#than the computer program.) To correct for this problem we will need to use the 
#function as.numeric() on the individual column names.  This code (shown below)
#is not particular efficient, writing out each numeric column conversion takes
#a bit of time.  This step can be streamlined by writing a loop, for now let's just
#brute force our way through this.  


clean_un_data$HDI_rank_2019 = as.numeric(clean_un_data$HDI_rank_2019)

clean_un_data$HDI_value = as.numeric(clean_un_data$HDI_value)

clean_un_data$life_expectancy = as.numeric(clean_un_data$life_expectancy)

clean_un_data$schooling_expected = as.numeric(clean_un_data$schooling_expected)

clean_un_data$schooling_mean = as.numeric(clean_un_data$schooling_mean)

clean_un_data$GNI = as.numeric(clean_un_data$GNI)

clean_un_data$GNI_minus_HDI = as.numeric(clean_un_data$GNI_minus_HDI)

clean_un_data$HDI_rank_2018 = as.numeric(clean_un_data$HDI_rank_2018)

summary(clean_un_data)






#This set can also be used to set numeric variables to character variables using
#the command as.character().  


#Run summary() again.

summary(clean_un_data)




#Yay! Now our data is ready to use! Let's make sure we don't have to go through 
#this cleaning process again and save our data to the same folder that we downloaded
#our data from.  When saving a new data set in R we can change the file type it 
#saves as.  Instead of saving this as an excel file we can save it as a Rdata file.
#This let's us upload the data without using a package in later programming sessions.





################################################################################
###Saving data

#To save a file in R:

#   1. Figure out where you want to save the file to and set this as your working directory.
#       Setting your working directory can/should be done at the beginning of each R session.
#       This will set a specific area of you computer that R will take files from and save
#       files to. Here we will use the same folder we saved the downloaded un data to, R_practice.  
#       You can save a file without setting a working directory but you will need to type out
#       the entire file path name.


#   2. Use the save() function.  save() follows the pattern:
#       save(object__you_want_to_save, file = "new_file_name.file_type")

#We will save this and name the new file clean_un_data.RData.
#The ".RData", will save this file as an R data set.  You can save the file in other
#formats by changing this suffix (.xlsx, .csv, ...). Alter the following code lines
#to save your data.



#setwd("the_path_to_your_R_practice_file")

#save(clean_un_data, "clean_un_data.RData")



setwd("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/dataset")

save(clean_un_data, file = "clean_un_data.RData")

#Great job! Now you have the basics to download, clean, and save data in R!











#RECAP
################################################################################

#Install packages in the console, not in your script.  Open them in your script
#using the library() command.

#Be diligent in organizing your R files, make folders and keep them clean.

#Set a working directory, setwd(), to streamline your opening and saving in R.

#When downloading data be aware of the file format and use the appropriate function
#to open them in R.

#ALWAYS look at your data once it is open in R, this will let you know what you need
#to do to clean it. Running the summary command is also recommended.

#Be systematic in how you clean your data.
#   1. Know what your data is, review the source and understand the variables.
#   2. Eliminate unneeded rows and columns. (Think blank spaces)
#   3. Make sure your variables have names.
#   4. Be aware of missing values in your data, look into the data source to think 
#       about what they mean and have justification to remove or keep them.
#   5. Save your files to keep your progress.











###############################################################################

###########################         Exercise         ##########################

###############################################################################



#For this exercise you will be using CDC WONDER data on multiple causes of mortality
#caused by external factors (car crashes, falling, being crushed by a tree ...)
#that has been uploaded to the class github page.  Download this data and open it 
#in R.  Note that this data is saved as a .txt file.  

#Find out which command is needed to open this file. Open the file and call it
#mortality.

mortality = read.csv("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/Multiple_Cause_of_Death_2018_2020_Single_Race.txt")


#Open the mortality data.  The formatting may not be quite right.  This is not your
#fault, just a quirk of the file format.  Use the internet to find what you need
#to add to the download command to fix the data.


#' header = TRUE' and ' sep = "\t" '.  This will automatically name the variables
#(header = TRUE) and allow R to identify how the data is separated in the .txt file
#(sep = "\t").


mortality = read.csv("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/Multiple_Cause_of_Death_2018_2020_Single_Race.txt",
                    header = T,
                    sep = "\t")




#Nice job, code alterations like the additions to the download command we did above are
#common.  Using web resources and consulting forums is the best way to figure out
#what you need to do.


#Look at the mortality data set.  Delete any rows or columns that contain non-data entries.

mortality_rows = mortality[-c(1125:1168),]

mortality_clean = mortality_rows[, -1]


#Find the average number of deaths by external causes in a state for Asian American men in 2018.
#(You will need to filter this data three times, consult the previous lecture exercises
#or use the internet.)

mortality_2018 = mortality_clean[mortality_clean$Year == 2018, T]

mortality_2018_asian = mortality_2018[mortality_2018$Single.Race.6 == "Asian", T]

mortality_2018_asian_men = mortality_2018_asian[mortality_2018_asian$Gender == "Male", T]

summary(mortality_2018_asian_men)


#The average number of external deaths in a given state for Asian Americans is 84.03.


#Which state has the largest population of Asian American men? Do this again without using code.

#California




###Challenge: consult online resources and each other to solve this problem. This 
#is a sneak peak at the work we will do in the next lecture using tidyverse.  Install the
#package tidyverse, load the library tidyverse.  The notation for this package is 
#quite different from what we have seen so far, take your time to look through example 
#code.


#Which female racial group had the most deaths in 2019?

#Hint: when using tidyverse look at the functions group_by() and mutate().

mortality_2019 = mortality_clean[mortality_clean$Year == 2019, T]

mortality_2019_F = mortality_2019[mortality_2019$Gender == "Female", T]








library(tidyverse)

women_deaths = mortality_2019_F %>%
  
  group_by(Single.Race.6) %>%
  
  mutate(total_deaths_by_race = sum(Deaths))

#In 2019 white women had the highest number of deaths by external causes in the US.

  




#Data Citation:

#Centers for Disease Control and Prevention, National Center for Health Statistics. 
#National Vital Statistics System, Mortality 2018-2020 on CDC WONDER Online Database, 
#released in 2021. Data are from the Multiple Cause of Death Files, 2018-2020, as 
#compiled from data provided by the 57 vital statistics jurisdictions through the 
#Vital Statistics Cooperative Program. Accessed at http://wonder.cdc.gov/mcd-icd10-expanded.html 
#on Jun 23, 2022 1:05:44 PM


