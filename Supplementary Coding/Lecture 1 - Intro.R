#Introduction to R

#The Basics

#R is a powerful analytically tool capable of performing complicated procedures on 
#large data sets.  When learning R, it may be helpful to think of the program as 
#a TI-89 calculator on your laptop. Like a TI-89, R can be used as a calculator 
#and graphing software. However, R can also be used to perform advanced statistical 
#analysis, machine learning, geo-spatial analysis, and much more. Similar to 
#figuring out a TI-89 in high school, becoming proficient in R will take time, 
#practice, and inevitably a lot of googling.


#One of the things that makes R such an effective and efficient tool is that everything
#in R is vectorized.  Vectorized code means that operations (+,-,x,/,... and more)
#can be performed simultaneously on multiple values without needed to loop the 
#code (more on this later).


#NOTE: to run lines of code in R you can use the 'Run' button on the upper left-hand
#corner of this window OR run code line by line using the keys 'ctrl' + 'enter.'

#NOTE: for more information on any function we run, type ?function_name() into the
#console for an explanation of what it does and how to use it.



################################################################################
#### Creating and Using Vectors


#Let's work through an example. To make a simple vector of four values (1 - 4):

a = (1:4)

a = c(1,2,3,4)

a


#Alternatively you can code a vector of numbers individually by using the code:
#a = c(1,2,3,4)
#This may be helpful if you need a vector of non-consecutive numbers.


#We have given this vector the name 'a', this will make it easier to use the 
#vector in calculations. You can always write out the vector or value without 
#assigning it a name, but it becomes more complicated to re-write the vectors/values 
#as things become more complex. 

#Now let us multiply this vector by 2
a*2

#In your console the output will show our original vector a where every value 
#in a has been doubled. Create a second vector of values 5 - 8 and call it b.  
#Multiply this by a

b = (5:8)

a*b

#Here every value in a has been multiplied by its corresponding value in b.
#Now let us create a larger vector of all integers 1 - 100 and call it c.

c = (1:100)

#Let's figure out the summary statistics for c. Using the function summary().

summary(c)

#Great Job! You just used your first function in R! R has many built in functions
#and others that need to be downloaded using 'packages'.  But more on this later.
#The mean and median for should be 50.50.  Additional summary statistics 
#(minimum, 1st quartile, 3rd quartile, maximum) are also provided.  

#In addition to summary(), additional functions mean(), max(), and min() can also
#give you useful summary statistics. 



################################################################################
###Vectors and Random Number Generation

#Now what if we want a vector or 4 random numbers (taken from the normal distribution)? 
#Use the function rnrom() and assign a vector of 4 numbers to the letter d. Find 
#the summary statistics.

d = rnorm(4)

summary(d)

d

#The function rnorm() randomly selects values from the normal distribution. This 
#means that every time you run the function a different selection of values will be made.

#Type ?rnorm() into the console for a better understanding on the different types
#of random number generation and specifications you can make.

#What if we want to make sure we all get the same numbers to check our results?
#In order to do this we use the function set.seed().  In this function we set the
#starting value of the random number generating sequence, this is called a 'seed'.
#If we all set the same seed, we should see the same results. Let's set the seed to 101.

set.seed(101)

e = rnorm(4)

e
e

#Check with your neighbor to make sure you have the same output.

#NOTE: if you re-run e = rnorm(4) you will get a different selection of numbers
#because you are re-selecting the numbers.  If everyone does this we will all get 
#the same numbers but they will not be the same as the first selection. The main
#benefit of set.seed is to be able to replicate work to ensure the code is running 
#correctly / no errors were made.




################################################################################
###From Vectors to Data Analytics

#Now I am sure you are wondering how you are going to use this information in 
#econometric/statistical analysis.  Well let us look back at the summary statistics
#of 'a' and 'b'.

a
b

#What if 'a' was the number of girls attending a summer camp  on a given day
#and 'b' was the number of boys? Let's create the vector 'total', the total of 
#all kids attending the camp.

total = a + b

total

#Now let's rename 'a' and 'b' to 'girls' and 'boys', respectively.

girls = a

boys = b

#Let's turn this mess of vectors into a data table we can use using cbind().
#cbind() is a function that attaches vectors (or columns when thinking about tables)
#together to create new data tables. 

attendance = cbind(girls, boys, total)

#Go into the environment and open attendance. You should see three columns in the
#same order that you wrote them in the cbind() function. You can also view attendance
#in the console.

attendance


#Now let's try the summary function on attendance.

summary(attendance)

#Look at that! Three sets of summary statistics for the three variables (columns)
#that we created!  



