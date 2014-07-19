-- Implementación del algoritmo de selección incremenal de pivotes. Parámetros:
-- k: cantida de pivotes requeridos
-- n: tamaño de la muestra de potenciales pivotes
-- a: cantidad de pares de prueba para los pivotes
CREATE OR REPLACE FUNCTION seleccionar_pivotes(k INT, n INT, a INT) RETURNS VOID AS $BODY$
DECLARE
	cantidad_atributos INT;
	-- contienen los pares de prueba. 
	-- Los pares se forman: p1 = (pares[1], pares[a + 1]);...; pi = (pares[i], pares[a + i]);...; pa = (pares[a], pares[2a])  
	pares REAL[][];
	jugador RECORD;
	par RECORD;
	promedio_distancias REAL; -- es el promedio de las distancias máximas de los pares de prueba para un pivote
	pivote_id INT;
	mayor_promedio REAL;
	distancias_maximas REAL[]; -- almacena la distancia máxima para cada par de prueba para no tener que volver a calcular la distancia de los pivotes elegidos
	distancia REAL;
BEGIN
	-- pongo todos los pivotes en 0 para borrar los anteriores
	UPDATE jugador_norm 
	SET numero_pivote = 0;
	
	-- genero un array de jugadores para usar como pares de prueba
	pares := array_de_jugadores((a*2)::INT);
	cantidad_atributos := array_length(pares,2);
	RAISE NOTICE 'CANTIDAD DE ATRIBUTOS %', cantidad_atributos;

	-- inicializo las distancias máximas para cada par en 0
	distancias_maximas := array_fill(0, ARRAY[a]);
	
	FOR i IN 1..k LOOP -- para cada uno de los pivotes requeridos
		mayor_promedio := 0;
		
		FOR jugador IN (SELECT j.* FROM muestra(n) j) LOOP  -- genero una muestra pseudoaleatoria de n elementos
			FOR j IN 1..a LOOP -- por cada par de prueba
				
				-- calculo la diferencia entre las firmas del par respecto del potencial pivote
				distancia := distancia_jugadores_fqa_full(jugador.atributos, pares[j][1:cantidad_atributos])
							- distancia_jugadores_fqa_full(jugador.atributos, pares[j+a][1:cantidad_atributos]);

				-- si la distancia actual es mayor que la distancia máxima actual para el par, la actualizo
				IF(distancia > distancias_maximas[j]) THEN
					distancias_maximas[j] := distancia;
				END IF;
								
			END LOOP;

			-- calculo el promedio de las distancias máximas para el posible pivote
			SELECT avg(distancias.*)::REAL INTO promedio_distancias
			FROM unnest(distancias_maximas) distancias;
			
			-- si el promedio de este elemento de la muestra es mayor que el mayor hasta el momento
			IF (promedio_distancias >= mayor_promedio) THEN
				mayor_promedio = promedio_distancias; -- actualizo el mayor promedio
				pivote_id = jugador.id; -- indico el pivote elegido hasta el momento
			END IF;
		END LOOP;
		 
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

