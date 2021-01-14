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

