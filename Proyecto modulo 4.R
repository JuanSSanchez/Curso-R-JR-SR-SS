# Taller modulo 4 ----

## Julian Rojas - Santiago Rojas - Sebastian Sanchez


library(readxl)
library(ggplot2)
library(gapminder)
library(tidyverse)
library(patchwork)

Spotify = (read_csv ("C:\\Users\\Santiago Rojas\\Downloads\\songs_normalize.csv"))

## Punto 1 ----

p1 <- ggplot(Spotify,aes(x = danceability, y = valence))+
  geom_point(color = "blue", alpha = 0.3)

## Punto 2 ----

p2 <- ggplot(Spotify,aes(x = mode, y = energy))+
  geom_boxplot(aes(color = mode, fill = mode,), 
               alpha = 0.5)+
  theme(
    legend.position ="none"
)

## Punto 3 ----

(p1 | p2)