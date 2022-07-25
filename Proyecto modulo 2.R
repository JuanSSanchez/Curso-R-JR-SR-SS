# Taller 2 - Modulo 2 - Tidyverse ----

## Julian Rojas - Santiago Rojas - Sebastian Sanchez 


library(tidyverse)
library(naniar)

##Punto 1

all_csv_sorted <- read_csv('~\Universidad\Octavo semestre\Clases R\Bases de datos\all_csv sorted.csv')

Data<-all_csv_sorted

colnames(Data)

length(Data)

nrow(Data)

Data %>%
  head(10)

##Punto 2

n_miss(Data)
n_complete(Data)
miss_var_summary(Data)
miss_case_summary(Data)
miss_var_table(Data)
miss_case_table(Data)

Data_NA<-miss_var_summary(Data)

##Punto 3


Data_cambio<- Data %>%
  mutate(Cambio = (as.numeric(`Average price of 1GB (USD  at the start of 2021)`)/as.numeric(`Average price of 1GB (USD – at start of 2020)`))*100 - 100)%>%
  arrange(desc(Cambio))%>%
  select(Country, Cambio)%>%
  top_n(10, Cambio)

##Punto 4

mode <- function(x) {
  return(as.numeric(names(which.max(table(x)))))
}

Data_restaurada <- Data %>%
  mutate(velocidad_internet = replace_na(`Avg 
(Mbit/s)Ookla`, mode(`Avg 
(Mbit/s)Ookla`)))

velocidad_net <- Data_restaurada %>%
  group_by(`Continental region`)%>%
  summarise(promedio=mean(velocidad_internet))%>%
  arrange(promedio)

velocidad_net%>%
  head(1)


##Punto 5

Data_restaurada2 <- Data %>%
  mutate(usuarios = replace_na(`Internet users`,
                               mode(`Internet users`)))

Usuarios_net <- Data_restaurada2%>%
  group_by(`Continental region`)%>%
  summarise(promedio = mode(`Internet users`))%>%
  arrange(promedio)

Data_restaurada_completa <- Data_restaurada%>%
  left_join(Data_restaurada2)

library(ggplot2)

ggplot(Data_restaurada_completa, aes(`velocidad_internet`,`usuarios`)) + geom_point()









