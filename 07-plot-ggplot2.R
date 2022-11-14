#' 7. Introduction to Visualization
#' What are the basics of creating graphics in R?
#' https://datacarpentry.org/r-intro-geospatial/07-plot-ggplot2/index.html
#' 
#' three main plotting systems in R
#' - the base plotting system
#' - the lattice package
#' - the ggplot2 package
#' 
#' gg = grammar of graphics
#' components: 
#' - a data set,
#' - a coordinate system,
#' - a set of geoms (the visual representation of data points, e.g. histograms and bar plot)
#' layers

library("ggplot2")
# aes() - how variables in the data map to aesthetic properties of the figure.
ggplot(data = gapminder, aes(x = lifeExp)) +   
  geom_histogram()

#' ggplot() is not enough
ggplot(data = gapminder, aes(x = lifeExp))

#' Challenge 1
#' Modify the example so that the figure shows the distribution of gdp per capita,
#' rather than life expectancy

#' compare the gdp per capita of the countries in our dataset
gapminder_small <- filter(gapminder, year == 2007, continent == "Americas")
ggplot(data = gapminder_small, aes(x = country, y = gdpPercap)) + 
  geom_col()

#' flip coordinates: coord_flip()
ggplot(data = gapminder_small, aes(x = country, y = gdpPercap)) + 
  geom_col() +
  coord_flip()

#' Challenge 2
#' In the previous examples and challenge we’ve used the aes() function to tell
#' the geom_histogram() and geom_col() functions which columns of the data set
#' to plot. Another aesthetic property we can modify is the color. Create a new
#' bar (column) plot showing the gdp per capita of all countries in the Americas
#' for the years 1952 and 2007, color coded by year.
#' hints: fill, as.factor, position





