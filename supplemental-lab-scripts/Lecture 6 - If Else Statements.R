### If - Else Statements

#If statements and if - else statements are a useful tool in R.  They allow value-specific
#code to be run quickly.  This may be handy if you need to analyze data differently 
#based on categorical variables, assigning categorical variables to different numeric values,
#coding dummy variables, and more.  

#Before we start we need to discuss the different ways if - else statements can be
#coded.  There are 4 different commands in R, each with a slightly different connotation.

#if: A statement that begins a chuck of code if a condition is met.

#else: A statement that begins a chunk of code if the condition is not met.

#else if: A statement that specifies a new condition and new code if the first condition
          #if false.  

#ifelse(): This is a FUNCTION, not a statement.  This is used when you want to
           #check the condition for EVERY ELEMENT in a VECTOR. 


#There are subtle differences here that are important when coding, you will see 
#examples of all these different commands below.  



################################################################################

###A basic if statement

#An if statement is a conditional statement that only works if the data meets a 
#specific specification.  The general format of an if statement:

#if(data input and condition to be met){

  #what you want to function to do 

#}

#Note that after if you use  () and for the action {}.


#Let's do an example, code x = 10

x = 10


#Now lets make an if statement that prints "Ten" if the number is equal to 10.

if(x == 10){print("Ten")}

#You should see "Ten" printed in the console after the line of code.  It is important
#that you use '==' instead of '=', this specifies that something is equal to a specific
#as opposed to being assigned a value.  The quotation make around "Ten" are also needed.
#R will think "Ten" is an object without them. Now try this with y = 9.
  
  
y = 9

if(y == 10){print("Ten")}


#If you run the above code nothing is printed in the console because  y is not equal 
#to 10.


################################################################################
###If - Else Statements

#If else statements follow the same pattern as above with the addition of another
#action that can be applied to the data/values put into the if-else statement.
#The format:



#if(data input and condition to be met){

#   what you want to function to do

#   } else {

#   what you want the function to do if the first condition is not met

#   }



#BE CAREFUL WITH YOUR BRACKETS.  Notice that the original 'if' has a set of curly
#brackets that ends after the first statement and the 'ifelse' has a separate set
#of curly brackets that ends after the second statement.  


#Now let's make a statement that prints "Ten" if the value is == 10, and "Not Ten"
#otherwise. Test it for both x and y.

if(x == 10){
  print("Ten")
  } else {print("Not Ten")}


if(y == 10){
  print("Ten")
} else {print("Not Ten")}

#Great work! 

################################################################################
###Seeing if an element is present using an if-else statement


#Rather than single values see if this if-else statement can pick out whether
#the number 10 is present in a vector.  Code the vectors v = c(3, 7, 10, 10, 9)
# and z = c(1, 2, 3, 4).

v = c(3, 7, 10, 10, 9)

z = c(1, 2, 3, 4)

#Now in the 'if' condition use the following syntax: if(10 %in% vector_name).
#%in% tells R to look at all the elements in a vector.

if(10 %in% v){
  print("Ten")
} else {print("Not Ten")}


if(10 %in% z){
  print("Ten")
} else {print("Not Ten")}


#The same %in% and if else statement can be applied to categorical lists.

words = c("Ten", "Orange", "bike")

if("bike" %in% words){print("There is a bike.")}


################################################################################

###If - Else - If Statements

#Time to get crazy. You can add multiple if statements into an if else statement
#to specify different outcomes for different values.

#For the follow if else statement we want it to print "Ten" if the value is 10,
#"Three" if the value is 3, and "Other" if the value is neither 10 or 3. Notice that
#'x' appears twice in this statement.  Try this for x, y, and w = 3.

w = 3

if(x == 10){print("Ten")} else if(x == 3){print("Three")} else print("Other")

if(y == 10){print("Ten")} else if(y == 3){print("Three")} else print("Other")

if(w == 10){print("Ten")} else if(w == 3){print("Three")} else print("Other")


#Nice work! 

################################################################################

###Using Ranges in if - else statements

#Suppose we want to see if a value lies in a range of numbers.  For this we need 
#to introduce additional specifications in the if statement.  Using 'x', 'y', and
#'w' let's see which are between 5 and 10 but are not equal to 5 and 10.

if(x > 5 & x < 10){print("in range")} else {print("out of range")}
if(y > 5 & y < 10){print("in range")} else {print("out of range")}
if(w > 5 & w < 10){print("in range")} else {print("out of range")}


#Notice how only 'y' is in the range.  

#Now lets try it again for anything between or equal to 5 and 10.

if(x >= 5 & x <= 10){print("in range")} else {print("out of range")}
if(y >= 5 & y <= 10){print("in range")} else {print("out of range")}
if(w >= 5 & w <= 10){print("in range")} else {print("out of range")}


#Now 'x' and 'y' are in the specified range.


################################################################################

###Using the ifelse() function 

#As discussed earlier the ifelse() function allows us to apply an if else statement
#to a vector.  Using the vectors 'v' and 'z' from above see if any of their elements 
#are equal to 10. Check the notation for the ifelse statement in the 'Help' window.

ifelse(v == 10, T, F)

ifelse(z == 10, T, F)


#Here we set the yes and no arguments equal to T and F (the default shorthand for 
#true and false in R).  Looking at the output you can see that v does contain values
#equal to 10.  Look at the vector 'v' again, see how the order of the 10's matches
#the order of the T/F output.

