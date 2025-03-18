/*
"Medir el número de vueltas más rápidas registrada por cada piloto"

Esta vista cuenta el número de veces que cada piloto ha registrado
la vuelta más rápida en una carrera durante los años 2013 a 2017.
Para esto, se identifica primero la vuelta más rápida de cada carrera
y luego se cuenta cuántas veces cada piloto ha logrado esta hazaña.

Tablas utilizadas:
- laptimes: Contiene los tiempos de cada vuelta
- drivers: Información de los pilotos
- races: Información de las carreras
*/

-- Primero eliminamos la vista si ya existe
DROP VIEW IF EXISTS "main"."VueltasRapidasPorPiloto";

-- Creamos la vista para contar las vueltas más rápidas por piloto
CREATE VIEW VueltasRapidasPorPiloto AS
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
        r.year BETWEEN 2013 AND 2017
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
    total_vueltas_rapidas DESC;

-- Para consultar el resultado: SELECT * FROM VueltasRapidasPorPiloto;