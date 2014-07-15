CREATE OR REPLACE FUNCTION cargar_jugador_fqa_full() RETURNS VOID AS $$
DECLARE
-- este cursor contiene las firmas, como array, de todos los elementos
firmas CURSOR FOR SELECT id, array_agg(distancia) AS distancias
			FROM (SELECT j.id, p.numero_pivote,
				distancia_jugadores_fqa_full(arrays_jugadores(ARRAY[j.id])::REAL[], p.atributos_jugador::REAL[]) AS distancia
				FROM pivotes p, jugador_norm j
				ORDER BY j.id, p.numero_pivote) distancia
			GROUP BY id;
BEGIN	
	-- borro las firmas anteriores
	DELETE FROM jugador_fqa_full;
	
	-- inserto cada una de las firmas
	FOR firma IN firmas LOOP
		INSERT INTO jugador_fqa_full (pivote1, pivote2, pivote3, pivote4, pivote5, pivote6, pivote7, pivote8, pivote9, pivote10, pivote11, pivote12,
		pivote13, pivote14, pivote15, pivote16, pivote17, pivote18, jugador) VALUES (firma.distancias[1], firma.distancias[2], firma.distancias[3],
		firma.distancias[4], firma.distancias[5], firma.distancias[6], firma.distancias[7], firma.distancias[8], firma.distancias[9],
		firma.distancias[10], firma.distancias[11], firma.distancias[12], firma.distancias[13], firma.distancias[14], firma.distancias[15],
		firma.distancias[16], firma.distancias[17], firma.distancias[18], firma.id);
	END LOOP;
END
$$ LANGUAGE "plpgsql";

ALTER FUNCTION cargar_jugador_fqa_full()
  OWNER TO proyecto_gad;

COMMENT ON FUNCTION cargar_jugador_fqa_full() IS 'Calcula la firma fqa para cada elemento de la tabla jugador_norm, teniendo en cuenta todos los atributos de cada jugador.';

-- DROP FUNCTION cargar_jugador_fqa_full() 

-- Probar:
-- SELECT cargar_jugador_fqa_full();
