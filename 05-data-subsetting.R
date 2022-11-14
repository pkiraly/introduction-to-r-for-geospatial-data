#' 5. Subsetting Data
#' How can I work with subsets of data in R?
#' https://datacarpentry.org/r-intro-geospatial/05-data-subsetting/index.html

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x

#' In R, simple vectors containing character strings, numbers, or logical 
#' values are called 
#'       atomic vectors
#' because they can’t be further simplified.

#' Accessing elements using their indices

#' get me the nth element
x[1]
x[4]

#' ask for multiple elements
x[c(1, 3)]
x[1:4]

#' the : operator creates a sequence of numbers
1:4
c(1, 2, 3, 4)

#' ask for the same element multiple times
x[c(1, 1, 3)]

#' ask for an index beyond the length of the vector
x[6]

#' ask for the 0th element, we get an empty vector
x[0]

#' Vector numbering in R starts at 1

#' Skipping and removing elements
#' negative number: R will return every element except for the one specified
x[-2]
x[c(-1, -5)]

#' Order of operations
x[-1:3]
x[-(1:3)]

#' assign the result back into the variable:
x <- x[-4]

#' Challenge 1
#' given the following code
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

#' Come up with at least 3 different commands that will return b, c, d elements

#' Subsetting by name
x <- c(a = 5.4, b = 6.2, c = 7.1, d = 4.8, e = 7.5) # we can name a vector 'on the fly'
x[c("a", "c")]

#' Subsetting through other logical operations
x[c(FALSE, FALSE, TRUE, FALSE, TRUE)]

#' comparison operators (e.g. >, <, ==) evaluate to logical vectors
x[x > 7]
x[names(x) == "a"]

#' Combining logical conditions
#' &, the “logical AND” operator: returns TRUE if both the left and right are TRUE.
#' |, the “logical OR” operator: returns TRUE, if either the left or right (or both) are TRUE.
#' 
#' && and || instead of & and |. These two-character operators only look at the 
#'               first element of each vector and ignore the remaining elements.
#' !, the “logical NOT” operator: converts TRUE to FALSE and FALSE to TRUE. 
#'    It can negate a single logical condition (eg !TRUE becomes FALSE), or 
#'    a whole vector of conditions(eg !c(TRUE, FALSE) becomes c(FALSE, TRUE)).

#' Challenge 2
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

#' Write a subsetting command to return the values in x that are 
#'  greater than 4 and less than 7.

#' you can search for help on operators by wrapping them in quotes: help("%in%") or ?"%in%".

#' Handling special values
#' is.na() - will return all positions in a vector, matrix, or data frame 
#'           containing NA (or NaN)
#' is.nan(), is.infinite will do the same for NaN and Inf.
#' is.finite() - will return all positions in a vector, matrix, or data.frame
#'               that do not contain NA, NaN or Inf.
#' na.omit() - will filter out all missing values from a vector

#' Data frames
#' 
#' url <- "https://raw.githubusercontent.com/datacarpentry/r-intro-geospatial/master/_episodes_rmd/data/gapminder_data.csv"
#' download.file(url, destfile = "data/gapminder_data.csv")
#' gapminder <- read.csv("data/gapminder_data.csv")
#' 
#' [ with one argument will act the same way as for lists
head(gapminder[3])

#' [[ will act to extract a single column:
head(gapminder[["lifeExp"]])

#' $ provides a convenient shorthand to extract columns by name:
head(gapminder$year)

#' To select specific rows and/or columns, you can provide two arguments to [
gapminder[1:3, ]
gapminder[3, ]

#' Challenge 3
#' Fix each of the following common data frame subsetting errors
#' 1. Extract observations collected for the year 1957
gapminder[gapminder$year = 1957, ]

#' 2. Extract all columns except 1 through to 4
gapminder[, -1:4]

#' 3. Extract the rows where the life expectancy is longer the 80 years
gapminder[gapminder$lifeExp > 80]

#' 4. Extract the first row, and the fourth and fifth columns (lifeExp and gdpPercap).
gapminder[1, 4, 5]

#' 5. Advanced: extract rows that contain information for the years 2002 and 2007
gapminder[gapminder$year == 2002 | 2007,]

#' Challenge 4
#' Why does gapminder[1:20] return an error? How does it differ from gapminder[1:20, ]?
#' Create a new data.frame called gapminder_small that only contains 
#'   rows 1 through 9 and 19 through 23. You can do this in one or two steps.

#' Key Points
#' - Indexing in R starts at 1, not 0.
#' - Access individual values by location using [].
#' - Access slices of data using [low:high].
#' - Access arbitrary sets of data using [c(...)].
#' - Use logical operations and logical vectors to access subsets of data.
