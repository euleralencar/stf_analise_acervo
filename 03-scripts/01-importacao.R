# Importação de

library(dplyr)
library(janitor)
library(readxl)



acervo20 <- read_excel("C:/Users/euler/Downloads/Acervo-Lista_Geral_31_12_2020 (1).xlsx", 
                                               skip = 2)

acervo19 <- read_excel("C:/Users/euler/Downloads/Acervo-Lista_Geral_31_12_2019 (1).xlsx", 
                                               col_types = c("text", "skip", "numeric", 
                                                             "text", "skip", "text", "text", "text", 
                                                             "text", "text", "text", "numeric", 
                                                             "text", "numeric", "text", "numeric", 
                                                             "text", "text", "text", "text", "numeric", 
                                                             "text", "text", "text", "text", "text", 
                                                             "text", "text", "text", "text", "text", 
                                                             "text", "text"), skip = 2)


acervo18 <- read_excel("C:/Users/euler/Downloads/Acervo-Lista_Geral_31_12_2018 (1).xlsx", 
                                               col_types = c("text", "skip", "text", 
                                                             "numeric", "skip", "text", "text", 
                                                             "text", "numeric", "text", "numeric", 
                                                             "text", "numeric", "text", "text", 
                                                             "text", "text", "numeric", "text", 
                                                             "text", "text", "text", "text", "text", 
                                                             "text", "text", "text", "text", "text", 
                                                             "numeric"), skip = 2)

#install.packages("readxl")

acervo17 <- readxl::read_excel("C:/Users/euler/Downloads/Acervo-Lista_Geral_31_12_2017 (1).xlsx", 
                                               col_types = c("text", "skip", "text", 
                                                             "numeric", "text", "text", "text", 
                                                             "numeric", "text", "numeric", "text", 
                                                             "numeric", "text", "text", "text", 
                                                             "text", "text", "text", "text", "text", 
                                                             "text", "text", "text", "text", "text", 
                                                             "text", "text"))


# Limpzar os nomes

acervo17_cn <- janitor::clean_names(acervo17)
acervo18_cn <- janitor::clean_names(acervo18)
acervo19_cn <- janitor::clean_names(acervo19)
acervo20_cn <- janitor::clean_names(acervo20)
