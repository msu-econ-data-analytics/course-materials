#Introduction to OLS and Regression Analysis in R

#OLS (Ordinary Least Squares) is the bread and butter of economics research.  Previously
#programs like STATA and SAS dominated economic analysis.  R has become the go to
#for people entering the field.  Today we are going to review some helpful packages
#and functions you will use for econometric analysis.  

#A few advanced topics will be introduced as well.  Most of these will not come
#into play in your education until later in the semester or the spring.  We will
#go over some basic coding and packages to cover:

#Fixed Effects
#Robust Standard Errors
#Clustered Standard Errors


#At the end of this tutorial there is a list of online resources to help you out 
#with R and general regression interpretation.



################################################################################

###lm() and go-to packages for OLS in R

#Let's begin with R's build in linear regression function lm().  This is a great 
#go to function for basic regression modeling.  


#Load the clean UN data we created in Lecture 2, it should be saved in your R_practice folder.

load("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/clean_un_data.RData")




#Suppose we are interested in how years of schooling impacts life expectancy across
#different countries.  Let's run the regression equation:



#life_expectancy = schooling_expected + e

#Where e is the error term. Call this reg_1 and use the following the format:

#name_of_regression = lm(dependent_variable ~ explanatory_variables, data = data_set)





#It is good practice to label your regression equations. Later on this will be helpful 
#in creating output tables that summarize your findings.  The '~' denotes the '='
#which separates your dependent variable on the left from the explanatory variables 
#on the right.  Think about a standard "y = x1 + x2 + ... + e" regression equation.




#Now write the regression that looks at the effect of the years of expected schooling
#on life expectancy.

reg_1 = lm(life_expectancy ~ schooling_expected, data = clean_un_data)

#To look at the results use the summary() function.

summary(reg_1)






#In the console you should see the regression output.  Can you interpret the effect
#of one additional year of schooling on life expectancy? What is the significance level?

#### One additional year of schooling corresponds with a 1.94 year increase in life
#expectancy, significant at the 99.999%+ confidence interval.


#Great job! This will be your go to regression function in R for basic regression modeling.
#When things get more complicated (dealing with clustered errors, fixed effects, etc.)
#other regression functions are easier to use.  







################################################################################

################################################################################

################################################################################

#The rest of the script is for you.  The material covered will come up as you work
#on econometrics projects, but not the data analytics class.  This is an overview 
#of useful packages and is by no means comprehensive. Check the notation for all
#functions for additional information.


################################################################################

################################################################################

################################################################################







###Fixed Effects (feols)

#Install the package "fixest" then load the library.

library(fixest)

#First let's run the regression equation we did above in the new function feols().
#Lable this reg_2 and run the summary command.

reg_2 = feols(life_expectancy ~ schooling_expected | varible, data = clean_un_data)
summary(reg_2)


#Wow! We get the exact same results as above.  lm(), feols(), and other ols regression
#functions should yield the same results when given the same equation.  Now let's 
#get into the advantage of this package, adding fixed effects.





#Adding fixed effects to a model controls for specific group means.  Think about average
#household incomes between states.  There are likely different group averages that
#should be taken into account when running a regression.  To incorporate fixed effects
#into feols() follow the format below:

#reg = feols(dependent_variable ~ explanatory_variables | fixed_effect_variable1 + fixed_effect2 + ..., data = data_set)

#The "|" tells feols() to control for the variables that come after it. 




#Let's do an example with our UN data.  First let's make up a group variable. Normally
#the fixed effect would be grouping within the data, in this case something like continent.
#Because that is not given here we are going to make one up. Make a repeating column
#of the numbers 1 - 3, call it group.

clean_un_data$group = rep(1:3, 62)

#Write a new regression equation controlling for group.Call this reg_3 and compare 
#the regression results to reg_2.

reg_3 = feols(life_expectancy ~ schooling_expected | group, data = clean_un_data)

summary(reg_3)

#Look at the difference in the regression outputs between the normal ols model and the
#fixed effects model.  Note that the intercept term has been removed. 





#Download the package "plm".

library(plm)


#Another function that can be used is the plm() regression function.  The format 
#is as follows:

#reg = plm(y ~ x + x2 + ... , data = data_set, model = "within", index = "fixed_effect_variable")


#plm() is a more versatile function than feols as you can specify various kinds of 
#controls and clustered errors.  Here setting 'model = "within"' tells R to run a
#fixed effects regression model where 'index = "fixed_effects_variable"' specifies what
#the fixed effect is.  


#Check out the notation on plm() to see how other model specifications can be made.








################################################################################
###Robust Standard Errors

#Robust SE are useful when addressing issues of heteroskedasticity. Robust SE are 
#larger than normal SE and can be calculated several different ways using the
#"sandwich" formula.  You will go over this in detail later in econometrics.


#We will not use data to go over these commands.  Here I will introduce you to the
#structure of the different functions.

#Install and load the packages "sandwich" and "lmtest".

library(sandwich)
library(lmtest)





#There are many ways to set robust se in R.  Here we will begin by specifying a 
#regression equation.

#reg = plm( y ~ x + x2 +..., data = dataset)


#Now plug your regression equation, reg, into the function coeftest().

#coeftest(reg)

###OR

#coeftest(reg, vcov = vcovHC(reg, type = "HC0"))



#The first line of code is the default robust standard error function.  The second
#allows for greater specification.  The section of code 'vcov = vcovHC()' allows 
#you to set the kind of robust standard errors you want to use.  



#vcovHC stands for "Heteroskedasticity-Consistent Covariance Matrix Estimation" where
#the following specification in 'type' are different kinds of robust SE:

#type = c("HC3", "const", "HC", "HC0", "HC1", "HC2", "HC4", "HC4m", "HC5")

#Check out the following link (page 4) for a better description of what these
#are and when to use them.

#https://cran.r-project.org/web/packages/sandwich/vignettes/sandwich.pdf







################################################################################
###Clustered Standard Errors 

#Clustered SE are a subset of Robust SE that are useful when dealing with groups. 
#Think students within different classes, longitudinal survey data, samples from 
#different countries, etc.


#Adding clustered SE to a regression equation:

#coeftest(reg, vocv = vcovHC(reg, type = "HC0", cluster = "group" ))

#Here you need to specify that the 'type = "HCO"' and 'cluster' is set to 
#your grouping/cluster level.


#To replicate STATA results for clustered SE set 'type = "sss"'.





################################################################################

##########################         Resources     ###############################

################################################################################


#Regression Interpretation:

#Linear - Linear, Linear - Log, Log - Linear, Log - Log
#https://sites.google.com/site/curtiskephart/ta/econ113/interpreting-beta


#Understanding Output
#https://www.statology.org/read-interpret-regression-table/




