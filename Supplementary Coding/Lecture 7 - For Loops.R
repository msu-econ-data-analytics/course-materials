### For Loops

#For loops iterate a specific command over a set of numbers or data.  Because R 
#is a vectorized coding language this kind of iterative process is built into most 
#commands.  However, for loops are useful in creating more complex code that 
#repeats the same set of commands on multiple objects.  One example we will explore
#is how to use for loops to streamline data cleaning over multiple data sets.  

#For loops use the same structure as an if-else statement they have a specified
#object that they perform a specified command on. 


################################################################################
###Getting Stared: Vectorized Code vs. Loops

#To understand the basics of what a for loop does look at the code below:


number = c(1,2,3,4)

for(x in number){
  print(x*2)
}

#In this simple example the for loop takes every element in the number vector and
#prints that number multiplied by 2. The 'print' allows us to see the output.  This
#code will run without the print command but we can't see results.  Now lets try
#to multiple the vector number by 2.

number*2

#This is R's coding specialty. The loop process is done automatically when applying
#a function to a vector.


################################################################################
###Using Lists in For Loops

#Lists vs Vectors:

#   list: holds different kinds of data (i.e. can contain numeric, character, etc.) at the same time.
#         (Recursive)

#   vector: holds a single kind of data.
#           (Atomic)


#Using a list in a for loop is just as easy as using a vector.  The explanation
#given above is very simple but covers the general idea of the difference between
#lists and vectors (feel free to look for a more in depth understanding).  Using 
#for loops to iterate over lists is incredibly helpful in R.

#Let's check out the for loop using two lists below.  Here we want to combine every
#element in the adj list with the noun list.

adj = list("orange", "loud", "cute", 1)

noun = list("cat", "bird", "mouse")

for(x in adj){
  for(y in noun){
    print(paste(x, y))
  }
}

#The output for the above function gives every iteration of the two lists.  The 
#function 'paste()' allows us to combine the elements of the two lists together.
#Let's compare this for loop to the paste command on its own:

paste(adj,noun)


#Using the paste command without the loop combines every element in adj with noun.
#Because there are more elements in adj than noun, R recycles the first element
#from noun to connect it with the last element of adj.


################################################################################
###Nested For Loops

#So far we have created a basic loop and a slightly more complex loop that uses
#two different lists.  Now we will create an iterated for loop - a for loop that 
#references the same list/vector multiple times.  


#list_1 below contains the words cat, dog, and bird.  Suppose we wanted to repeat
#every word in the list twice (cat cat, dog dog, bird bird).


list_1 = c("cat", "dog", "bird")


for(i in list_1){
  #Chooses one word from the list above
  
  for(j in i){
  #Creates another element, j, that is equal to the word chosen above.  
    
    print(paste(j,i))
    #Prints the words pasted together
  }
}

#Here we referenced the element 'i' two times in the loop.  




#Let's work through another example. Suppose we wanted to repeat a multiplicative
#process over the numbers 1 through 4.  First, run the code below that multiplies
#each element 1,2,3,4 by 1,2,3,4.

for(i in 1:4){
  
  for(j in 1:4){
    
    print(j*i)
  }
}

#There should be 16 numeric outputs. 

#Now let's suppose we wanted to run a similar multiplicative process but with a 
#twist.  We want to multiply each element in 1,2,3,4 by a less than or equal value.
#(For example: 1*1, 1*2, 2*2, 1*3, 2*3, 3*3, ....)

for(i in 1:4){
  
  for(j in 1:i){
    
    print(j*i)
  }
}

#This time there are 10 numeric outputs.  In the code above notice how 'i', which
#specifies an element (number 1 - 4) appears twice.  To 'read' this code out loud:


#"For each number,i, between 1 and 4, take that number and multiply by a number 
#between 1 and 4 of equal or lesser value."


################################################################################
###Breaks, Next Statements, and If- Else Conditions in For Loops


#Now it is time to combine if-else statements with for loops along with two new 
#commands, break and next, to create specialized iterative loops.  This may seem 
#like a lot to add all at once but it ends up being more or less intuitive.  


###Breaks
#break: stops a loop when a condition is met.

#Suppose we want to print the list of numbers below.  However we only want to print
#the numbers until the number 4 appears.

ex_1 = c(1,2,3,4,3,2)

for(i in ex_1){
  if(i == 4){
    break
  }
  print(i)
} 


#The combination of the if statement and the break command says: if an element, i,
#is equal to 4 stop printing.


###Next

#next: skips an element in an iteration when a condition is met and moves onto the next element.  

#Now let's print the same list of numbers as before except this time we want all
#the numbers not equal to 2.  The break ended loop, the next command will let us 
#stop the loop when an element is equal to 2 but restart it afterwards.  

for(i in ex_1){
  if(i == 2){
    next
  }
  print(i)
}

#Here the output contains all of the element in ex_1 not equal to 2.  


################################################################################
###Example: Using a for loop for loading data and data cleaning.  


###Loading Data Using For Loops

#One useful aspect of using for loops in R is cleaning data for analysis.  In this
#example we will be using three data sets for rent in a small town.  


library(readxl)

###SET WORKING DIRECTORY


#Step 1: Create a list

#To download and iterate over multiple data sets you need to make a list of data
#sets.  As mentioned earlier a list can contain multidimensional elements (a vector cannot).
#To get set up we need to figure out how to create this list:

#Option 1: Download the data sets into R and then make the list:

#Option 2: Create a loop to download the different data sets into R as a list:  


rent_files = list.files("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/rent_data", pattern = ".xlsx")
  #Creates a list of all of the file names in that folder
rent_files
  #File names 


for(i in 1:length(rent_files)){{}
  
  #For each file in the rent_files list
  
  assign(paste0("rent_",i),
  read_xlsx(path = paste0("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/rent_data/", rent_files[i])))
  
  #Load the data set and name it rent_i(number), the assign function creates an independent data set for each file.
  #The assign function has two parts: assign(name of new data set, function and file name to load data set).
}




################################################################################

###Cleaning data using for loops


#Step 2: Append the data sets

rent = as.data.frame(rbind(rent_1, rent_2, rent_3))




#Step 3: Clean the data

#Now that you have your spiffy new data set all ready to go let's do a little bit
#of data manipulation.  





#Suppose we find out that certain responses were recorded that we don't want.  
#We only want entries of people renting apartments (i.e. rent == 1). Rather than \
#manually removing the rows let's speed this up with a loop.

#NOTE: A quicker alternative to this would be filtering the data and creating a 
#new data frame. 



















