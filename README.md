# Course Materials for Advanced Data Analytics in Economics

Nick Hagerty, Montana State University

Except where otherwise noted, this work is licensed under <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons BY-NC-SA 4.0</a>.

***

**Skip to:** [Lecture slides](#lecture-slides)
| [Supplemental labs](#supplemental-labs)
| [External resources](#external-resources)

***

## Lecture slides

Fall 2023

[**Topic 1: R Basics**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/01-R-basics/01-R-basics.html)
([.pdf](https://github.com/msu-econ-data-analytics/course-materials/blob/main/lecture-slides/01-R-basics/01-R-basics.pdf))

* About R
* Operators
* Objects and functions
* Data frames
* Vectors
* Indexing

[**Topic 2: Programming in R**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/02-Programming/02-Programming.html)

* If/else statements
* For-loops
* Functions
* Vectorization
* Parallelization

**Topic 3: Productivity Tools**

* [**Version control**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/03-Productivity/Git_and_GitHub.pdf)
* [**R Markdown**](https://github.com/msu-econ-data-analytics/course-materials/blob/main/lecture-slides/03-Productivity/R-Markdown-example.Rmd)

[**Topic 4: Data Wrangling**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/04-Wrangling/04-Wrangling.html)

* Philosophy of tidy data
* Wrangling data with `dplyr`
* Joining data with `dplyr`
* Tidying data with `tidyr`
* Importing data with `readr`

[**Topic 5: Data Cleaning**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/05-Cleaning/05-Cleaning.html)

* Join safety
* Keys and relational data
* String cleaning
* Number storage
* Data Cleaning Checklist ([pdf version](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/data-cleaning-checklist/Data-Cleaning-Checklist.pdf))

[**Topic 6: Data Acquisition**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/06-Acquisition/06-Acquisition.html)

* Where data comes from
* Webscraping
* Using APIs

[**Topic 7: Best Practices for Coding and Workflows**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/07-Best-Practices/07-Best-Practices.html)

* The perils of bad data cleaning
* Reproducibility and transparency
* Best practices (code organization, file organization, version control, abstraction, commenting, unit tests)

**Topic 8: Exploratory Analysis**

* [**Part 1: Understanding individual variables**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/08-Exploratory/08-Exploratory-part1.html)
  * Summaries, frequency tables and crosstabs in R
  * Characterizing distributions
  * Handling extreme values
  * Handling variable transformations
  * Handling missing data

* [**Part 2: Understanding variable relationships**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/08-Exploratory/08-Exploratory-part2.html)
  * Characterizing relationships
  * Binscatter
  * The Conditional Expectation Function
  * Adjusting for other variables
  * Bin smoothing and local regression

[**Topic 9: Data Visualization**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/09-Visualization/09-Visualization.html)

* Basics of `ggplot2`
* Plotting examples
* Colors and themes
* Principles of data visualization
* Case studies

[**Topic 10: Distinguishing Goals of Data Analysis**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/10-Distinguishing-Goals/10-Distinguishing-Goals.html)

* The Data Generating Process
* Potential outcomes, counterfactuals, and causal inference
* Descriptive, Predictive, or Causal Analysis?

[**Topic 11: Regression Modeling**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/11-Regression/11-Regression.html)

* Basic regression in R
* Indicator and interaction terms
* Econometrics packages in R
* Modeling nonlinear relationships
* Using regression models for prediction

[**Topic 12: Machine Learning Fundamentals**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/12-Learning/12-Learning.html)

* Overview: Statistical learning
* Assessing model accuracy
* Cross-validation

**Topic 13: Prediction Methods**

* [**Part 1: Shrinkage methods**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/13-Prediction/13a-Shrinkage.html)
  - Shrinkage methods
  - Ridge regression
  - Lasso (and elasticnet)
* [**Part 2: Learning with `tidymodels`**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/13-Prediction/13b-Tidymodels.html)
  - Setup and splitting
  - Recipes
  - Workflows
  - Tuning
  - Prediction
  - Dependence

**Topic 14: Classification Methods**

* [**Part 1: Methods**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/14-Classification/14a-Classification.html)
  - Classification
  - Logistic regression
  - *k*-nearest neighbors
  - Model assessment
  - Decision trees
* [**Part 2: Examples**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/14-Classification/14b-Examples.html)
  - Logistic regression and KNN
  - Cross-validation
  - Decision trees
  - Teach your laptop to read

[**Topic 15: Machine Learning in Economics**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/15-ML-Applications/15-ML-Applications.html)

* Predicting outcomes
* Constructing new data
* Selecting covariates
* Predicting causal effects

**Topic 16: Spatial Analysis**

* [**Intro to Geospatial Data**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/16-Spatial/Overview_Geospatial_Data.pdf)
* [**Part 1**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/16-Spatial/16-Spatial-part1.html)
  - Spatial data and quick mapping
  - Reference systems and projections
* [**Part 2**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/16-Spatial/16-Spatial-part2.html)
  - Spatial queries (measurement, relationships)
  - Spatial subsetting
  - Geometry operations
  - Spatial joins

[**Topic 17: Databases and Big Data**](https://raw.githack.com/msu-econ-data-analytics/course-materials/main/lecture-slides/17-Databases/17-Databases.html)

* Tools for big data
* Databases in R
* Writing SQL queries
* Getting started with BigQuery

---

## Supplemental labs

By Laura Sikoski

* [Lab 0: Getting started with R](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%200%20-%20Getting%20Started.R)
* [Lab 1: Intro](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%201%20-%20Intro.R)
* [Lab 2: Cleaning](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%202%20-%20Cleaning.R)
* [Lab 3: Merges](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%203%20-%20Merges.R)
* [Lab 4: Pivots](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%204%20-%20Pivots.R)
* [Lab 5: Regressions](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%205%20-%20OLS%20Intro.R)
* [Lab 6: If/else statements](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%206%20-%20If%20Else%20Statements.R)
* [Lab 7: For loops](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%207%20-%20For%20Loops.R)
* [Lab 8: Functions](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%208%20-%20Functions.R)
* [Lab 9: Intro to ggplot2](https://github.com/msu-econ-data-analytics/course-materials/blob/main/supplemental-lab-scripts/Lecture%209%20-%20Intro%20to%20ggplot.R)

---

## External resources

This is a list of further resources that you may find helpful throughout (and after!) this course. Start with the course materials above, but check these out for alternative explanations or if you want to take a deeper dive into a particular topic. If one isn't speaking to you, try another.

### Basics of R
* [*Introduction to Data Science* Ch. 3: R Basics](https://rafalab.github.io/dsbook/r-basics.html) (Rafael A. Irizarry). Data types, data frames, vectors, indexing, basic plots.
* [*Modern Data Science with R* Appendix B: Introduction to R and RStudio](https://mdsr-book.github.io/mdsr2e/ch-R.html) (Baumer, Kaplan, and Horton). Installation, help, objects, vectors, indexing, operators, lists, matrices, data frames, attributes and classes, functions, packages.
* [R for Social Scientists](https://datacarpentry.org/r-socialsci/) (The Carpentries).
* [*Big Data in Economics* Lecture 4: R Language Basics](https://raw.githack.com/uo-ec607/lectures/master/04-rlang/04-rlang.html) (Grant McDermott). Slides. Logic, evaluation, assignment, help, objects, names, indexing, lists.
* [Cheat Sheet: Base R](https://raw.githubusercontent.com/rstudio/cheatsheets/main/base-r.pdf) (RStudio).
* DataCamp tutorials:
  - [Introduction to R](https://learn.datacamp.com/courses/introduction-to-writing-functions-in-r) (free to everyone)
  - [Intermediate R](https://learn.datacamp.com/courses/intermediate-r) (free for 6 months for enrolled students)

### Programming in R
* [*Introduction to Data Science* Ch. 4: Programming Basics](https://rafalab.github.io/dsbook/programming-basics.html) (Rafael A. Irizarry). If/else, writing functions, for-loops, vectorization, functionals.
* [Intermediate R](https://greenwood-stat.shinyapps.io/IntermediateR-learnr) (Montana State University R Workshops Team). Relational operators, logicals, conditional statements, loops, functions.
* [*R for Data Science* Ch. 17-21](https://r4ds.had.co.nz/program-intro.html) (Hadley Wickham). Pipes, functions, vectors, iteration.
* Big Data in Economics (Grant McDermott):
  - [Lecture 10: Functions in R: (1) Introductory Concepts](https://raw.githack.com/uo-ec607/lectures/master/10-funcs-intro/10-funcs-intro.html). Function syntax, control flow, iteration, vectorization. The section on functional programming uses the tidyverse, which we're covering later in the course.
  - [Lecture 11: Functions in R: (2) Advanced Concepts](https://raw.githack.com/uo-ec607/lectures/master/11-funcs-adv/11-funcs-adv.html). Debugging, catching user errors, caching.
  - [Lecture 12: Parallel programming](https://raw.githack.com/uo-ec607/lectures/master/12-parallel/12-parallel.html).
* DataCamp tutorial (free for 6 months for enrolled students): [Introduction to Writing Functions in R](https://learn.datacamp.com/courses/introduction-to-writing-functions-in-r).

### R Markdown
* [Intro to R Markdown](https://slides.djnavarro.net/starting-rmarkdown/) (Danielle Navarro). Nice overview of why we're using R Markdown, and examples of how to use it.
* [Using R Markdown for Class Assignments](https://ntaback.github.io/UofT_STA130/Rmarkdownforclassreports.html) (Nate Taback). A pretty quick overview.
* [Cheat Sheet: R Markdown](https://raw.githubusercontent.com/rstudio/cheatsheets/main/rmarkdown.pdf) (RStudio). Most of what you want to know on 2 pages.
* [R Markdown Reference Guide](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) (RStudio). A bit more comprehensive than the cheat sheet.
* [*R for Data Science* Ch. 27: R Markdown](https://r4ds.had.co.nz/communicate-intro.html) (Hadley Wickham). Comprehensive introduction.

### Git and GitHub
* [GitHub Guides: Hello World](https://guides.github.com/activities/hello-world/). Branches and merges in GitHub.
* [GitHub Guides: Forking Projects](https://guides.github.com/activities/forking/). Forking and pull requests in GitHub.
* [*Happy Git and GitHub for the useR*](https://happygitwithr.com/) (Jenny Bryan). How to take advantage of RStudio's convenient built-in features that integrate Git and GitHub.
* [*Big Data in Economics* Lecture 2: Version Control with Git(Hub)](https://raw.githack.com/uo-ec510-2020-spring/lectures/master/02-git/02-git.html) (Grant McDermott). Getting started with Git at the command line.
* [*Data Science for Economists* Ch. 3: Using Git and GitHub.com](https://raw.githack.com/tyleransom/DScourseS21/master/LectureNotes/03-CLI-Git/git_tutorial.pdf) (Tyler Ransom). More on Git at the command line.

### Data wrangling with the tidyverse
* [Wrangling, Analyzing and Exporting Data with the Tidyverse](https://rconnect.math.montana.edu/Data_Wrangling/) (Montana State R Workshops Team). Interactive tutorial.
* [Data Wrangling and Manipulation in R](https://github.com/dlab-berkeley/R-wrang) (UC Berkeley D-Lab). Slides with coding examples. Functions, for-loops, if/else, Monte Carlo simulations.
* [*Modern Data Science with R* Chapters 4-6](https://mdsr-book.github.io/mdsr2e/ch-dataI.html) (Baumer, Kaplan, and Horton). Chapter 4: Data wrangling with dplyr. Chapter 5: Joins. Chapter 6: Tidy data and tidyr.
* [*ModernDive* Chapter 3: Data Wrangling](https://moderndive.com/3-wrangling.html) (Ismay & Kim). Data wrangling with dplyr.
* RStudio Cheat Sheets:
  - [Data Transformation with dplyr](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf)
  - [Data Tidying with tidyr](https://raw.githubusercontent.com/rstudio/cheatsheets/main/tidyr.pdf)
  - [Data import with the tidyverse](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-import.pdf)
* DataCamp tutorials (free for 6 months for enrolled students):
  - [Introduction to the Tidyverse](https://learn.datacamp.com/courses/introduction-to-the-tidyverse)
  - [Data Manipulation with dplyr](https://learn.datacamp.com/courses/introduction-to-the-tidyverse)
  - [Joining data with dplyr](https://learn.datacamp.com/courses/introduction-to-the-tidyverse)

### Data cleaning
* [*Tidyverse Skills for Data Science* Chapter 3](https://jhudatascience.org/tidyversecourse/wrangle-data.html) (Carrie Wright, Shannon E. Ellis, Stephanie C. Hicks and Roger D. Peng). Covers the basics of working with factors, dates and times, strings, and text as data.
* *R for Data Science* (Hadley Wickham):
  - [Chapter 14: Strings](https://r4ds.had.co.nz/strings.html)
  - [Chapter 15: Factors](https://r4ds.had.co.nz/factors.html)
  - [Chapter 16: Dates and times](https://r4ds.had.co.nz/dates-and-times.html)
* RStudio Cheat Sheets:
  - [String manipulation with stringr](https://raw.githubusercontent.com/rstudio/cheatsheets/main/strings.pdf)
  - [Factors with forcats](https://raw.githubusercontent.com/rstudio/cheatsheets/main/factors.pdf)
  - [Dates and Times with lubridate](https://raw.githubusercontent.com/rstudio/cheatsheets/main/lubridate.pdf)
* [Quartz Guide to Bad Data](https://github.com/Quartz/bad-data-guide).

### Data acquisition and webscraping
* [How to Find Data: Tips for Finding Data](https://davidson.libguides.com/data/tips) (Davidson College Library).
* [Data Sets for Quantitative Research: Public Use Datasets](https://libraryguides.missouri.edu/datasets/public-use) (University of Missouri Libraries).
* [*Data Science for Economists* Lecture 6: Webscraping: (1) Server-side and CSS](https://raw.githack.com/uo-ec607/lectures/master/06-web-css/06-web-css.html) (Grant McDermott).
* [*Data Science for Economists* Lecture 7: Webscraping: (2) Client-side and APIs](https://raw.githack.com/uo-ec607/lectures/master/07-web-apis/07-web-apis.html) (Grant McDermott).
* [An Introduction to APIs](https://zapier.com/learn/apis/) (Zapier).

### Best practices for coding and workflows
* [Evidence on Research Transparency in Economics](https://pubs.aeaweb.org/doi/pdf/10.1257/jep.35.3.193) (Edward Miguel, *Journal of Economic Perspectives* 2021).
* [Best Practices for Scientific Computing](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745) (Wilson et al. 2014).
* [Code and Data for the Social Sciences: A Practitioner's Guide](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf) (Gentzkow & Shapiro 2014).
* [Coding for Economists: A Language-Agnostic Guide to Programming for Economists](https://scholar.harvard.edu/files/ristovska/files/coding_for_econs_20190221.pdf) (Ljubica "LJ" Ristovska 2019).
* [The tidyverse style guide](https://style.tidyverse.org/) (Hadley Wickham).

### Distinguishing goals of data analysis
* *Thinking Clearly with Data* (Ethan Bueno de Mesquita and Anthony Fowler 2021, Princeton University Press).
* [*The Effect: An Introduction to Research Design and Causality* Chapter 5: Identification](https://theeffectbook.net/ch-Identification.html) (Nick Huntington-Klein).
* [*Causal Inference: The Mixtape* Chapter 4: Potential Outcomes Causal Model](https://mixtape.scunning.com/04-potential_outcomes) (Scott Cunningham).

### Exploratory analysis
* [*Introduction to Data Science* Chapter 8: Visualizing data distributions](https://rafalab.github.io/dsbook/distributions.html) (Rafael A. Irizarry). Histograms, density plots, stratification.
* [*Introduction to Data Science* Chapter 28: Smoothing](https://rafalab.github.io/dsbook/smoothing.html) (Rafael A. Irizarry). Bin smoothing, kernels, and local regression.
* DataCamp tutorial (free for 6 months for enrolled students): [Exploratory Data Analysis in R](https://learn.datacamp.com/courses/exploratory-data-analysis-in-r).

### Spatial analysis
* [R Geospatial Fundamentals](https://github.com/dlab-berkeley/R-Geospatial-Fundamentals) (UC Berkeley D-Lab). Great tutorial. Core concepts, vector data, spatial analysis, raster data.
* [Introduction to Geospatial Raster and Vector Data with R](https://datacarpentry.org/r-raster-vector-geospatial/) (The Carpentries). Another great tutorial, though focused more on ecology than social science.
* [*Modern Data Science with R* Chapters 17-18](https://mdsr-book.github.io/mdsr2e/ch-spatial.html) (Baumer, Kaplan, and Horton). Chapter 17: Working with geospatial data. Chapter 18: Geospatial computations.
* [*Geocomputation with R*](https://geocompr.robinlovelace.net/) (Lovelace, Nowosad, and Muenchow). Comprehensive treatment of GIS tools in R.

### Data visualization
* [*Introduction to Data Science* Chapters 6-10: Data Visualization](https://rafalab.github.io/dsbook/introduction-to-data-visualization.html) (Rafael A. Irizarry).
* [*Modern Data Science with R* Chapters 2-3](https://mdsr-book.github.io/mdsr2e/ch-vizI.html) (Baumer, Kaplan, and Horton). Chapter 2: Principles of data visualization. Chapter 3: Plotting with ggplot2.
* [Data Visualization: A practical introduction](https://socviz.co/) (Kieran Healy). Online book for both principles and methods/examples.
* [From Data to Viz](https://www.data-to-viz.com/) (Yan Holtz & Conor Healy). "Leads you to the most appropriate graph for your data. It links to the code to build it and lists common caveats you should avoid."
* [Cheat Sheet: Data visualization with ggplot2](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf) (RStudio).
* [An Economist's Guide to Visualizing Data](https://www.aeaweb.org/articles?id=10.1257/jep.28.1.209) (Jonathan Schwabish, *Journal of Economic Perspectives* 2014.)
* DataCamp tutorials (free for 6 months for enrolled students):
  - [Introduction to Data Visualization with ggplot2](https://learn.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2)
  - [Intermediate Data Visualization with ggplot2](https://learn.datacamp.com/courses/intermediate-data-visualization-with-ggplot2)

### Regression modeling in R
* [*Big Data in Economics* Lecture 8: Regression Analysis in R](https://raw.githack.com/uo-ec607/lectures/master/08-regression/08-regression.html) (Grant McDermott).
* [*Prediction and Machine Learning* Lab 4: Regression with R](https://raw.githack.com/edrubin/EC525S19/master/NotesLab/04RReg/04RReg.html) (Ed Rubin).
* [*ISLR* Ch. 7: Moving Beyond Linearity](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani). Polynomial regressions, step functions, splines.
* DataCamp tutorials (free for 6 months for enrolled students):
  - [Introduction to Regression in R](https://learn.datacamp.com/courses/introduction-to-regression-in-r)
  - [Intermediate Regression in R](https://learn.datacamp.com/courses/intermediate-regression-in-r)

### Fundamentals of machine learning
* [*ISLR* Ch. 2: Statistical Learning](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani). Statistical learning, assessing model accuracy.
* [*ISLR* Ch. 5: Resampling Methods](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani). Cross-validation, the bootstrap.
* [*Introduction to Data Science* Chapters 27 & 29](https://rafalab.github.io/dsbook/introduction-to-data-visualization.html) (Rafael A. Irizarry). Chapter 27: Introduction to machine learning. Chapter 29: Cross validation.
* [*Prediction and Machine Learning* Lectures 0-3](https://github.com/edrubin/EC524W21) (Ed Rubin).
  - Lecture 000: Overview (Why predict?)
  - Lecture 001: Statistical learning foundations
  - Lecture 002: Model accuracy
  - Lecture 003: Resampling Methods

### Shrinkage methods
* [*ISLR* Ch. 6: Linear Model Selection & Regularization](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani). Subset selection, shrinkage (ridge, lasso), dimension reduction.
* [*Prediction and Machine Learning* Lecture 5: Shrinkage methods](https://github.com/edrubin/EC524W21) (Ed Rubin). 

### Classification methods
* [*ISLR* Ch. 4: Classification](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani). Logistic regression, discriminant analysis, naive Bayes.
* [*Prediction and Machine Learning* Lecture 6: Classification](https://github.com/edrubin/EC524W21) (Ed Rubin). 
* [*Modern Data Science with R* Chapters 10-11](https://mdsr-book.github.io/mdsr2e/ch-vizI.html) (Baumer, Kaplan, and Horton). Chapter 10: Predictive modeling. Chapter 3: Supervised learning.
* [*Introduction to Data Science* Chapters 31-32](https://rafalab.github.io/dsbook/introduction-to-data-visualization.html) (Rafael A. Irizarry). Chapter 31: Examples of algorithms. Chapter 32: Machine learning in practice.

### Machine learning with `tidymodels`
* [ISLR tidymodels Labs](https://emilhvitfeldt.github.io/ISLR-tidymodels-labs/index.html) (Emil Hvitfeldt). All labs from *ISLR* written using the tidymodels library.
* [*Prediction and Machine Learning* Labs](https://github.com/edrubin/EC524W21) (Ed Rubin and Stephen Reed). 
  - Kaggle notebooks on "tidymodels-ing"
  - Labs 3-5

### Unsupervised learning
* [*ISLR* Ch. 12: Unsupervised Learning](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani).
* [*Modern Data Science with R* Chapter 12: Unsupervised Learning](https://mdsr-book.github.io/mdsr2e/ch-vizI.html) (Baumer, Kaplan, and Horton).
* [*Introduction to Data Science* Chapter 34: Clustering](https://rafalab.github.io/dsbook/introduction-to-data-visualization.html) (Rafael A. Irizarry).

### Further methods in machine learning
* [*ISLR*](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) (James, Witten, Hastie, Tibshirani).
  - Ch. 8: Tree-Based Methods
  - Ch. 9: Support Vector Machines
  - Ch. 10: Deep Learning
* [*Prediction and Machine Learning* Lectures](https://github.com/edrubin/EC524W21) (Ed Rubin). 
  - Lecture 007: Decision Trees
  - Lecture 008: Ensemble Methods
  - Lecture 009: Support Vector Machines

### Applications of machine learning in economics
* ["Machine Learning: An Applied Econometric Approach"](https://pubs.aeaweb.org/doi/pdfplus/10.1257/jep.31.2.87) (Mullainathan & Spiess, *Journal of Economic Perspectives* 2017).
* ["Beyond prediction: Using big data for policy problems"](https://www.science.org/doi/10.1126/science.aal4321) (Susan Athey, *Science* 2017).
* ["The Impact of Machine Learning on Economics"](https://www.nber.org/system/files/chapters/c14009/c14009.pdf) (Susan Athey, 2019).
* ["Machinistas meet randomistas: useful ML tools for empirical researchers,"](https://github.com/demirermert/MLInference/blob/master/NBER_SI_DEV_master_lecture.pdf) (Esther Duflo, NBER Summer Institute Master Lecture 2018).
* [Slides on Machine Learning](http://cameron.econ.ucdavis.edu/e240f/machinelearning.html) (Colin Cameron).
* ["Machine Learning for Economists"](https://sites.google.com/view/dariosansone/resources/machine-learning) (Dario Sansone). Long list of resources, applications, and citations.

### Databases (SQL)
* [*Data Science for Economists* Lecture 16: Databases](https://raw.githack.com/uo-ec607/lectures/master/16-databases/16-databases.html) (Grant McDermott).
* [SQL for R Users](https://github.com/dlab-berkeley/sql-for-r-users) (UC Berkeley D-Lab).
* [Data Management with SQL for Social Scientists](https://datacarpentry.org/r-socialsci/) (The Carpentries).
* [*Modern Data Science with R* Chapter 15: Database querying using SQL](https://mdsr-book.github.io/mdsr2e/ch-sql.html) (Baumer, Kaplan, and Horton).

### Distributed and cloud computing
* *Data Science for Economists* (Grant McDermott):
  - [Lecture 14: Google Compute Engine (Part I)](https://raw.githack.com/uo-ec607/lectures/master/14-gce-i/14-gce-i.html).
  - [Lecture 14: Google Compute Engine (Part II)](https://raw.githack.com/uo-ec607/lectures/master/14-gce-ii/14-gce-ii.html).
  - [Lecture 17: Spark](https://raw.githack.com/uo-ec607/lectures/master/17-spark/17-spark.html).
* [*Modern Data Science with R* Chapter 21: Epilogue: Towards "big data"](https://mdsr-book.github.io/mdsr2e/ch-big.html) (Baumer, Kaplan, and Horton).
