#This lecture uses the "Creating Functions" tutorial cited below:
#https://swcarpentry.github.io/r-novice-inflammation/02-func-R/

#And the "R for Data Science" written by Hadley Wickham and Garrett Grolemund:
#https://r4ds.had.co.nz/functions.html


################################################################################

#Functions

#In R you have already been exposed to established functions either available in
#base R or downloaded packages.  Here we will learn how to create our own functions.
#Writing functions allows you to create personalized commands that speed up your
#data analysis process.


#So when should you write a function? A good rule of thumb for function writing is
#if you have to copy a chunk of code more than twice.  Writing functions can help 
#you avoid simple mistakes.


################################################################################

#Let's start off with a simple one.  Look at the function below that converts
#Fahrenheit to Celsius.

fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

#This is what's going on:

fahrenheit_to_celsius <- function(temp_F) {
  
  #Here we create fahrenheit_to_celcius and let R know that we are coding a function.
  
  # ' <- function(temp_F) ' assigns the function to be specified in the following
  #lines. In the brakets (temp_F) assigns the arguments, aka what the function needs
  #to know in order to work.  
  
  temp_C <- (temp_F - 32) * 5 / 9
  
  #This line defines what the function will do with the temp_F argument. 
  
  return(temp_C)
  
  #Tells the function to print the temp_C result. NOTE: This is not a necessary
  #step. R will automatically returns the last variable in the body of the function.
}


#Let's try this function out for the values 32, 77, and 200.

fahrenheit_to_celsius(32)

fahrenheit_to_celsius(77)

fahrenheit_to_celsius(200)

#Nice work! Notice that when you start to type in the function's name it automatically
#appears in the list of possible functions.

################################################################################


#########################         Exercise 1        ############################


################################################################################

#Suppose we want to get Fahrenheit to Kelvin. It's easier to get to Kelvin from Celsius.
#The conversion from C to K is C + 273.15. Write a function, named celsius_to_kelvin,
#define the function argument as temp_C. 

celsius_to_kelvin = function(temp_C) {
  
  temp_K = temp_C +273.15
  
  return(temp_K)
}

#Confirm that the function works, 0 C should be 273.15 K.

celsius_to_kelvin(0)



#Now let's combine the functions we have created to get from Fahrenheit to Kelvin.
#Create the function fahrenheit_to_kelvin, the argument of the function should be
#temp_F.

fahrenheit_to_kelvin = function(temp_F){
  
  temp_C = fahrenheit_to_celsius(temp_F)
  
  temp_K = celsius_to_kelvin(temp_C)
  
  return(temp_K)
}



#Test this with the freezing point of water (32 F should be 273.15 K).

fahrenheit_to_kelvin(32)






################################################################################


#########################         Exercise 2        ############################


################################################################################

###Using functions to analyse data

library(ggplot2)

#A good practice in analyzing data is to plot your variables of interest before
#diving in.  Load the iris data set and plot all of the variables without writing 
#a function.

iris = as.data.frame(iris)

plot(iris$Sepal.Length)

plot(iris$Sepal.Width)

plot(iris$Petal.Length)

#.... and the rest.

#Create a function where the input is a data set and the output is graphs of all
#of the variables.


plot_variables = function(data){
  
  for(i in 1:ncol(data)){
    
    plot(data[ ,i])}
  }

plot_variables(iris)  




#Great work! Your assignment:

  #1: Alter the function above to include y axis variable names.

  #2: Add colors to the graphs where each flower species is a different color.

  #3: Use the pre-loaded R data set or a data set of your own to test the function.
  #   Does anything need to change for this function to be used on the data set you have 
  #   selected?



################################################################################


#########################         Exercise 3        ############################


################################################################################


#In the previous tutorial on loops we looked at code that allows your to upload multiple
#data sets at once.  Turn this code (shown below) into a function.


rent_files = list.files("C:/Users/ YOUR FILE PATH /rent_data", pattern = ".xlsx")
#Creates a list of all of the file names in that folder

rent_files
#File names 


for(i in 1:length(rent_files)){{}
  
  #For each file in the rent_files list
  
  assign(paste0("rent_",i),
         read_xlsx(path = paste0("C:/Users/ YOUR FILE PATH /", rent_files[i])))
  
  #Load the data set and name it rent_i(number), the assign function creates an independent data set for each file.
  #The assign function has two parts: assign(name of new data set, function and file name to load data set).
}






