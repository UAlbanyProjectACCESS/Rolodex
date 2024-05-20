## code to prepare `data` dataset goes here
data<-readxl::read_excel("data-raw/Rolodex.xlsx")
usethis::use_data(data, overwrite = TRUE)