#Now let's try something a bit different.  What if the number of girls was not
#counted correctly? How would we go about re-coding the table? To begin create
#a new vector with the numbers (4, 12, 7, 3), name this vector girls_2.

girls_2 = c(4, 12, 7, 3)



#Now we need to replace the column girls with girls_2 in the table.  One way to
#do this is re-creating the attendance table. First we need to re-do the total column.

total_2 = girls_2 + boys

attendance_2 = cbind(girls_2, boys, total_2)

attendance_2








#Now let us look at a single column in the table.  To do this we use:
#table_name$column.  The '$' selects a specific column from a table. Select the 
#boys column.

attendance$boys

boys

#You should get the error term "$ operator is invalid for atomic vectors".  Why 
#is this? R is picky about how data is stored. The table we created is a collection
#of vectors which limits what we can do when coding in R.  The atomic designation 
#R gives to the columns in the table makes it impossible to view the contents of 
#the vectors through the table, you have to look at the vectors themselves.  While
#this doesn't seem like a big deal now, not being able to pull up variables/columns
#from specific data sets you download will cause you a lot of trouble.

#To solve this issue we need to convert our table into a data frame.  The function t0
#do so is as.data.frame().  Let's remake our attendance table as a data frame and
#name it attendance_df.

attendance_df = as.data.frame(attendance)

attendance

attendance_df

attendance_df$boys




#Now we have our boys column! Next let's select the third value from the boys column.

attendance_df$boys[3]

attendance_df[3,2]

#Great job! Earlier we replaced the entire girls column, now let's change this one
#entry for the boys column from 7 to 11. To do this we need the row and column numbers
#of the value we want to replace.  The row for this value is 3 and the column number 
#for boys is two. Check and see the location of this value if you do not understand
#how we got these numbers.

attendance_df[3,2] = 11

attendance_df$boys



#Now let's add one more column to this data frame called counselors, for the number
#of camp counselors working that day.  

attendance_df$counselor = c(4,4,2,5)



#Coding the counselor variable this way bypasses creating a vector and then adding it
#to the table.  If you wanted to first create a vector and then add it to the table
#the code would be:

counselor <- c(4,4,2,5)

attendance_df$counselor = counselor


#Now what if the first two days of the camp actually had 3 counselors instead of 4?
#To re-code multiple values in a table in R use the form:

attendance_df$counselor[attendance_df$counselor == 4] = 3




#This looks complicated (and a bit redundant) but what R is doing is calling the 
#column in the data frame (attendance_df$counselor), taking the column and finding 
#the values we are interested in changing ([attendance_df$counselor == 4]) and then
#reassigning three to all rows in that column that were listed as fours (= 3). 

#Please note that if you have entries that are fours that do not need to be changed
#you will need to use the earlier method and change the entries individually as shown below.


attendance_df[1:2,4] = 6

attendance_df[c(1,2), 4] = 8

#The ':' changes all numbers between those two values, 'c(#,#,#,#...)' replaces specific 
#numbers that are not consecutive.  





#RECAP
################################################################################

#R uses vectors to preform operations quickly on multiple values.

#Vectors can be created by assigning a letter or word to a string of numbers.

#Vectors can be created using random normally distributed numbers with the 
#function rnorm().

#The function summary() gives summary statistics.  

#Using as.data.frame() to create a data frame from a table will give you more 
#flexibility when coding in R.

################################################################################

#########################         Exercises         ############################

################################################################################



### Exercise 1.

#You need to find the average temperature and most common kind of weather in a town
#over the last 100 days.  We will create this data. The different types of weather 
#are 1. sunny, 2. cloudy, 3. partial sun, 4. rain, 5. hail.



#Create 3 vectors of length 100.  

#The first vector are the values 1 - 100, name it days. (Use ':')

days = c(1:100)

#The second vector is a repeating sequence of 1 through 5. The code for repeating
#sequences looks like vector_name = rep(repeating_numbers, #_of repetitions). 
#Write a line of code that repeats 1 - 5 twenty times. Name this vector weather.

weather = rep(1:5, 20)


#The third vector is a random sample of values.  Set the seed to 0.  Now go the the 
#console and type: ?rnorm . For n put 100, mean = 20, and sd = 5. Name this temp. 

set.seed(0)

temp = rnorm(100, 30, 5)


#Combine the columns into a table and make this table a data frame.  Name the data 
#frame w_report (short for weather report) and find the summary statistics.

w_report = cbind(days, weather, temp)

w_report = as.data.frame(w_report)

summary(w_report)



#What is the average temperature? What kind of weather did they have on the 66th day?

#The average temperature is 30.11 degrees.

#On the 66th day they had sunny weather.



################################################################################

### Exercise 2

