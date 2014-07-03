-- Implementación del algoritmo de selección incremenal de pivotes. Parámetros:
-- k: cantida de pivotes requeridos
-- n: tamaño de la muestra de potenciales pivotes
-- a: cantidad de pares de prueba para los pivotes
CREATE OR REPLACE FUNCTION seleccionar_pivotes(k INT, n INT, a INT) RETURNS VOID AS $BODY$
DECLARE
	pares REAL[][];
	jugador RECORD;
	par RECORD;
	suma_distancias REAL;
	pivote_id INT;
	pivote REAL[][];
	mayor_promedio REAL;
	cantidad_atributos INT;
	pivotes REAL[][];
	distancias REAL[];
BEGIN
	-- pongo todos los pivotes en 0 para borrar los anteriores
	UPDATE jugador_norm 
	SET numero_pivote = 0;
	-- genero un array de jugadores para usar como pares de prueba
	pares := array_de_jugadores(a); 
	pivotes := '{}';
	-- Calculo la cantidad de atributos de la tabla jugador_norm descontando el id, la fk y el numero_pivote para poder indexar el array
	SELECT (COUNT(column_name)-3) INTO cantidad_atributos FROM information_schema.columns WHERE table_name = 'jugador_norm';
	
	FOR i IN 1..k LOOP -- para cada uno de los pivotes requeridos
		suma_distancias := 0;
		mayor_promedio := 0;
		
		FOR jugador IN (SELECT j.* FROM muestra(n) j) LOOP  -- genero una muestra pseudoaleatoria de n elementos
			FOR j IN 1..a LOOP -- por cada par de prueba
				IF (i > 1) THEN -- si ya selleccione algún pivote
					FOR k IN 1..array_length(pivotes, 1) LOOP -- por cada uno de los pivotes anteriores
						-- calculo la diferencia entre las firmas del par respecto de los pivotes anteriores
						distancias := array_append(distancias, (distancia_jugadores_fqa_full(pivotes[k][1:cantidad_atributos],
								pares[j][1:cantidad_atributos]) -
								distancia_jugadores_fqa_full(pivotes[k][1:cantidad_atributos],
								pares[j+a][1:cantidad_atributos])));
					END LOOP;
				END IF;
				-- calculo la diferencia entre las firmas del par respecto del potencial pivote
				distancias := array_append(distancias, (distancia_jugadores_fqa_full(jugador.atributos, pares[j][1:cantidad_atributos])
							- distancia_jugadores_fqa_full(jugador.atributos, pares[j+a][1:cantidad_atributos])));
				-- sumo la distancia máxima entre las firmas del par
				suma_distancias = suma_distancias + maximo(distancias::NUMERIC[]); 
				distancias := '{}';
			END LOOP;
			-- si el promedio de este elemento de la muestra es mayor que el mayor hasta el momento
			IF ((suma_distancias/a) >= mayor_promedio) THEN
				mayor_promedio = suma_distancias/a;
				pivote_id = jugador.id;
				pivote := ARRAY[jugador.atributos];
			END IF;
		END LOOP;
		-- guardo los pivotes en un array para poder comparar con los nuevos
		pivotes := array_cat(pivotes, pivote); 
		-- indico el nuevo pivote i
		UPDATE jugador_norm 
		SET numero_pivote = i
		WHERE id = pivote_id;
	END LOOP;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION seleccionar_pivotes(INT, INT, INT) OWNER TO proyecto_gad;

COMMENT ON FUNCTION seleccionar_pivotes(INT, INT, INT) IS 'Implementación del algoritmo de selección incremenal de pivotes. Parámetros: k (cantida de pivotes requeridos),
n (tamaño de la muestra de potenciales pivotes) y  a (cantidad de pares de prueba para los pivotes)';

-- SELECT seleccionar_pivotes(2, 4, 4)

-- SELECT id FROM jugador_norm
-- WHERE numero_pivote != 0

