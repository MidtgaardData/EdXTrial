##Installing package for web-scraping
install.packages("rvest")
library(rvest)

##Defining variables
url <- "https://en.wikipedia.org/wiki/Gun_violence_in_the_United_States_by_state"
h <- read_html(url)
