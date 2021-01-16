# Intermediate r
# Chapter 1 - Conditionals and control flow
# Relational operators

# Equality ==
TRUE == TRUE
TRUE == FALSE

"hello" == "goodbye"
3 == 2

# Inquality !=
# Works as for equality

# < and >
3 < 5
3 > 5

# Strings - evaluates on alphabetical order
# TRUE = 1, FALSE = 0

# <= and >=
# Wors as for < and >

# Relational Operators and Vectors
linkedin <- c(10, 2, 34, 10)
linkedin > 10
# Compares for each element
# Same for full vectors

# B - Logical Operators
# Combining comparisons
#  - AND &
#  - OR |
#  - NOT !

# AND operator "&"
TRUE & TRUE
# True only if both are true

x <- 12
x > 5 & x < 15

# OR operator "|"
TRUE | TRUE
# Only at least 1 value true for entire argument true
y <- 4
y < 5 | y > 15

# NOT operator "!"
# Negates logical value used on
!TRUE  # False

is.numeric(5)  # Checks if 5 is numeric
!is.numeric(5)  # False

# Logical operators & vectors
# Performed element-wise
c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)
# TRUE FALSE FALSE
c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
# TRUE, TRUE, FALSE

# '&' and '&&', '|' and '||'
# '&&' and '||' only examines first element of each vector

# C: Conditional statements
x <- -3
if(x < 0) {
  print("x is a negative number")
}

# If condition is false, code will not be executed

# Else statement
x <- 5

if(x < 0) {
  print("x is a negative number")
} else {
  print("x is either a positive number or zero")
}

# Else if statement
x <- -3
if(x > 0) {
  print("x is a negative number")
} else if(x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}

# Control flow ends condition is satisfied

# Chapter 2 - Loops
# While loop
ctr <- 1

while(ctr <= 7) {
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}
ctr

# Without ctr <- ctr + 1 --> infinite loop
# Always make sure while loop will end!

# Break statement
ctr <- 1
while(ctr <= 7) {
  if(ctr %% 5 == 0) {
    break
  }
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}
# Breaks when ctr is divisible by 5

# For loop
cities <- c("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")

for(city in cities) {
  print(city)
}
# Also works with lists (for example)

# Break also works with for loop
for (city in cities) {
  if(nchar(city) == 6) {
    break
  }
  print(city)
}

# Next statement
for (city in cities) {
  if(nchar(city) == 6) {
    next
  }
  print(city)
}

# Next statement skips an item if condition holds

# For loop with index
for (i in 1:length(cities)) {
  print(paste(cities[i], "is on position", 
               i, "in the cities vector."))
}

# Chapter 3 - Functions

# A: Introduction to Functions
# Call function in r
sd(c(1, 5, 6, 7))  # Standard dev of vector

# Function documentation
help(sd)
?sd

# Args function
args(sd)  # Returns arguments

# Functions work like a black box
# Argument matching - by position or by name
# Function arguments can have defaults

# B: Writing functions
# Solve a particular, well-defined problem

# triple()
# Defining function
triple <- function(x) {
  x * 3
}
ls()
# Calling function
triple(6)
# Last expression executed in a function = return value
# Can also be explicitly specified using return statement
triple <- function(x) {
  y <- x * 3
  return(y)
}

triple(6)
# To specify an optional argument, add a default value

# Use return() and if()

math_magic <- function(a, b = 1) {
  if(b == 0){
    return(0)
  }
  a*b + a/b
}

math_magic(4, 0)

# Function scoping
# Variables defined inside a function are not accessible outside the function

# R passes arguments by value
# R cannot change the variable that you input to that function
# Variables only change if explicitly re-assigned

# C - R Packages
# Packages of code, data, documentation and tests
# Easy to share
# mean(), list(), sample() - part of base package
# ggvis - data visualisation

# Install packages
# base - auto installed
# ggvis - not installed auto

#install.packages("ggvis")

# CRAN - Comprehensive R archive network

# Once installed - need to load the package into current R session
# load package = attach to search list
# list of packages r searches to find variable you want to use
search()
# 7 packages are attached by default

# To load
#library("ggvis")

# Require - also loads packages
# If package not installed, returns warning rather than error