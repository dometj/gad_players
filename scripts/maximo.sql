-- Devuelve el máximo de un array de números
CREATE OR REPLACE FUNCTION maximo(numeros NUMERIC[]) RETURNS NUMERIC AS $BODY$
DECLARE
	max NUMERIC;
BEGIN
	max := 0;
	FOR i IN 1..array_length(numeros, 1) LOOP
		IF (numeros[i] > max) THEN
			max := numeros[i];
		END IF;
	END LOOP;
	RETURN max;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION maximo(numeros NUMERIC[]) OWNER TO proyecto_gad;