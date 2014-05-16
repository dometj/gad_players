CREATE OR REPLACE FUNCTION cargar_jugador_fqa_full() RETURNS integer AS $$
DECLARE
CANTIDAD_PIVOTES CONSTANT integer := 9;
CANTIDAD_ATRIBUTOS CONSTANT integer := 55;
contador_loop integer;
firma real[] DEFAULT array_fill(-1, ARRAY[CANTIDAD_PIVOTES]);
-- selecciono los pivotes de prueba (9 pivotes elegidos)
pivotes CURSOR FOR SELECT ARRAY[edad, aceleracion, agresividad, agilidad, anticipacion, balance,
		  valentia, compostura, concentracion, corners, creatividad, centro,
		  decision, determinacion, gambeta, remate, primer_toque, instinto,
		  cabezazo, influencia, salto, tiro_lejano, pase_largo, marca,
		  forma_fisica_natural, juego_sin_pelota, velocidad, pases, penales,
		  posicionamiento, tiros_libres, resistencia, fuerza, entrada,
		  trabajo_en_equipo, tecnica, sacrificio, porcentaje_atajadas,
		  pierna_derecha, pierna_izquierda, arquero, libero, lateral_derecho,
		  defensor_central, lateral_izquierdo,  carrilero_derecho, carrilero_izquierdo,
		  mediocampista_defensivo, mediocampista_derecho, mediocampista_central,
		  mediocampista_izquierdo, mediapunta_derecho, mediapunta_central,
		  mediapunta_izquierdo, delantero] AS pivote_array
	FROM jugador_norm WHERE id = ANY(ARRAY[5,9811,845,51174,111111,8777,216,656,1896]);
-- selecciono todos los jugadores normalizados 
jugadores_norm CURSOR FOR SELECT ARRAY[edad, aceleracion, agresividad, agilidad, anticipacion, balance,
		  valentia, compostura, concentracion, corners, creatividad, centro,
		  decision, determinacion, gambeta, remate, primer_toque, instinto,
		  cabezazo, influencia, salto, tiro_lejano, pase_largo, marca,
		  forma_fisica_natural, juego_sin_pelota, velocidad, pases, penales,
		  posicionamiento, tiros_libres, resistencia, fuerza, entrada,
		  trabajo_en_equipo, tecnica, sacrificio, porcentaje_atajadas,
		  pierna_derecha, pierna_izquierda, arquero, libero, lateral_derecho,
		  defensor_central, lateral_izquierdo,  carrilero_derecho, carrilero_izquierdo,
		  mediocampista_defensivo, mediocampista_derecho, mediocampista_central,
		  mediocampista_izquierdo, mediapunta_derecho, mediapunta_central,
		  mediapunta_izquierdo, delantero,jugador] AS jugador_array FROM jugador_norm;
BEGIN	
	-- para cada jugador
	FOR jugador_actual IN jugadores_norm LOOP
		-- inicializo un contador
		contador_loop:=0;

		-- creo la firma para este jugador:
		-- para cada pivote calculo la distancia al jugador
		FOR pivote IN pivotes LOOP	
			contador_loop := contador_loop + 1;
			-- firma[i] := distancia(jugador_actual,pivote):
			firma[contador_loop] := distancia_jugadores_fqa_full(jugador_actual.jugador_array[1:55]::real[],pivote.pivote_array::real[]);
		END LOOP;
		
		-- hago el insert con los datos de la firma
		INSERT INTO jugador_fqa_full (pivote1,pivote2,pivote3,pivote4,pivote5,pivote6,
		pivote7,pivote8,pivote9,pivote10,pivote11,pivote12,pivote13,pivote14,pivote15,
		pivote16,pivote17,pivote18,jugador_norm) VALUES (firma[1],firma[2],firma[3],firma[4],
		firma[5],firma[6],firma[7],firma[8],firma[9],firma[10],firma[11],firma[12],
		firma[13],firma[14],firma[15],firma[16],firma[17],firma[18], jugador_actual.jugador_array[56]);
	END LOOP;
	RETURN 1;
END
$$ LANGUAGE "plpgsql";

ALTER FUNCTION cargar_jugador_fqa_full()
  OWNER TO proyecto_gad;

-- probar la función
SELECT cargar_jugador_fqa_full();

-- borrar toda la tabla
DELETE FROM jugador_fqa_full;

COMMENT ON FUNCTION cargar_jugador_fqa_full() IS 'Calcula la firma fqa para cada elemento de la tabla jugador_norm, teniendo en cuenta todos los atributos de cada jugador.'