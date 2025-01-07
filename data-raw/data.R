## code to prepare `data` dataset goes here
data<-readxl::read_excel("data-raw/Rolodex.xlsx")
data<-as.data.frame(data)
usethis::use_data(data, overwrite = TRUE)
