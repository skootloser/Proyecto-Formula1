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


# Observar los mejores corredores del año 2017 en base a la suma de sus puntos y victorias

Mejores_en_2017 <- "
SELECT
    a.driverRef,
    a.forename,
    a.surname,
    a.number,
    d.year,
    SUM(b.points) AS TotalPuntos,
    sum(b.wins) AS TotalVictorias
FROM drivers a
INNER JOIN driver_standings b ON a.driverId = b.driverId
INNER JOIN races c ON b.raceId = c.raceId
INNER JOIN seasons d ON c.year = d.year
WHERE d.year = 2017
GROUP BY a.driverId
ORDER BY TotalPuntos DESC
LIMIT 5;
"

RE_Mejores_2017 <- dbGetQuery(conexion, Mejores_en_2017)

# Observar los mejores corredores del año 2016 en base a la suma de sus puntos y victorias

Mejores_en_2016 <- "
SELECT
    a.driverRef,
    a.forename,
    a.surname,
    a.number,
    d.year,
    SUM(b.points) AS TotalPuntos,
    sum(b.wins) AS TotalVictorias
FROM drivers a
INNER JOIN driver_standings b ON a.driverId = b.driverId
INNER JOIN races c ON b.raceId = c.raceId
INNER JOIN seasons d ON c.year = d.year
WHERE d.year = 2016
GROUP BY a.driverId
ORDER BY TotalPuntos DESC
LIMIT 5;
"

RE_Mejores_2016 <- dbGetQuery(conexion, Mejores_en_2016)

# Observar los mejores corredores del año 2015 en base a la suma de sus puntos y victorias

Mejores_en_2015 <- "
SELECT
    a.driverRef,
    a.forename,
    a.surname,
    a.number,
    d.year,
    SUM(b.points) AS TotalPuntos,
    sum(b.wins) AS TotalVictorias
FROM drivers a
INNER JOIN driver_standings b ON a.driverId = b.driverId
INNER JOIN races c ON b.raceId = c.raceId
INNER JOIN seasons d ON c.year = d.year
WHERE d.year = 2015
GROUP BY a.driverId
ORDER BY TotalPuntos DESC
LIMIT 5;
"

RE_Mejores_2015 <- dbGetQuery(conexion, Mejores_en_2015)

# Observar los mejores corredores del año 2014 en base a la suma de sus puntos y victorias

Mejores_en_2014 <- "
SELECT
    a.driverRef,
    a.forename,
    a.surname,
    a.number,
    d.year,
    SUM(b.points) AS TotalPuntos,
    sum(b.wins) AS TotalVictorias
FROM drivers a
INNER JOIN driver_standings b ON a.driverId = b.driverId
INNER JOIN races c ON b.raceId = c.raceId
INNER JOIN seasons d ON c.year = d.year
WHERE d.year = 2014
GROUP BY a.driverId
ORDER BY TotalPuntos DESC
LIMIT 5;
"

RE_Mejores_2014 <- dbGetQuery(conexion, Mejores_en_2014)

# Observar los mejores corredores del año 2013 en base a la suma de sus puntos y victorias

Mejores_en_2013 <- "
SELECT
    a.driverRef,
    a.forename,
    a.surname,
    a.number,
    d.year,
    SUM(b.points) AS TotalPuntos,
    sum(b.wins) AS TotalVictorias
FROM drivers a
INNER JOIN driver_standings b ON a.driverId = b.driverId
INNER JOIN races c ON b.raceId = c.raceId
INNER JOIN seasons d ON c.year = d.year
WHERE d.year = 2013
GROUP BY a.driverId
ORDER BY TotalPuntos DESC
LIMIT 5;
"

RE_Mejores_2013 <- dbGetQuery(conexion, Mejores_en_2013)

#### DE ESTA FORMA OBTENEMOS EN TABLAS LOS 5 MEJORES CORREDORES DURANTE 2013 - 2017 ###


