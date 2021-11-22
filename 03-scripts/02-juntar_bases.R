library(dplyr)
library(janitor)
library(readxl)

# Juntar as bases


# Compara bases

a <-
janitor::compare_df_cols(
acervo17_cn <- janitor::clean_names(acervo17),
acervo18_cn <- janitor::clean_names(acervo18),
acervo19_cn <- janitor::clean_names(acervo19),
acervo20_cn <- janitor::clean_names(acervo20),
return = "mismatch"
)

# Selecionar as variaveis X, Y, Z no acervo 17 que são comuns em todas as bases
acervo17_menor <- 
acervo17_cn %>% 
  select(classe, 
         numero,
         link,
         partes_polos_ativos,
         partes_polos_passivos,
         relator_atual) %>% 
  mutate(base = "acervo2017")
  
         
acervo18_menor <- 
acervo18_cn %>% 
  select(classe, 
         numero,
         link,
         partes_polos_ativos,
         partes_polos_passivos,
         relator_atual) %>% 
mutate(base = "acervo2018")

acervo19_menor <- 
acervo19_cn %>% 
  select(classe, 
         numero,
         link,
         partes_polos_ativos,
         partes_polos_passivos,
         relator_atual) %>% 
  mutate(base = "acervo2019")

acervo20_menor <- 
acervo20_cn %>% 
  select(classe, 
         numero,
         link,
         partes_polos_ativos,
         partes_polos_passivos,
         relator_atual) %>% 
  mutate(base = "acervo2020")

# acervo17_cn[L,C]
# acervo17_cn[,c(1,2,3)]

acervo_total <- 
  rbind(acervo17_menor,
        acervo18_menor,
        acervo19_menor,
        acervo20_menor)

# Conferencia
nrow(acervo17) + nrow(acervo18) + nrow(acervo19) + nrow(acervo20)


# Retirando NA
acervo_total %>% 
  filter(is.na(classe)) %>% 
  nrow()

142024 - 376 -> 141648

acervo_total <- 
acervo_total %>% 
  filter(!is.na(classe))

acervo_total %>% nrow()

saveRDS(acervo_total, file="02-data-raw/acervo_total.rds")
