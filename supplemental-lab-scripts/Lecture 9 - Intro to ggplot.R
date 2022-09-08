#Introduction to ggplot

#Good data visualizations are key in analysis and presentation.  Graphing your data
#can help you spot errors and abnormalities in the cleaning process. Providing 
#clear visual explanations will communicate your findings better than any speech.
#Today we will be learning the package ggplot2(), the most versatile and customizable
#graphing package in R.

library(tidyverse)
################################################################################

###The Basics

#Install the package ggplot2

library(ggplot2)

#To begin open up the pre-loaded R data set 'mpg'.  This is a data set of different
#car makes and models.

mpg = mpg

#The syntax of ggplot can be a bit confusing.  Let's say we want to graph the highway (hwy)
#and city (cty) mileage of the cars in this data set to see if there is a relationship
#between the two. We will call this graph1.

#Follow the code below:

graph1 = 
#Assign name to plot
  
  ggplot(mpg, aes(x = cty, y = hwy)) +
  #This is the first ggplot command.  ggplot(data, aes( x = variable, y = variable))+
  #aes or aesthetic assigns the data to be used for the x and y axis.
  
  geom_point()
  #geom_point() makes this a scatter plot (it plots points). NOTE: you must use the
  # '+' sign after ggplot() command to specify the graph type (geom aka geometry).

graph1


#Looking at our graph (appears in the 'Plots' window) we see that cty is on the
#x axis and hwy is on the y.  The points (evenly spaced because the data uses
#whole numbers for mileage) show a positive relationship between city and highway 
#mileage.



#Now let's turn this into a line graph.

graph2 = ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_line()

graph2

#Not very pretty.  Here we see that ggplot is trying to connect every point.  This
#is useful for graphs where there is a 1:1 relationship between x and y observations
#but here it looks a little ugly.


#What if we wanted to see a trend line, a line that shows the general relationship
#between the city and highway mileage?

graph3 = ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_smooth()

graph3

#Nice job! the more you play around with the geom_XXXX() specifications the more
#you'll learn about the different kinds of graphs you can make with ggplot.


#In ggplot you can 'stack' different geometries onto the same graph.  For example,
#suppose we want to put the trend line on top of the points from graph1.  

graph4 = ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()+
  geom_smooth()

graph4


#Great work! By using the '+' you can add multiple layers to your plots.  



#Categorical graphs

#Now let's try a box plot.  A box plot shows a single variable, plot this graph
#specifying that x = hwy in the aes argument.

graph5 = ggplot(mpg, aes(x = hwy)) +
  geom_boxplot()

graph5

#Redo the graph above, change aes to y = hwy

graph6 = ggplot(mpg, aes(y = hwy)) +
  geom_boxplot()

graph6


#When graphing a single variable, changing the y/x axis specification flips the
#direction of the graph.  


#Now let's add some detail to this graph.  A major benefit of categorical graphs
#(box plots, histograms, etc.) is comparing different groups.  Remake the graph5
#from above but this time add y = manufacturer to the aes argument.

graph7 = ggplot(mpg, aes(y = hwy, x = manufacturer)) +
  geom_boxplot()

graph7

#Wow! Now we are able to visually the different highway mileage of cars my manufacturer!

#Switch the x and y axis.

graph8 = ggplot(mpg, aes(x = hwy, y = manufacturer)) +
  geom_boxplot()

graph8

#Nice job!  



################################################################################

###Adding Labels

#Taking graph1 let's spruce up the axis labels, label this graph graph_labels

graph_labels = 
  ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()+
  labs(x = "City Mileage", y = "Highway Mileage")

graph_labels


#Beautiful!  The addition of labs() allows us to add axis names, titles, and more
#to our plots. Look up labs() in the help bar for additional commands.  

#Add the title "Cars: Highway and City Mileage" to the graph

graph_labels = 
  ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()+
  labs(x = "City Mileage", y = "Highway Mileage", title = "Cars: Highway and City Mileage")

graph_labels



################################################################################

###Colors

#Now let's add a visual distinction for the car manufacturer to the graph.  To do
#let's color code the points for each car manufacturer.


