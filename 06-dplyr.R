#' 6. Data frame Manipulation with dplyr
#' How can I manipulate dataframes without repeating myself?
#' https://datacarpentry.org/r-intro-geospatial/06-dplyr/index.html

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Americas", "gdpPercap"])
mean(gapminder[gapminder$continent == "Asia", "gdpPercap"])

#' The dplyr package
#' 6 of the most commonly used functions as well as using pipes (%>%) to combine them.
#' select()
#' filter()
#' group_by()
#' summarize()
#' count() and n()
#' mutate()

install.packages('dplyr')
library("dplyr")

#' Using select()
year_country_gdp <- select(gapminder, year, country, gdpPercap)

#' https://datacarpentry.org/r-intro-geospatial/fig/13-dplyr-fig1.png

year_country_gdp <- gapminder %>% select(year, country, gdpPercap)

#' Using filter()
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

#' Challenge 1
#' Write a single command (which can span multiple lines and includes pipes) that
#' will produce a dataframe that has the African values for lifeExp, country and
#' year, but not for other Continents.
#' How many rows does your dataframe have and why?

#' The order of operations is very important in this case

#' Using group_by() and summarize()
str(gapminder)
gapminder %>% group_by(continent) %>% str()

#' A grouped_df can be thought of as a list where
#'   each item in the list is a data.frame 
#'   which contains only the rows that correspond to the a particular value continent

#' https://datacarpentry.org/r-intro-geospatial/fig/13-dplyr-fig2.png

#' Using summarize()
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))

gdp_bycontinents

#' https://datacarpentry.org/r-intro-geospatial/fig/13-dplyr-fig3.png

#' Challenge 2
#' Calculate the average life expectancy per country.
#' Which has the longest average life expectancy 
#' and which has the shortest average life expectancy?

#' group by multiple variables
gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))

#' summarize multiple variables
gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))

#' count() and n()

#' the number of countries included in the dataset for the year 2002, we can use the count()
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

#' equivalent of
gapminder %>%
  filter(year == 2002) %>%
  group_by(continent) %>%
  summarize(n = n()) %>% 
  arrange(desc(n))

#' n(): number of observations in calculations
#' get the standard error of the life expectancy per continent:
gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))

#' chain together several summary operations
gapminder %>%
  group_by(continent) %>%
  summarize(
    mean_le = mean(lifeExp),
    min_le = min(lifeExp),
    max_le = max(lifeExp),
    se_le = sd(lifeExp)/sqrt(n())
  )

#' Using mutate()
#' create new variables prior to (or even after) summarizing information
gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap * pop / 10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))
gdp_pop_bycontinents_byyear

#' Other great resources
#' - R for Data Science: 
#'   http://r4ds.had.co.nz/
#' - Data Wrangling Cheat sheet:
#'   https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
#' - Introduction to dplyr:
#'   https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
#' - Data wrangling with R and RStudio: 
#'   https://www.rstudio.com/resources/webinars/data-wrangling-with-r-and-rstudio/

#' Key Points
#' - Use the dplyr package to manipulate dataframes.
#' - Use select() to choose variables from a dataframe.
#' - Use filter() to choose data based on values.
#' - Use group_by() and summarize() to work with subsets of data.
#' - Use mutate() to create new variables.