#### MEJORES ESCUDERIAS EN BASE SUS PUNTOS Y VICTORIAS DURANTE 2017 - 2013 ####

### Mejores escuderias en 2017 ##

mejores_escuderias_2017 <- "SELECT
a.constructorId,
a.name,
c.year,
SUM(b.points) AS TotalPuntos,
sum(b.wins) AS TotalVictorias
FROM constructors a
INNER JOIN constructor_standings b ON a.constructorId = b.constructorId
INNER JOIN races c ON c.raceId = b.raceId
WHERE c.year = 2017
GROUP BY a.constructorId
ORDER BY TotalPuntos DESC
LIMIT 5;"

REmejores_escuderias2017 <- dbGetQuery(conexion, mejores_escuderias_2017)

## Mejores escuderias en 2016 ##

mejores_escuderias_2016 <- "SELECT
a.constructorId,
a.name,
c.year,
SUM(b.points) AS TotalPuntos,
sum(b.wins) AS TotalVictorias
FROM constructors a
INNER JOIN constructor_standings b ON a.constructorId = b.constructorId
INNER JOIN races c ON c.raceId = b.raceId
WHERE c.year = 2016
GROUP BY a.constructorId
ORDER BY TotalPuntos DESC
LIMIT 5;"

REmejores_escuderias2016 <- dbGetQuery(conexion, mejores_escuderias_2016)

## Mejores escuderias en 2015 ##

mejores_escuderias_2015 <- "SELECT
a.constructorId,
a.name,
c.year,
SUM(b.points) AS TotalPuntos,
sum(b.wins) AS TotalVictorias
FROM constructors a
INNER JOIN constructor_standings b ON a.constructorId = b.constructorId
INNER JOIN races c ON c.raceId = b.raceId
WHERE c.year = 2015
GROUP BY a.constructorId
ORDER BY TotalPuntos DESC
LIMIT 5;"

REmejores_escuderias2015 <- dbGetQuery(conexion, mejores_escuderias_2015)

## Mejores escuderias en 2014 ##

mejores_escuderias_2014 <- "SELECT
a.constructorId,
a.name,
c.year,
SUM(b.points) AS TotalPuntos,
sum(b.wins) AS TotalVictorias
FROM constructors a
INNER JOIN constructor_standings b ON a.constructorId = b.constructorId
INNER JOIN races c ON c.raceId = b.raceId
WHERE c.year = 2014
GROUP BY a.constructorId
ORDER BY TotalPuntos DESC
LIMIT 5;"

REmejores_escuderias2014 <- dbGetQuery(conexion, mejores_escuderias_2014)

## Mejores escuderias en 2013 ##

mejores_escuderias_2013 <- "SELECT
a.constructorId,
a.name,
c.year,
SUM(b.points) AS TotalPuntos,
sum(b.wins) AS TotalVictorias
FROM constructors a
INNER JOIN constructor_standings b ON a.constructorId = b.constructorId
INNER JOIN races c ON c.raceId = b.raceId
WHERE c.year = 2013
GROUP BY a.constructorId
ORDER BY TotalPuntos DESC
LIMIT 5;"

REmejores_escuderias2013 <- dbGetQuery(conexion, mejores_escuderias_2013)

## DE ESTA FORMA OBTENEMOS LAS 5 MEJORES ESCUDERIAS DURANTE 2017 - 2013 ##

## Los 5 circuitos con mas carreras ##

circuitos_carreras_5 <- "SELECT 
a.circuitRef,
a.name,
a.location,
a.country,
COUNT(b.raceId) AS TotalCarreras
FROM circuits a
INNER JOIN races b ON a.circuitId = b.circuitId
GROUP BY a.circuitId
ORDER BY TotalCarreras DESC
LIMIT 5;"

circuitos_con_mascarreras <- dbGetQuery(conexion, circuitos_carreras_5) #de esta forma obtenemos los 5 circuitps con mas carreras