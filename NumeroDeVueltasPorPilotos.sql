/*
"Medir el número de vueltas más rápidas registrada por cada piloto"

Esta vista cuenta el número de veces que cada piloto ha registrado
la vuelta más rápida en una carrera. Para esto, se identifica primero
la vuelta más rápida de cada carrera y luego se cuenta cuántas veces
cada piloto ha logrado esta hazaña.

Tablas utilizadas:
- laptimes: Contiene los tiempos de cada vuelta
- drivers: Información de los pilotos
- races: Información de las carreras
*/

-- Primero eliminamos la vista si ya existe
DROP VIEW IF EXISTS "main"."FastestLapsByDriver";

-- Creamos la vista para contar las vueltas más rápidas por piloto
CREATE VIEW FastestLapsByDriver AS
WITH FastestLapsPerRace AS (
    -- Subconsulta para identificar la vuelta más rápida de cada carrera
    SELECT 
        l.raceId,
        l.driverId,
        MIN(l.milliseconds) AS fastest_lap_time
    FROM 
        laptimes l
    GROUP BY 
        l.raceId
)
SELECT 
    d.driverId,
    d.forename || ' ' || d.surname AS driver_name,
    COUNT(*) AS total_fastest_laps
FROM 
    FastestLapsPerRace flpr
JOIN 
    drivers d ON flpr.driverId = d.driverId
JOIN
    laptimes l ON flpr.raceId = l.raceId 
        AND flpr.driverId = l.driverId 
        AND flpr.fastest_lap_time = l.milliseconds
GROUP BY 
    d.driverId
ORDER BY 
    total_fastest_laps DESC;

-- Para consultar el resultado: SELECT * FROM FastestLapsByDriver;