library(dplyr)
library(janitor)
library(readxl)
library(gdata)


acervo_total <- readRDS(file="02-data-raw/acervo_total.rds")

# Acervo por ano
acervo_total %>% 
  group_by(base) %>% 
  summarise(n = n())

# Acervo do Min. Presidente
acervo_total %>% 
  filter(relator_atual == "MINISTRO PRESIDENTE") %>% 
  group_by(base) %>% 
  summarise(n = n())

# Acervo por classe
acervo_total %>% 
  group_by(base, classe) %>% 
  summarise(n = n()) %>%
  tidyr::pivot_wider(
    names_from = base,
    values_from = n
  ) %>% 
  DT::datatable()

# Maiores litigantes

source("99-funcao_litigantes.R")

# Litigantes 2017
lit2017 <- litigantes("acervo2017")

# Litigantes 2018
lit2018 <- litigantes("acervo2018")

# Litigantes 2019
lit2019 <- litigantes("acervo2019")

# Litigantes 2020
lit2020 <- litigantes("acervo2020")

litigantes <-
  cbind(lit2017,
        lit2018,
        lit2019,
        lit2020)

# Gerar as tabelas em excel

# litigantes2017 <- 
#   acervo_total %>% 
#   select(link, base, partes_polos_ativos) %>% 
#   filter(base == "acervo2017")
# 
# 
# litigantes2017_table <- table(
#       janitor::make_clean_names(unlist(stringr::str_split(litigantes$partes_polos_ativos, pattern = ",")))
#       )
# 
# a <- unlist(stringr::str_split(litigantes$partes_polos_ativos, pattern = ","))
# 
# a <- as.data.frame(trim(a))
# 
# names(a) <- "lit_2017"
# 
# maiores50 <-
# a %>% 
#   group_by(lit_2017) %>% 
#   filter(!is.na(lit_2017)) %>% 
#   summarise(n = n()) %>% 
#   arrange(desc(n)) %>% 
#   head(50)



  
