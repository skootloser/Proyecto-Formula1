## Los 5 circuitos con mas carreras ## 
circuitos_carreras_5 <- " CREATE VIEW circuitos_con_mascarreras 
SELECT  
a.circuitRef, 
a.name, 
a.location, 
a.country, 
COUNT(b.raceId) AS TotalCarreras 
FROM circuits a INNER JOIN races b ON a.circuitId = b.circuitId 
GROUP BY a.circuitId 
ORDER BY TotalCarreras DESC 
LIMIT 5;"

circuitos_con_mascarreras <- dbGetQuery(conexion, circuitos_carreras_5)

## de esta forma obtenemos los 5 circuitoss con mas carreras ##