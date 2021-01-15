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
args(sd)