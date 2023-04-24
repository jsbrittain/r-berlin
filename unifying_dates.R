# Load the lubridate package
library(lubridate)

process_date <- function(x){
  date <- ifelse(nchar(x) == 4, paste(x, "06-15", sep = "-"),
                 ifelse(nchar(x) == 7, paste(x, 15, sep = "-"), x))
  Date <- as.Date(parse_date_time(date, orders = c('mdy','dmy','myd','y','my','m','ymd','ym')))
  }
