-- Devuelve un array de arrays pseudoaleatorio de juagdores
CREATE OR REPLACE FUNCTION array_de_jugadores(cantidad INT) RETURNS REAL[][] AS $BODY$
DECLARE
	jugadores_ids INT[];
	max INT;
	min INT;
	arrays REAL[][];
	jugador RECORD;
BEGIN
	SELECT MIN(id) INTO min FROM jugador_norm; -- determino el mínimo id de los jugadores
	SELECT MAX(id) INTO max FROM jugador_norm; -- determino el máximo id de los jugadores
	jugadores_ids := random_in_range(min, max, (cantidad*2)); -- determino los id de los jugadores a devolver
	arrays := '{}';
	-- armo el array de array con los jugadores
	FOR jugador IN (SELECT ARRAY[j.*] AS valores FROM arrays_jugadores(jugadores_ids) j) LOOP
		arrays := array_cat(arrays, jugador.valores);
	END LOOP;
	RETURN arrays;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION array_de_jugadores(cantidad INT) OWNER TO proyecto_gad;