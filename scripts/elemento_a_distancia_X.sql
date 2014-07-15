-- Algoritmo que devuelve un array de jugadores que se encuentran a distancia X de un jugador dado.
-- Parámetros:
	-- jugador: elemento dado para realizar la busqueda a partir de el.
	-- distancia: radio de busqueda de la consulta.
	-- listado de pivotes sobre los que operar. (no entran como parametro, pero son llamados en el cuerpo)
	-- indice de firmas. (no entran como parametro, pero son llamados en el cuerpo)
	
CREATE OR REPLACE FUNCTION elemento_a_distancia_X(jugador REAL[], distancia REAL) RETURNS INTEGER[] AS $BODY$
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
	FOR pivote IN (SELECT * FROM pivotes ORDER BY numero_pivote ASC) LOOP
			contador_loop := contador_loop + 1;
			-- firma[i] := distancia(jugador_actual,pivote):
			firma[contador_loop] := distancia_jugadores_fqa_full(jugador,pivote.atributos_jugador::real[]);
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
	contador_loop := 0;
	FOR f IN (SELECT firmas.jugador FROM jugador_fqa_full firmas 
	WHERE firmas.pivote1 BETWEEN firma_inicial[1] AND firma_final[1] 
	AND firmas.pivote2 BETWEEN firma_inicial[2] AND firma_final[2]
	AND firmas.pivote3 BETWEEN firma_inicial[3] AND firma_final[3]
	AND firmas.pivote4 BETWEEN firma_inicial[4] AND firma_final[4]
	AND firmas.pivote5 BETWEEN firma_inicial[5] AND firma_final[5]
	AND firmas.pivote6 BETWEEN firma_inicial[6] AND firma_final[6]
	AND firmas.pivote7 BETWEEN firma_inicial[7] AND firma_final[7]
	AND firmas.pivote8 BETWEEN firma_inicial[8] AND firma_final[8]
	AND firmas.pivote9 BETWEEN firma_inicial[9] AND firma_final[9]
	AND firmas.pivote10 BETWEEN firma_inicial[10] AND firma_final[10]
	AND firmas.pivote11 BETWEEN firma_inicial[11] AND firma_final[11]
	AND firmas.pivote12 BETWEEN firma_inicial[12] AND firma_final[12]
	AND firmas.pivote13 BETWEEN firma_inicial[13] AND firma_final[13]
	AND firmas.pivote14 BETWEEN firma_inicial[14] AND firma_final[14]
	AND firmas.pivote15 BETWEEN firma_inicial[15] AND firma_final[15]
	AND firmas.pivote16 BETWEEN firma_inicial[16] AND firma_final[16]
	AND firmas.pivote17 BETWEEN firma_inicial[17] AND firma_final[17]
	AND firmas.pivote18 BETWEEN firma_inicial[18] AND firma_final[18]) LOOP
		contador_loop := contador_loop + 1;
		jugadores[contador_loop] := f.jugador;
	END LOOP;
	
	RETURN jugadores;
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION elemento_a_distancia_X(jugador REAL[], distancia REAL) OWNER TO proyecto_gad;