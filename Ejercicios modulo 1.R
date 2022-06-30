# Ejercicios modulo 1 ----
## Julian Rojas - Santiago Rojas - Sebastian Sanchez

## Punto 1 ----

### A) La principal diferencia entre la función c() y la función list()
### tiene que ver con que en la función c() los vectores atomicos dentro de 
### esta función todos van a tener la misma caracteristica, es decir que
### todos son un character o double, por ejemplo ("TRUE", "2", "Hola").
### Mientras que en la función list() cada uno de los datos que tengamos
### dentro de la lista se respetara su tipo de dato. 
### por ejemplo (TRUE, 2, "Hola", 3.4). 

### B) La diferencia entre estas dos opciónes es que si hacemos uso de
### los parentesis cuadrados dobles vamos a extraer un elemento como tal,
### mientras que si se hace con parentesis cuadrados simples se extrae
### una lista con el elemento que hayamos seleccionado.

## Punto 2 ----
matriz <- matrix(rep(1:7, 4), ncol = 4, nrow = 7, byrow = TRUE)

### Literal a:

matriz[,2]

### Literal b:

matriz[3,]

### Literal c:

matriz[3:7,]

### Literal d:

matriz[1:2,2:4]


## Punto 3 ----

numero <- 5

if (numero %% 2==0 ) {
  print("Es par")
} else if(numero %% 2==1){
  print("Es impar")
}


## Punto 4 ----

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")


for (nombre in nombres){
  print(paste("Bienvenido", nombre))
}

## Punto 5 ----

mi_funcion <- function(a,b=1) {
  x <- a^b
  return(x)
}

respuesta <- mi_funcion(4,)

respuesta