#There are five elementary school classes going to a summer camp.  Ms. 1's class has
#14 girls and 10 boys, Mr. 2's class has 10 girls and 15 boys, Mr. 3's class has 3 girls
#and 16 boys, Ms. 4's class has 17 girls and 4 boys, Mr. 5's class has 12 girls and 12 boys.

#Create a data frame with a column for:
# 1. All of the different classes called class. Named class.
# 2. The number of girls in a class. Named girls.
# 3. The number of boys in a class. Named boys.
# 4. The total number of children in each class. Named total.


#Answer the following.
# Find the class with the most students and the class with the most boys. 
# What is the average number of girls in a class?


#REMEMBER: The ordering of the numbers in the columns matter.  

class = c(1:5)

girls = c(14, 10, 3, 17, 12)

boys = c(10, 15, 16, 4, 12)

total = girls + boys

summer_camp = cbind(class, girls, boys, total)

summer_camp = as.data.frame(summer_camp)

summer_camp

#The class with the most students in class 2.  The class with the most boys is class 3.  

summary(summer_camp$girls)

#The average number of girls in a class is 11.2.


#Half way through the camp it starts raining and several of the kids go home. 
#   8 boys from the 1st class go home.
#   3 girls from the third class go home.
#   4 girls and 4 boys from the fourth class go home.
#   Everyone from the second and fifth classes stays.


#Go back and correct the numbers in the table.  What is total of all the kids remaining
#at the camp? (Remember: to call a specific column from a table use table$column, the 
#function sum() will be helpful to use.)

summer_camp[1,3] = 2
summer_camp[3,2] = 0
summer_camp[4,2] = 13
summer_camp[4,3] = 0

summer_camp

summer_camp$total = summer_camp$girls + summer_camp$boys

summer_camp

sum(summer_camp$total)

#The total number of kids left at the summer camp is 94.



################################################################################

### Exercise 3


#A university in Montana made a billing mistake.  Certain students over- or 
#underpaid their tuition for the semester.  The university is issuing refunds to
#students to correct for this issue.  The students are from four major cities in
#Montana.  

#Create a data frame with 2 columns. Have one column be a random selection from 
#the normal distribution, with length 200, a mean of 100, sd of 7.5.  Set seed equal to 50.
#Call this refund. Have the other column be the sum of the random sample (given below) and
#the first column.  The second column is also 200 entries, name this savings. 

#The code for selecting a random sample of certain numbers is given below.  In this
#case the code randomly selects integers between 50 and 5000.

selection = sample(c(50:5000), 200)


set.seed(50)

refund = rnorm(200, 100, 7.5)

savings = refund + selection

df_1 = cbind(refund, savings)

df_1 = as.data.frame(df_1)


#Create a second data frame with 2 columns. Have the first column be a repeating
#column of the names "Bozeman", "Missoula", "Helena", and "Billings".  This is 
#coded the same way you would do a numeric entry, the only difference is the words
#need to have "" around them.  Call this column city.  The second column is a random
#selection (same seed) with a mean of 500 and sd of 200.  Call this column bills.  

city = rep(c("Bozeman", "Missoula", "Helena", "Billings"), 50)

bills = rnorm(200, 500, 200)

df_2 = cbind(city, bills)

df_2 = as.data.frame(df_2)

#Combine the data frames, name this student_debt. (If you run into an issue with
#numeric vs. character column designations look at the function as.numeric().)

student_debt = cbind(df_1, df_2)

summary(student_debt)

student_debt$bills = as.numeric(student_debt$bills)

summary(student_debt)

#Now that the data frames are combined create a new column that subtracts savings
#from bills, call this debt. Calculate the average debt held by students.  What 
#is the smallest and largest refund received by a student?

student_debt$debt = student_debt$savings - student_debt$bills

summary(student_debt)

#The average amount of debt held by a student is $498.19.  The largest refund
#received by a student was $120.01, the smallest was -$629.40.




### Challenge - there is no code given for this section.  Use the internet and other
#resources to answer the question. **Packages will be discussed in the next section,
#you are welcome to use them if you want.  It is possible to answer the question without
#them.**

#Subset the data frame by city. Which city has the largest average debt? What city
#does the student with the smallest debt live in? the largest?

bozeman = student_debt[student_debt$city == "Bozeman", T]

missoula = student_debt[student_debt$city == "Missoula", T]

helena = student_debt[student_debt$city == "Helena", T]

billings = student_debt[student_debt$city == "Billings", T]

summary(bozeman$debt)
summary(missoula$debt)
summary(helena$debt)
summary(billings$debt)

#The city with the largest average debt is Bozeman.  The student with the largest 
#debt lives in Helena, the smallest lives in Billings.  







