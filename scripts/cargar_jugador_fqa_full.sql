CREATE OR REPLACE FUNCTION cargar_jugador_fqa_full() RETURNS VOID AS $$
DECLARE
firma REAL[];
-- selecciono los pivotes de prueba
pivotes CURSOR FOR SELECT atributos_jugador AS pivote_array FROM pivotes ORDER BY numero_pivote;
-- selecciono todos los jugadores normalizados estan
jugadores_norm CURSOR FOR SELECT arrays_jugadores(ARRAY[j.id]) AS jugador_array FROM jugador_norm j;
BEGIN	
	-- para cada jugador
	FOR jugador_actual IN jugadores_norm LOOP

		-- creo la firma para este jugador:
		-- para cada pivote calculo la distancia al jugador
		FOR pivote IN pivotes LOOP	
			-- firma[i] := distancia(jugador_actual,pivote):
			firma := array_append(firma, distancia_jugadores_fqa_full(jugador_actual.jugador_array::REAL[], pivote.pivote_array::REAL[]));
		END LOOP;
		
		-- hago el insert con los datos de la firma
		INSERT INTO jugador_fqa_full (pivote1,pivote2,pivote3,pivote4,pivote5,pivote6,
		pivote7,pivote8,pivote9,pivote10,pivote11,pivote12,pivote13,pivote14,pivote15,
		pivote16,pivote17,pivote18,jugador_norm) VALUES (firma[1],firma[2],firma[3],firma[4],
		firma[5],firma[6],firma[7],firma[8],firma[9],firma[10],firma[11],firma[12],
		firma[13],firma[14],firma[15],firma[16],firma[17],firma[18], jugador_actual.jugador_array[56]);
	END LOOP;
	RETURN;
END
$$ LANGUAGE "plpgsql";

ALTER FUNCTION cargar_jugador_fqa_full()
  OWNER TO proyecto_gad;

-- probar la función
SELECT cargar_jugador_fqa_full();

-- borrar toda la tabla
DELETE FROM jugador_fqa_full;

COMMENT ON FUNCTION cargar_jugador_fqa_full() IS 'Calcula la firma fqa para cada elemento de la tabla jugador_norm, teniendo en cuenta todos los atributos de cada jugador.';