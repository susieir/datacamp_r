# Introduction to r
# Chapter 1 - Basics
# Assigning variables
my_var <- 7
my_var

# Data types
# Decimal values - numerics - e.g. 4.5
# Whole numbers - integers - e.g. 4
# Boolean values - logical - e.g. TRUE
# Text - characters

# Check datatype
class(my_var)

# Vectors
# 1D arrays that can hold numeric, character or logical data
numeric_vector <- c(1, 2, 3)
character_vector <- c("a", "b", "c")

# Elements of a vector cam be named
names(numeric_vector) <- c("First", "Second", "Third")

# Vector sum - element-wise
# Calculate sum of all elements
sum(numeric_vector)

# Accessing elements of vector
numeric_vector[1]  # Note this is the first element!

# Accessing multiple elements of vector
numeric_vector[c(1,2)]  # Selects elements 1 and 2

# Accessing a slide of vector
numeric_vector[1:3]  # Selects elements 1 to 3

# Calculating mean
mean(numeric_vector)

# Comparison - select elements that are greater than 1
selection_vector = c(numeric_vector) > 1  # Returns logical
numeric_vector[selection_vector]  # Returns elements >1

# Matrix - n-dimensional array
my_matrix <- matrix(1:9, byrow=TRUE, nrow=3)
# Numbers 1-9
# byrow - matrix to be filled by rows
# nrow - with 3 rows

# To create matrix of vectors
# Append vectors together using c()
# Construct matrix

# Naming cols and rows
cnames <- c('A', 'B', 'C')
rnames <- c('D', 'E', 'F')

# Adding to matrix
colnames(my_matrix) <- cnames
rownames(my_matrix) <- rnames
my_matrix

# To calculate row sums
totals <- rowSums(my_matrix)

# To merge matrices/vectors by column
my_matrix_sums <- cbind(my_matrix, totals)
my_matrix_sums

# rbind() can be used to add extra rows
# colSums() can be used to sum rows

# Subsetting
my_matrix[1,2]  # First row, second col
my_matrix[1:2, 2:3]  # Rows 1 and 2, cols 2 and 3
my_matrix[,2]  # All rows, second col
my_matrix[2,]  # Second row, all cols

# Averaging a subset
mean(my_matrix[,2])

# Multiplying corresponding elements
# Define a new matrix
matrix_1 <- matrix(3:11, byrow=TRUE, nrow = 3)
matrix_1
my_matrix
new_matrix <- my_matrix * matrix_1
new_matrix

# Chapter 3 - Factors
# Statistical data type used to store cat variables
# Cat variable - limited number of categories

sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Converting to factors
factor_sex_vector <- factor(sex_vector)
factor_sex_vector

# Two types of factor vars
# Nominal cat variable - no implied order, e.g. animals
# Ordinal cat variable - natural order, e.g. temperature
# Levels of a factor indicate order
# if not specified alphabetical assumed

# To change factor names use levels()
# Make sure the factors are specified in level order
levels(factor_sex_vector) <- c("F", "M")
factor_sex_vector

# summary() provides stats on a variable
summary(sex_vector)
summary(factor_sex_vector)

# To create an ordered factor
# Create vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
# Convert to ordered factor
speed_factor <- factor(speed_vector,
                       ordered=TRUE,
                       levels=c("slow", "medium", "fast"))
summary(speed_factor)

# You can compare elements of an ordered factor using <, > etc.

# Chapter 5 - Dataframes
# Dataframes can combine different data types
# head() - prints the first observations
# tail() - prints the last observations
# str() - prints the structure of the df

# Definition of vectors
name <- c("Mercury", "Venus", "Earth", 
          "Mars", "Jupiter", "Saturn", 
          "Uranus", "Neptune")
type <- c("Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", 
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 
              11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 
              0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Creating a data frame
planets_df <- data.frame(name, type, diameter, rotation, rings)
str(planets_df)
# Subsetting can also be applied to dataframes
# Column names can also be used instead of col position

# To select a column - $ shortcut
rings_vector = planets_df$rings
rings_vector

# A logical can be used to subset the dataframe
planets_df[rings_vector,]

# Subset can also be used to subset data
subset(planets_df, subset = diameter < 1)

# order() gives a ranked position of each element
positions <- order(planets_df$diameter)

# This can then be used to return an ordered list
planets_df[positions, ]  # Orders rows based on diameter

# Chapter 6 - Lists
# List - ordered list of objects
# Objects can be matrices, vectors, dataframes, other lists etc.
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)

# Creating a list with named components
second_list = list(vector = my_vector,
                   dataframe = my_df,
                   list = my_list)
second_list

# Retrieving components from lists
second_list[[1]]  # Retrieves first component
second_list[["dataframe"]]  # Retrieves dataframe
second_list$list  # Retrieves list
second_list$list[2]  # Prints second element of list

