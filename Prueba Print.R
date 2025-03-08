#inserción de data frame en Rstudio
library(readxl)
library(dplyr)

# Conexión con data SQLite

library(RSQLite)
library(DBI)
ruta <- "C:/Users/Abraham/Desktop/UCV/SQL UCV/Formula 1 DATA/Formula1.sqlite"
conexion <- dbConnect(RSQLite::SQLite(), ruta)

# Prueba de conexion generando la primera tabla

corredores <- dbGetQuery(conexion, "SELECT * FROM drivers") 
print("Datos de la tabla: drivers")