graph_color = 
  ggplot(mpg, aes(x = cty, y = hwy, color = manufacturer)) +
  geom_point()

graph_color

#Wow! Look at all those colors.  In addition to the color coded points a legend
#was created on the right side of the table that shows which color corresponds
#to each manufacturer.  

#The color scheme shown in the graph above is the default ggplot color scheme.  
#There are many more color palettes that can be selected.  You can also manually
#enter in colors through their names or RBG color density specification (don't worry
#about this last one too much).



###RColorBrewer

#Now let's repeat what we did above using some of the color palettes from the
#RColorBrewer package. (Install the package 'RColorBrewer')

library(RColorBrewer)

#Look up RColorBrewer in the 'Help' window.  The following link shows the different
#color palettes included in RColorBrewer:

#https://r-graph-gallery.com/38-rcolorbrewers-palettes.html

#Let's make a new scatter plot that is color coded by car class.

graph_class = 
  ggplot(mpg, aes(x = cty, y = hwy, color = class)) +
  geom_point()

graph_class

#Nice work! Now let's switch up the color palette to RColorBrewer's "Paired".

graph_class_color = 
  ggplot(mpg, aes(x = cty, y = hwy, color = class)) +
  scale_color_brewer(palette = "Paired")+
  
      #To specify the palette with this package you must add the scale_color_brewer
      #argument to your code.  This will change depending on the color palette you use.
  
  geom_point()

graph_class_color


###Issues with RColorBrewer

#RColorBrewer is an excellent option for color coding categories in ggplot2.  However there
#are a few draw backs.  Recreate the graph above color coding by year with the 
#"Paired" color palette specification.

graph_year_color = 
  ggplot(mpg, aes(x = cty, y = hwy, color = year)) +
  scale_color_brewer(palette = "Paired")+
  geom_point()

graph_year_color


#Here we see an error message.  The color palette is unable to be combined with
#the given variable.  RColorBrewer specializes in discrete color coding, the variable
#year appears as a continuous variable.  


#Looking at the page link above notice that there are a set number of colors 
#(maximum 12) in the given palettes.  Going back to out earlier graph where color
#is assigned to car manufacturers, apply the "Paired" color palette.

graph_color_paired = 
  ggplot(mpg, aes(x = cty, y = hwy, color = manufacturer)) +
  scale_color_brewer(palette = "Paired")+
  geom_point()

graph_color_paired

#Here we receive a warning message (the plot is still produced) that the "Paired"
#color palette does not have enough colors for all of our manufacturing categories.
#As a result we see that the last 3 manufacturers are not graphed.



###Vidiris

#There are many color palettes to download into R for different graphing effects.
#One that is particularly appealing is the vidiris package.  Install the vidiris
#package.  

library(viridisLite)

#For the different color palettes:
#https://sjmgarnier.github.io/viridisLite/reference/viridis.html


#The vidiris package contains several ascetically appealing color schemes, with
#options that cater to color blind individuals.  A major plus of the vidiris package
#is that the color schemes can be applied to continuous variables and well as discrete.

#Redo the graph that color codes by year, specifying the vidiris color palette 'turbo'.


graph_manufacturer_vidiris = 
  ggplot(mpg, aes(x = cty, y = hwy, color = manufacturer)) +
  scale_color_manual(values = turbo(15))+
  
  #Notice that (15) is specified after turbo.  Because we are applying a continuous
  #color scheme to a discrete variable we need to specify how many different colors
  #it needs to select.
  
  geom_point()

graph_manufacturer_vidiris



################################################################################

###Themes

#We have data, colors, and now its time to add the overall graph design (aka theme). This is 
#an important part of creating your graph that can make or break it's visual appeal.

#Going back to graph1:

graph1

#Everything shown on graph1 is the default for ggplot2. In this graph it looks ok,
#the most important thing is that the data is shown clearly.  But let's play around
#with it and see if we can get it a bit more fashionable. 

#A list of themes in ggplot2:
#https://ggplot2.tidyverse.org/reference/ggtheme.html

#Here we will be using some short hand on changing the themes for graph1.  Note that
#this is equivalent to adding '+ ______' in the code

#Basic
graph1 + theme()
#Note that theme(), theme_get(), theme_gray(), theme_grey(), theme_update() are the same

