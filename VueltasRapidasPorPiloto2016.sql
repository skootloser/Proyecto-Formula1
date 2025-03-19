/*
"Medir el número de vueltas más rápidas registrada por cada piloto en 2016"

Esta vista cuenta el número de veces que cada piloto ha registrado
la vuelta más rápida en una carrera durante el año 2016.

Tablas utilizadas:
- laptimes: Contiene los tiempos de cada vuelta
- drivers: Información de los pilotos
- races: Información de las carreras
*/

-- Primero eliminamos la vista si ya existe
DROP VIEW IF EXISTS "main"."VueltasRapidasPorPiloto2016";

-- Creamos la vista para contar las vueltas más rápidas por piloto en 2016
CREATE VIEW VueltasRapidasPorPiloto2016 AS
WITH VueltasRapidasPorCarrera AS (
    -- Subconsulta para identificar la vuelta más rápida de cada carrera
    SELECT 
        l.raceId,
        l.driverId,
        MIN(l.milliseconds) AS tiempo_vuelta_rapida
    FROM 
        laptimes l
    JOIN
        races r ON l.raceId = r.raceId
    WHERE
        r.year = 2016
    GROUP BY 
        l.raceId
)
SELECT 
    d.driverId AS id_piloto,
    d.forename || ' ' || d.surname AS nombre_piloto,
    COUNT(*) AS total_vueltas_rapidas
FROM 
    VueltasRapidasPorCarrera vrpc
JOIN 
    drivers d ON vrpc.driverId = d.driverId
JOIN
    laptimes l ON vrpc.raceId = l.raceId 
        AND vrpc.driverId = l.driverId 
        AND vrpc.tiempo_vuelta_rapida = l.milliseconds
GROUP BY 
    d.driverId
ORDER BY 
    total_vueltas_rapidas DESC
LIMIT 5;

-- Para consultar el resultado: SELECT * FROM VueltasRapidasPorPiloto2016;