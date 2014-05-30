-- Selecciona una muestra pseudoaleatoria con una determinada cantidad de jugadores.
-- Devuleve una tabla de dos columnas: id (identificador del jugador) y atributos (astributos del jugador) 
CREATE OR REPLACE FUNCTION muestra(cantidad INT) RETURNS TABLE(id INT, atributos REAL[]) AS $BODY$
DECLARE
	jugadores_ids INT[];
	max INT;
	min INT;
BEGIN
	SELECT MIN(j.id) INTO min FROM jugador_norm j; -- determino el mínimo id de los jugadores
	SELECT MAX(j.id) INTO max FROM jugador_norm j; -- determino el máximo id de los jugadores
	jugadores_ids := random_in_range(min, max, (cantidad*2)); -- determino los id de los jugadores de la muestra
	RETURN QUERY SELECT unnest(jugadores_ids), arrays_jugadores(jugadores_ids[1:cantidad]::INT[]);
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION muestra(cantidad INT) OWNER TO proyecto_gad;