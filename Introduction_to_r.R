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
