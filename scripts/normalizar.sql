CREATE OR REPLACE FUNCTION normalizar(jugador REAL[]) RETURNS REAL[] AS $BODY$
BEGIN
	jugador[1] := (jugador[1] - 12) * 100 /  (60 - 12); -- normalizo la edad
	FOR i IN 2..array_length(jugador) LOOP
		IF(i <> 38) THEN -- si no es el porcentaje de atajadas (este atributo ya esta en escala de 100)
		jugador[i] := (jugador[i])*100 / 20
		END IF;
	END LOOP;
END;
$BODY$ LANGUAGE plpgsql;

COMMENT ON FUNCTION normalizar(REAL[]) IS 'Esta función normaliza los atributos de un jugador pasados en un array. LOS ATRIBUTOS DEBEN ESTAR EN ORDEN.';

ALTER FUNCTION normalizar(REAL[]) OWNER TO proyecto_gad;