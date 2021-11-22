litigantes <- function(valor_base){
  
  litigantesANO <- 
    acervo_total %>% 
    select(link, base, partes_polos_ativos) %>% 
    filter(base == valor_base)
  
  a <- unlist(stringr::str_split(litigantesANO$partes_polos_ativos, 
                                 pattern = ","))
  
  a <- as.data.frame(trim(a))
  
  names(a) <- "Litigante"
  
  maiores50 <-
    a %>% 
    group_by(Litigante) %>% 
    filter(!is.na(Litigante)) %>% 
    summarise(qtd = n()) %>% 
    mutate(perc = paste0(round(qtd/sum(qtd),3)*100,"%")) %>% 
    arrange(desc(qtd)) %>% 
    head(50)
  
return(maiores50)
  
}


