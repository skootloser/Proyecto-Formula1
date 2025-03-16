/*

¿Cuál ha sido la vuelta más rápida registrada en toda la historia de la Fórmula 1 y qué piloto la hizo?

La vista une las tablas:
- laptimes: Contiene tiempos de vuelta
- drivers: Información sobre los pilotos
- races: Información sobre las carreras
- circuits: Información sobre los circuitos

El resultado muestra la vuelta más rápida ordenando por milisegundos
y limitando a 1 registro.
*/

-- Primero eliminamos la vista si ya existe
DROP VIEW IF EXISTS "main"."FastestLapEver";

-- Creamos la vista para obtener la vuelta más rápida
CREATE VIEW FastestLapEver AS 
SELECT 
    l.raceId,                              -- ID de la carrera
    l.driverId,                            -- ID del piloto
    d.forename || ' ' || d.surname AS driver_name,   -- Nombre completo del piloto
    r.name AS race_name,                   -- Nombre de la carrera
    r.year,                                -- Año de la carrera
    c.name AS circuit_name,                -- Nombre del circuito
    l.lap,                                 -- Número de vuelta
    l.time AS lap_time,                    -- Tiempo en formato de tiempo
    l.milliseconds                         -- Tiempo en milisegundos (para ordenar)
FROM 
    laptimes l
INNER JOIN 
    drivers d ON l.driverId = d.driverId   -- Unión con tabla de pilotos
INNER JOIN 
    races r ON l.raceId = r.raceId         -- Unión con tabla de carreras
INNER JOIN
    circuits c ON r.circuitId = c.circuitId -- Unión con tabla de circuitos
ORDER BY 
    l.milliseconds ASC                     -- Ordenamos del tiempo más rápido al más lento
LIMIT 1;                                   -- Limitamos a 1 resultado (la vuelta más rápida)

-- Para consultar el resultado: SELECT * FROM FastestLapEver;