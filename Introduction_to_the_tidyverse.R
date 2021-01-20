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

# Section 4 - Faceting
# Faceting - Dividing plot into subplots
ggplot(gapminder_2007,
       aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)  # Splits plots by continent

# Chapter 3 - Grouping and summarising

# Section 1 - The summarise verb
# Data transformation and visualisation
# Summarise() - turns many rows into one

gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))
# Collapses to single row

# Summarising one year
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp))

# Summarising into multiple columns
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Functions you can use for summarizing
# -  Mean
# -  Sum
# -  Median
# -  Min
# -  Max

# Section 2 - The group_by verb
# group_by() - before summarize() turns groups into one row each

gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Summarizing by continent
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Summarizing by continent and year
gapminder %>%
  group_by(continent, year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Section 3 - Visualizing summarised data
# Summarizing by year
# Save as object
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(totalPop = sum(pop),
            meanLifeExp = mean(lifeExp))

by_year

# Visualising population over time
ggplot(by_year, aes(x = year, y = totalPop)) +
  geom_point()

# Starting y-axis at zero
ggplot(by_year, aes(x = year, y = totalPop)) +
  geom_point() +
  expand_limits(y = 0)

# Summarising by year and by continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(pop),
            meanLifeExp = mean(lifeExp))

by_year_continent

# Visualising by year and by continent
ggplot(by_year_continent,
       aes(x = year, y = totalPop, color = continent)) +
  geom_point() +
  expand_limits(y = 0)

# Chapter 4 - Types of visualisation
# Section 1 - Line plots
# Types of plots
# Line plots - useful for change over time
# Bar plots - good at comparing statistics for categories
# Hists - distribution of 1D numeric variable
# Box plots - distribution of numeric variable across categories

# Scatter vs. line plot
# geom_point() - scatter plot
# geom_line() - line plot

ggplot(by_year_continent,
       aes(x = year, y = totalPop, color = continent)) +
  geom_line() +
  expand_limits(y = 0)


# Section 2 - Bar plots - geom_col()
# Summarizing by continent
by_continent <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp))

by_continent

ggplot(by_continent,
       aes(x = continent, y = meanLifeExp)) +
  geom_col()

# Bar plots always start at 0

# Section 3 - Histograms

# Histogram - geom_histogram()
# One aesthetic - x axis
# Width chosen automatically - may need to be customised
# geom_histogram(bin_width = 5)  # Width of e.g. 5 years
# You may need to put the x-axis on a log scale

# Section 4 - Box plots
# Useful if want to compare distribution across categories

ggplot(gapminder_2007,
      aes(x = continent, y = lifeExp)) +
  geom_boxplot()

# Gives context to shape of earlier histogram