#The ifelse() function will be incredibly important when it comes time to code binary 
#variables.  In the exercise section we will go through examples of how to code binary variables.

################################################################################
################################################################################
#RECAP

#if - else statements specify a condition and then perform an action if that 
#   condition is met.

#if - else statements can contain multiple conditions and subsequent actions.

#if(){} else{} is VERY picky about brackets.  


#if - else statements provide a single output, while the ifelse() function will
#   show results for every element in a vector.

#The ifelse() function is very helpful in setting up binary variables. 

################################################################################
################################################################################


################################################################################

#########################         Exercises         ############################

################################################################################


###Exercise 1

a = c(1,2,3,4,5,6)

b = c(6,6,7,8,8,10)

c = c("orange", "lemon", 8, 6, "cat")

d = c("bird", "horse", "mom", "dad", "dog")

#Create an if-else statement that confirms (T/F) if the vectors above contain the element 6.

ifelse(6 %in% a, T, F)

ifelse(6 %in% b, T, F)

ifelse(6 %in% c, T, F)

ifelse(6 %in% d, T, F)

#Create an if-else statement that prints "Cat Lady" if a vector contains the element "cat".
#If the vector does not have "cat", have it print "Dog Person".

if("cat" %in% a){print("Cat Lady")} else print("Dog Person")

if("cat" %in% b){print("Cat Lady")} else print("Dog Person")

if("cat" %in% c){print("Cat Lady")} else print("Dog Person")

if("cat" %in% d){print("Cat Lady")} else print("Dog Person")



###Exercise 2: Using if-else statements in data to create new variables.

#If else statements can be useful in creating categorical variables in data sets.
#We will walk through how to create a variable with multiple categories.  

#Load the Student.xlsx data set.

library(readxl)

students = read_xlsx("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/Students.xlsx")

#We want to assign letter grades to all students in the class for both reading and
#math.  We will need five if statements for the letter grades: A, B, C, D, and F.
#So far we have only done if - else statements with single outputs but for this 
#we need to record all of the grades for each student.  To keep the output we will
#create two new variables in the data set "grade_math" and "grade_reading".



students$grade_math = if_else(students$Math >= 90, "A",
  
     if_else(students$Math < 90 & students$Math >= 80, "B",
      
     if_else(students$Math < 80 & students$Math >= 70, "C",
      
     if_else(students$Math < 70 & students$Math >= 60,"D",
      
     if_else(students$Math < 60,"F", "NA")))))


#Note: There are five ')' at the end of this because every category is it's own
#if- else statement.


#Do this again for the reading grade but include +/- grades for the A, B, C grades
#(+ for a > 96, 86, 76, - for < 93, 83, 73).  Anything below a 70 is a failing grade (F).



#Make a new variable that averages the two grades together (numeric not letters), apply the if-else
#statement from the math class to this average to determine the students overall 
#performance.  How many students are passing with a B or above?





###Exercise 3: Coding Binary Variables.

#A binary variable takes on the value of 1 or 0 (1 for yes, 0 for no).  This is a 
#common type of variable that comes up with yes/no statement responses and or inclusive/exclusive
#exclusive categories.  The general format for coding a binary variable using ifelse() is:

#dataset$new_variable_name = ifelse(dataset$variable_in_data == some value, 1, 0)

#Here a variable is created by creating an if-else statement where an existing variable
#must meet a condition (== some value).  If the variable meets the condition it is
#coded as a 1, if not a 0.

#NOTE: The condition does not need to be '==', it can be >, <, >=, <=, or != (NOT EQUAL).

#NOTE: The order of the 1 and 0 matters.



name = c("Murray", "Bear", "Martin", "George", "Lucy", "Twinkles", "Muffin", "Mocha", "Mitts", "Jadon")

sex = c("M", "M",  "M",  "F",  "F",  "F",  "M",  "M",  "F",  "M") 

age = c("8", "9", "4", "1", "2", "11", "14", "1", "3", "5")

animal = c("dog", "cat", "dog", "cat", "cat", "cat", "dog", "dog", "dog", "bird")

pets = cbind(animal, name, sex, age)

pets = as.data.frame(pets)

#The data above is all of the pets above is from a small vet clinic.  Unfortunately,
#the clinic changed records systems and lost some of it's client data.  The clinic 
#needs information on the type of animal (cats, dogs, and birds) along with a re-coded
#variable for sex.

#Re-code the variable sex as a binary where 1 is female and 0 is male.  Name this
#new variable 'female'.  

pets$female = ifelse(pets$sex == "F", 1, 0)


#Binary variables need to be created for each individual animal species.  Create
#three variables named "cat", "dog", and "bird". (i.e. cat is equal to 1 when the
#animal is a cat, 0 otherwise.)

pets$dog = ifelse(pets$animal == "dog", 1, 0)

pets$cat = ifelse(pets$animal == "cat", 1, 0)

pets$bird = ifelse(pets$animal == "bird", 1, 0)


#The vet needs to schedule special appointments for older pets.  Any pet over the 
#age of 10 needs to be recorded as elderly.  Create a binary variable named elderly.

pets$age = as.numeric(pets$age)

pets$elderly = ifelse(pets$age > 10, 1, 0)

pets

