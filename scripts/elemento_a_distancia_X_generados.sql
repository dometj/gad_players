-- Algoritmo que devuelve un array de jugadores que se encuentran a distancia X de un jugador dado.
-- Parámetros:
	-- jugador: elemento dado para realizar la busqueda a partir de el.
	-- distancia: radio de busqueda de la consulta.
	-- listado de pivotes sobre los que operar. (no entran como parametro, pero son llamados en el cuerpo)
	-- indice de firmas. (no entran como parametro, pero son llamados en el cuerpo)
	
CREATE OR REPLACE FUNCTION elemento_a_distancia_X_generados(jugador_consulta REAL[], distancia REAL) RETURNS INTEGER[] AS $BODY$
DECLARE
	jugadores INTEGER[];
	contador_loop INTEGER;
	i INTEGER;
	f RECORD;
	pivote RECORD;
	firma REAL[];
	firma_inicial REAL[];
	firma_final REAL[];
BEGIN
	jugadores := '{}';
	-- Se calcula la firma del jugador iterando sobre el listado de pivotes.
	contador_loop:=0;
	FOR pivote IN (SELECT * FROM pivotes_generados ORDER BY numero_pivote ASC) LOOP
			contador_loop := contador_loop + 1;
			-- firma[i] := distancia(jugador_actual,pivote):
			firma[contador_loop] := distancia_jugadores_fqa_full(jugador_consulta, pivote.pivote::real[]);
	END LOOP;
	-- Se define el intervalo de busqueda a partir de la firma y la distancia.
		-- Se itera para obtener la cota inferior y la cota superior del intervalo de busqueda.
		contador_loop:=0;
		FOR i IN 1..array_length(firma,1) LOOP
			contador_loop := contador_loop + 1;
			-- firma_inicial := firma - distancia.
			firma_inicial[contador_loop] := firma[contador_loop] - distancia;
			-- firma_final := firma + distancia.
			firma_final[contador_loop] := firma[contador_loop] + distancia;
		END LOOP;
	-- Se busca en la tabla de firmas todas aquellas que se encuentran dentro del intervalo definido.
	
	jugadores := (SELECT array_agg(candidatos.jugador)
					FROM (SELECT firmas.jugador, distancia_jugadores_fqa_full(jugador_consulta,(SELECT arrays_jugadores(ARRAY[firmas.jugador]))) AS dist
							FROM jugador_fqa_full_generados firmas
							WHERE firmas.firma[1] BETWEEN firma_inicial[1] AND firma_final[1] 
							AND firmas.firma[2] BETWEEN firma_inicial[2] AND firma_final[2]
							AND firmas.firma[3] BETWEEN firma_inicial[3] AND firma_final[3]
							AND firmas.firma[4] BETWEEN firma_inicial[4] AND firma_final[4]
							AND firmas.firma[5] BETWEEN firma_inicial[5] AND firma_final[5]
							AND firmas.firma[6] BETWEEN firma_inicial[6] AND firma_final[6]
							AND firmas.firma[7] BETWEEN firma_inicial[7] AND firma_final[7]
							AND firmas.firma[8] BETWEEN firma_inicial[8] AND firma_final[8]
							AND firmas.firma[9] BETWEEN firma_inicial[9] AND firma_final[9]
							AND firmas.firma[10] BETWEEN firma_inicial[10] AND firma_final[10]
							AND firmas.firma[11] BETWEEN firma_inicial[11] AND firma_final[11] 
							AND firmas.firma[12] BETWEEN firma_inicial[12] AND firma_final[12]
							AND firmas.firma[13] BETWEEN firma_inicial[13] AND firma_final[13]
							AND firmas.firma[14] BETWEEN firma_inicial[14] AND firma_final[14]
							AND firmas.firma[15] BETWEEN firma_inicial[15] AND firma_final[15]
							AND firmas.firma[16] BETWEEN firma_inicial[16] AND firma_final[16]
							AND firmas.firma[17] BETWEEN firma_inicial[17] AND firma_final[17]
							AND firmas.firma[18] BETWEEN firma_inicial[18] AND firma_final[18]
							AND firmas.firma[19] BETWEEN firma_inicial[19] AND firma_final[19]
							AND firmas.firma[20] BETWEEN firma_inicial[20] AND firma_final[20]
							AND firmas.firma[21] BETWEEN firma_inicial[21] AND firma_final[21] 
							AND firmas.firma[22] BETWEEN firma_inicial[22] AND firma_final[22]
							AND firmas.firma[23] BETWEEN firma_inicial[23] AND firma_final[23]
							AND firmas.firma[24] BETWEEN firma_inicial[24] AND firma_final[24]
							AND firmas.firma[25] BETWEEN firma_inicial[25] AND firma_final[25]
							AND firmas.firma[26] BETWEEN firma_inicial[26] AND firma_final[26]
							AND firmas.firma[27] BETWEEN firma_inicial[27] AND firma_final[27]
							AND firmas.firma[28] BETWEEN firma_inicial[28] AND firma_final[28]
							AND firmas.firma[29] BETWEEN firma_inicial[29] AND firma_final[29]
							AND firmas.firma[30] BETWEEN firma_inicial[30] AND firma_final[30]
							AND firmas.firma[31] BETWEEN firma_inicial[31] AND firma_final[31] 
							AND firmas.firma[32] BETWEEN firma_inicial[32] AND firma_final[32]
							AND firmas.firma[33] BETWEEN firma_inicial[33] AND firma_final[33]
							AND firmas.firma[34] BETWEEN firma_inicial[34] AND firma_final[34]
							AND firmas.firma[35] BETWEEN firma_inicial[35] AND firma_final[35]
							AND firmas.firma[36] BETWEEN firma_inicial[36] AND firma_final[36]
							AND firmas.firma[37] BETWEEN firma_inicial[37] AND firma_final[37]
							AND firmas.firma[38] BETWEEN firma_inicial[38] AND firma_final[38]
							AND firmas.firma[39] BETWEEN firma_inicial[39] AND firma_final[39]
							AND firmas.firma[40] BETWEEN firma_inicial[40] AND firma_final[40]
							AND firmas.firma[41] BETWEEN firma_inicial[41] AND firma_final[41] 
							AND firmas.firma[42] BETWEEN firma_inicial[42] AND firma_final[42]
							AND firmas.firma[43] BETWEEN firma_inicial[43] AND firma_final[43]
							AND firmas.firma[44] BETWEEN firma_inicial[44] AND firma_final[44]
							AND firmas.firma[45] BETWEEN firma_inicial[45] AND firma_final[45]
							AND firmas.firma[46] BETWEEN firma_inicial[46] AND firma_final[46]
							AND firmas.firma[47] BETWEEN firma_inicial[47] AND firma_final[47]
							AND firmas.firma[48] BETWEEN firma_inicial[48] AND firma_final[48]
							AND firmas.firma[49] BETWEEN firma_inicial[49] AND firma_final[49]
							AND firmas.firma[50] BETWEEN firma_inicial[50] AND firma_final[50]
							AND firmas.firma[51] BETWEEN firma_inicial[51] AND firma_final[51] 
							AND firmas.firma[52] BETWEEN firma_inicial[52] AND firma_final[52]
							AND firmas.firma[53] BETWEEN firma_inicial[53] AND firma_final[53]
							AND firmas.firma[54] BETWEEN firma_inicial[54] AND firma_final[54]
							AND firmas.firma[55] BETWEEN firma_inicial[55] AND firma_final[55]
							ORDER BY dist) candidatos
					WHERE candidatos.dist <= distancia);
	
	RETURN jugadores;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION elemento_a_distancia_X_generados(jugador_consulta REAL[], distancia REAL) OWNER TO proyecto_gad;

-- SELECT elemento_a_distancia_X_generados((SELECT arrays_jugadores(ARRAY[33044])), 74)

--DROP FUNCTION elemento_a_distancia_X(jugador_consulta REAL[], distancia REAL);