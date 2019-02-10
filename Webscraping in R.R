##Installing package for web-scraping
install.packages("rvest")
library(rvest)
library(dplyr)

##Defining variables
url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
h <- read_html(url)
class(h)
##Extracting table from the URL
tab <- h %>% html_nodes("table")
tab <- tab[[2]]
tab

##Convert HTML table to dataframe
tab <- tab %>% html_table
class(tab)
