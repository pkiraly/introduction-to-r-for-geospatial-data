#' 8. Writing Data
#' How can I save plots and data created in R?
#' https://datacarpentry.org/r-intro-geospatial/08-writing-data/index.html

#' Saving plots
#' RStudio ‘Export’ button

pdf("Distribution-of-gdpPercap.pdf", width=12, height=4)
ggplot(data = gapminder, aes(x = gdpPercap)) +   
  geom_histogram()

# You then have to make sure to turn off the pdf device!

dev.off()

#' Challenge 1
#' Rewrite your ‘pdf’ command to print a second page in the pdf,
#' showing the side-by-side bar plot of gdp per capita in countries in the Americas
#'  in the years 1952 and 2007 that you created in the previous episode.


#' jpeg, png, etc. are used similarly

#' Writing data
#' write.csv() - very similar to read.csv()

aust_subset <- filter(gapminder, country == "Australia")

write.csv(aust_subset,
          file="cleaned-data/gapminder-aus.csv"
)

#' help
?write.csv

# hide row names
write.csv(
  aust_subset,
  file="cleaned-data/gapminder-aus.csv",
  row.names=FALSE
)

#' Challenge 2
#' Subset the gapminder data to include only data points collected since 1990.
#' Write out the new subset to a file in the cleaned-data/ directory.