#Black and White 
graph1 + theme_bw()
#theme_light() is very similar

#No grid lines
graph1 + theme_classic()

#Nothing
graph1 + theme_void()


#There are many more themes you can choose to customize your graph.  A good rule of thumb
#for adding a theme is to avoid grid lines, they make the graph look messier and can
#complicate it's interpretation.


################################################################################

###Adding Vertical and Horizontal Lines

#Let's go back to our graph 'graph_labels'.  Suppose we want to add
#a visual cut off for cars that have city mileage above 25 mpg. To do this we will
#add a vertical line to our graph.

graph_vline = graph_labels + geom_vline( xintercept = 25)

graph_vline

#We can change the width and color of the line to make it pop.

graph_vline = graph_labels + geom_vline( xintercept = 25, color = "red", size = 1.5)

graph_vline


#Horizontal lines can be added as well.  

graph_hline = graph_labels + geom_hline(yintercept = 30, color = "blue", size = 1.5)


graph_hline

#These graphs can be combined.

graph_lines = graph_labels +
  geom_vline( xintercept = 25, color = "red", size = 1.5) + 
  geom_hline(yintercept = 30, color = "blue", size = 1.5)

graph_lines




###############################################################################

###########################         Exercises         ##########################

###############################################################################

#Exercise 1:

#Load clean_un_data.  Create a graph that shows expected years of education and the 2019 HDI rank.
#Call this un_hdi, make it a line graph.

load("C:/Users/Laura/Dropbox/Data Analytics Supplementary Lectures/datasets/clean_un_data.RData")

un_hdi = ggplot(data=clean_un_data, aes(x = HDI_rank_2019, y = schooling_expected)) +
  geom_line()

un_hdi


#Add appropriate x and y axis labels, a title, and caption.

un_hdi = un_hdi + labs(x = "2019 Human Development Index Rank", 
               y = "Years of Expected Schooling",
               title = "Human Development Index and Years of Epected Shooling",
               caption = "The Human Development Index ranks counties on standard of living and quality of life metrics.  1 is the highest ranking.")


#Add a line that distinguishes 12 years of schooling.

un_hdi = un_hdi + geom_hline(yintercept = 12, color = "red", size = .75)

un_hdi



#Exercise 2: 

#Troubleshoot the following code:


#Graph 1:


iris = iris

iris_1 = ggplot(iris, aes(x = Sepal.Length, x = Species, fill = Species)) +
  scale_fill_brewer(palette = "Accent")
  labs(x = "Flower Species", y = "Sepal Length (cm)", title = "Sepal Length by Flower Species")+
  theme_classic()+
  geom_boxplot()

iris_1




#Graph 2: 

starwars = starwars

starwars_tat = starwars %>%
  filter(homeworld == "Tatooine")

starwars_nab = starwars %>%
  filter(homeworld == "Naboo")

starwars_home = rbind(starwars_tat, starwars_nab)



ggplot(starwars_home) +
  
  aes(x = height, colour = homeworld) +
  
  geom_histogram(bins = 15L, fill = "#112446") +
  scale_colormanual(
    values = c(Naboo = "#C00693",
               Tatooine = "#25D1FD")) +
  
  labs(x = "Height",
       y = "Count",
       title = "Height: Characters from Tatooine and Naboo",
       color = "Homeworld") 
  
  theme_minimal()






#Graph 3:

ggplot(starwars_home) +
  
  aes(x = height, fill = homeworld) +
  
  geom_density(alpha = .2) +
  
  scale_color_manual(
    values = c(Naboo = #C00693,
               Tatooine = "#25D1FD")) +

  labs(x = "Height (cm)",
       y = "Density",
       title = "Height: Characters from Tatooine and Naboo",
       fill = "Homeworld") +

  
  theme_clasic()



################################################################################

###Cheating with esquisse

#You need to learn how to plot with ggplot2.

#... However sometimes you don't know hoe to get started on a graph, don't know
#how you want to visualize the data, or are struggling to get the formatting just
#right.  There is a useful Addin from a package called 'esquisse' that works
#as a drag and drop table builder in R. 


