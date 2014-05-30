-- Devuelve un número pseudoaleatorio que este incluido en el intervalo [min, max]
CREATE OR REPLACE FUNCTION random_in_range(min NUMERIC, max NUMERIC) RETURNS NUMERIC AS $BODY$
DECLARE
	random_number NUMERIC;
BEGIN
	max := max + 1;
	SELECT trunc(min + (max - min) * random()) INTO random_number;
	
	RETURN random_number;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION random_in_range(min NUMERIC, max NUMERIC) OWNER TO proyecto_gad;

-- Devuelve un array de tamaño count de números pseudoaleatorios que esten incluido en el intervalo [min, max]
-- La cantidad de números pseudoaleatorios requeridos (count) no puede ser mayor que el tamaño del rango (max - min) mas 1
CREATE OR REPLACE FUNCTION random_in_range(min NUMERIC, max NUMERIC, count INT) RETURNS NUMERIC[] AS $BODY$
DECLARE
	random_numbers NUMERIC[];
	random NUMERIC[];
BEGIN
	IF (count <= (max + 1 - min)) THEN
		random_numbers := ARRAY[random_in_range(min, max)];
		WHILE (array_length(random_numbers, 1) < count) LOOP
			random := ARRAY[random_in_range(min, max)];
			IF (NOT(random_numbers @> random)) THEN
				random_numbers := array_append(random_numbers, random[1]);
			END IF;
		END LOOP;
	ELSE
		RAISE 'La cantidad de números pseudoaleatorios requeridos (count) no puede ser mayor que el tamaño del rango (max - min) mas 1';
	END IF;
	RETURN random_numbers;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION random_in_range(min NUMERIC, max NUMERIC, count INT) OWNER TO proyecto_gad;
