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