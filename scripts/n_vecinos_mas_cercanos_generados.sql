-- Algoritmo que devuelve los N jugadores mas cercanos (parecidos) a un jugador dado.
-- Parámetros:
	--jugador: elemento dado para realizar la busqueda a partir de el.
	--N: cantidad de elementos parecidos que se necesitan encontrar.
	
CREATE OR REPLACE FUNCTION n_vecinos_mas_cercanos_generados(jugador REAL[], n INTEGER) RETURNS INTEGER[] AS $BODY$
DECLARE
	jugadores INTEGER[];
	distancia REAL;
	
BEGIN
	jugadores := '{}';
	distancia := 0;
	-- Mientras "jugadores" posea una cantidad menor a N de elementos, aumento en 1 la distancia y vuelvo a llamar a elemento_a_distancia_X con la nueva distancia.
	LOOP
		distancia := distancia + 1;
		-- Llamo a elemento_a_distancia_X pasandole el jugador y la distancia inicial. Asigno el resultado a "jugadores"
		jugadores := elemento_a_distancia_X_generados(jugador,distancia);
		IF (array_length(jugadores, 1) > n) THEN
			EXIT;
		END IF;
	END LOOP;

	RETURN jugadores;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION n_vecinos_mas_cercanos_generados(REAL[], INTEGER) OWNER TO proyecto_gad;

SELECT n_vecinos_mas_cercanos_generados((SELECT arrays_jugadores(ARRAY[33044])), 3)