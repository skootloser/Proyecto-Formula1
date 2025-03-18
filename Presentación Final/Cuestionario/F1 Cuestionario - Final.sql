-- CUESTIONARIO --
--Se requiere la creación de vistas SQL para responder a las siguientes 5 preguntas. 

-- 1.¿Cuál es el piloto con más victorias en la historia de la Fórmula 1 hasta el 2017?--

CREATE VIEW "Mejor piloto hasta 2017" AS 
SELECT
  	  ds.driverId AS ID,
      d.code AS Código,
      d.forename || ' ' || d.surname AS Nombre,  
	  d.dob AS Cumpleaños,
	  d.nationality AS Nacionalidad,
	  SUM(ds.points) AS Puntos,
      SUM(ds.wins) AS Victorias
FROM
    driver_standings ds
JOIN
    drivers d ON ds.driverId = d.driverId
WHERE
    ds.raceId IN (SELECT raceId FROM races WHERE year <= "2017") 
GROUP BY
    d.driverId
ORDER BY
   Victorias DESC
LIMIT 1;

--2.Los 5 circuitos con más carreras realizadas --

CREATE VIEW "5 circuitos con más carreras" AS 
SELECT  
a.circuitRef, 
a.name, 
a.location, 
a.country, 
COUNT(b.raceId) AS TotalCarreras 
FROM circuits a INNER JOIN races b ON a.circuitId = b.circuitId 
GROUP BY a.circuitId 
ORDER BY TotalCarreras DESC 
LIMIT 5;

-- 3.¿Cuál ha sido en constructor con mas puntos acumulados en la historia de la Fórmula 1?--
 
CREATE VIEW "Mejor  constructor" AS
SELECT
c.constructorId AS ID_Constructor,
c.name AS constructores,
c.nationality AS nacionalidad, 
c.url AS url, 
SUM(r.points) AS puntaje 
FROM 
results r
INNER JOIN
constructors c  ON r.constructorId = c.constructorId
GROUP BY 
c.name, c.constructorId, c.nationality, c.url
ORDER BY 
puntaje DESC 
LIMIT 1; 

--4.¿Cuál ha sido la vuelta más rápida registrada en toda la historia de la Fórmula 1 y qué piloto la hizo?

CREATE VIEW "La vuelta más rapida y su piloto" AS 
SELECT 
    l.raceId AS ID_Carrera,                             
    l.driverId AS ID_Piloto,                            
    d.forename || ' ' || d.surname AS Nombre_Piloto,   
    r.name AS Nombre_Carrera,                   
    r.year AS Año,                                
    c.name AS Nombre_Circuito,                
    l.lap AS Vueltas,                                 
    l.time AS Tiempo_Vueltas,                  
    l.milliseconds AS Milisegundos                    
FROM 
    laptimes l
INNER JOIN 
    drivers d ON l.driverId = d.driverId  
INNER JOIN 
    races r ON l.raceId = r.raceId         
INNER JOIN
    circuits c ON r.circuitId = c.circuitId 
ORDER BY 
    l.milliseconds ASC
LIMIT 1;                                   


--5.Lista los 3 pilotos con mayor cantidad de podios (posicion 1, 2 o 3 en la tabla results)--

CREATE VIEW "Top 3 pilotos y sus podios" AS 
SELECT a.driverId AS "ID_Conductor",
       a.forename || ' ' || a.surname AS "Nombre_Piloto", 	  
       SUM(CASE WHEN c.position = 1 THEN 1 ELSE 0 END) AS "Podios_1",
       SUM(CASE WHEN c.position = 2 THEN 1 ELSE 0 END) AS "Podios_2",
       SUM(CASE WHEN c.position = 3 THEN 1 ELSE 0 END) AS "Podios_3",
       COUNT(c.position) AS "Cantidad_Podios"
FROM results c INNER JOIN drivers a ON c.driverId = a.driverId
WHERE c.position IN (1, 2, 3)
GROUP BY a.driverId, a.forename, a.surname
ORDER BY "Cantidad_Podios" DESC
LIMIT 3;

