# Introduction to the Tidyverse

# Chapter 1 - Data wrangling
# Section 1 - The gapminder dataset

# Tidyverse - Collection of data science tools in R

# Installing packages
install.packages("gapminder")
install.packages("dplyr")

# Loading packages
library(gapminder)  # Contains dataset
library(dplyr)  # Data transformation tools

# Show dataset
gapminder
# Format dataframe
# Tibble - special type of dataframe
# 1,704 obs - a single country in a given year
# 6 vars

# Section 2 - The filter verb
# Verbs - atomic steps to transform data

# filter() - look at subset of data
# pipe - %>% - take whatever is before and feed into the next step
# After pipe - perform first verb

# E.g. filter for 2007
gapminder %>%  # Pipe
  filter(year == 2007)  # Condition (using logical equals)

# E.g. filter for USA
gapminder %>%
  filter(country == "United States")

# Filtering for two variables
gapminder %>%
  filter(year == 2007, country == "United States")

# Section 3 - The arrange verb
# Sorts based on a variable in ascending or descending order

# E.g. sort by GDP per capita
gapminder %>%
  arrange(gdpPercap)

# E.g. sort in GDP per capita in desc order
gapminder %>%
  arrange(desc(gdpPercap))

# Filtering then arranging
gapminder %>%
  filter(year == 2007) %>%  # Use additional filter
  arrange(desc(gdpPercap))

# Section 4 - The mutate verb
# mutate() - changes or adds variables

gapminder %>%
  mutate(pop = pop / 1000000)  # Replaces existing pop column

# Using mutate to add a new variable
# E.g. creating total GDP
gapminder %>%
  mutate(gdp = gdpPercap * pop)  # Col names need to be one word

# Combining verbs
gapminder %>%
  mutate(gdp = gdpPercap * pop) %>%
  filter(year == 2007) %>%
  arrange(desc(gdp))

# Chapter 2 - Data visualisation
# Section 1 - Visulalizing with ggplot2

# Variable assignment - useful to save filtered data as new df
gapminder_2007 <- gapminder %>%
  filter(year == 2007)

gapminder_2007

# Visualising with ggplot2
# Scatterplot - gdpPercap vs. lifeExp
install.packages("ggplot2")
library(ggplot2)

ggplot(gapminder_2007,  # Data being visualised
       aes(x = gdpPercap, y=lifeExp)) +  # Mapping variables to aesthetics
  geom_point()  # Specifying type of graph, by adding layer

# Aesthetics - visual dim of graph used to communicate info
# Scatter plot - dim: x and y
# geom - geometric object
# scatter - each obs = one point

# Section 2 - log scales
# When one axis is highly distributed - useful to work with log scale
# Each fixed distance represents a multiplication of the value
# Each unit - a change of 10x GDP

ggplot(gapminder_2007,
       aes(x = gdpPercap, y=lifeExp)) +
  geom_point() +
  scale_x_log10()  # Specify x-axis on log10 scale

# scale_y_log10() would do the same for y axis

# Section 3 - Additional aesthetics
# Additional variables - color and size
# Cat variables - can be represented using color aesthetic

ggplot(gapminder_2007,
  aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10()
# Legend automatically added

# The size aesthetic
ggplot(gapminder_2007,
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10()