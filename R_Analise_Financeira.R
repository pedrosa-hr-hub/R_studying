#create vector and arrange its output
sort(c(2, 1, 3, 0), decreasing = TRUE)

#account packages in the official distribution of CRAN
df_cran_pkgs <- available.packages()
n_cran_pkgs <- nrow(df_cran_pkgs)
print(n_cran_pkgs)

#account packages in the local storage
n_local_pgks <- nrow(installed.packages())
print(n_local_pgks)

#install new packages
install.packages('readr')
install.packages('tidyverse')
install.packages('fortunes')

#install github
install.packages('devtools')
devtools::install_github("hadley/ggplot2")

#loading packages
library(dplyr)

#call function but not your all content
fortunes::fortune(10)

#call function using require method
my_fct <- function(x){
  require(quantmod)
  
  df <- getSymbols(x, auto.assign = F)
  return(df)
}

#update packages
update.packages()

#clear memories
rm(list = ls())

#check data
adfeR::list_available_data()

#move archive
my_file <- adfeR::get_data_file('Ibov.csv')

file.copy(from = my_file, to = '~')

#use pkg
library(tidyverse)

#import to dataframe
my_df_ibov <- read_csv(my_file)

#read dataframe
glimpse(my_df_ibov)

my_cols <- cols(
  price.close = col_double(),
  ref.date = col_date(format = "")
)

#converting types
my_df_ibov <- read_csv(
  my_file, col_types = my_cols
)

#import outher .csv archive

my_file2 <- adfeR::get_data_file('funky_csv_file.csv')

#archive with error
df_funky <- read_csv(
  my_file2, col_types = cols()
)

glimpse(df_funky)

#archive is ready!

df_just_read <- read_delim(
  file = my_file2,
  skip = 7,
  delim = ';', 
  col_types = cols(),
  locale = locale(decimal_mark = ',')
)

glimpse(df_just_read)

#read excel files

install.packages('readxl')

library(readxl)
library(dplyr)

my_file <- '00-text-resourse/data/ibov/Ibov_xlsx.xlsx'

my_df <- read_excel(my_file, sheet = 'Sheet1')

#read .Rdata file

my_x <- 1:1000

my_file <- adfeR::get_data_file('temp.RData')

load(file = my_file)

library(RSQLite)
# set name of SQLITE file
f_sqlite <- adfeR::get_data_file('SQLite_db.SQLITE')
# open connection
my_con <- dbConnect(drv = SQLite(), f_sqlite)
# read table
my_df <- dbReadTable(conn = my_con,
                     name = 'MyTable1') # name of table in sqlite
# print with str
glimpse(my_df)
