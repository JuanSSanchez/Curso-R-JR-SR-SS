# Proyecto final ---- 28 de julio de 2022

## Julian Rojas - Santiago Rojas - Sebastian Sanchez ----


## Punto 1 ----

### 1.1 ----


calificación <- -2 

if(calificación >= 0 & calificación < 10 ) {
  print("¡Hay mucho por mejorar!")
} else if (calificación >= 10 & calificación < 20){
  print("¡Bien! Pero podría ser excelente.")
} else if(calificación >= 20 & calificación <= 30){
  print("¡Excelente Servicio! Sigue así.")
} else  {
  print("Inserte un valor entre 0 y 30")
}


### 1.2 ----


calificaciones <- function(Calidad=10, Decoración=5, Servicio=15){
  sumatoria <- Calidad+Decoración+Servicio
  return(sumatoria)
}

calificaciones(,10,5)


## Punto 2 ----

library(tidyverse)

### 2.1 ----

price_ratings <- read_csv("~\Universidad\Octavo semestre\Clases R\Bases de datos\Bases proyecto final\price_ratings.csv")

restaurant_locations <- read_csv("~\Universidad\Octavo semestre\Clases R\Bases de datos\Bases proyecto final\restaurant_locations.csv")

glimpse(price_ratings)

glimpse(restaurant_locations)

price_ratings%>%
  head(8)

restaurant_locations%>%
  head(8)

# No, el dataframe de restauranr locations si cumple con estas caracteristicas de que cada fila
# es una observación y cada columna es una variabel, mientras que en el dataframe de price ratings
# no se cumplen estas caracteristicas.

### 2.2 ----


price_ratings2 <- price_ratings %>%
  pivot_wider(names_from = Variable, values_from = Valor)

### 2.3 ----

restaurant_locations <- restaurant_locations %>%
  rename(Id = Id_restaurant)

bases_unidas <- restaurant_locations%>%
  inner_join(price_ratings2, by = "Id")


### 2.4 ----

base_filtrico <- bases_unidas %>%
  arrange(desc(Price))%>%
  select(Restaurant, Price, Service)

base_filtrico %>%
  head(1)

base_filtrico %>%
  tail(1)

# El restaurante mas caro es Harry Cipriani con un precio de 65 y el restaurante mas barato
# es Lamarca con un precio de 19.


### 2.5 ----

Precios_area <- bases_unidas %>%
  group_by(East)%>%
  summarise(promedio = mean(Price))

# En este caso la comida es mas cara en el lado Este de Manahattan


## Punto 3 ----

### 3.1

reg <- lm(Price ~ Food + Decor + Service + East, data = bases_unidas)

summary(reg)

# La variable Service no es estadisticamente significativa en esta regresión, de resto las demas
# variables tienen un nivel de significancia. Por otro lado los precios se ven mas influenciados
# por la variable East.


## Punto 4 ----


library(gapminder)
library(patchwork)
library(ggplot2)

### 4.1 ----

graf_1<- ggplot(bases_unidas,aes(x = Service))+
  geom_density(aes(color = factor(East), fill = factor(East),), 
               alpha = 0.5)+
  labs(title = "Grafica de densidad",
       x = "Servicio",
       y = "Densidad"
  )

graf_1

# La zona de Manhattan que tiende a tener mejor calificación en el servicio es la zona Este.


### 4.2 ---- 


graf_3 <- ggplot(bases_unidas, aes(x=Price, y=Decor, color=factor(East, labels = c("Oeste","Este")))) +
  geom_point() + 
  scale_color_manual(values=c('#1874CD','#008B00'))+
  labs(
    title="Grafico de dispersión",
    x = "Precio",
    y = "Decoración",
    color = "Zona",
  )

graf_3

# En el grafico de dispersión el restaurante con el menor precio se encuentra en la zona Este y el 
# restaurante con menor deoración se encuentra en la zona Oeste.