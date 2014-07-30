CREATE OR REPLACE FUNCTION cargar_jugador_fqa_full_generados() RETURNS VOID AS $BODY$
BEGIN	
	-- borro las firmas anteriores
	DELETE FROM jugador_fqa_full_generados;
	
	-- inserto cada una de las firmas
	INSERT INTO jugador_fqa_full_generados(firma, jugador)
	SELECT array_agg(d.distancia), j.id
	FROM (SELECT j.id, p.numero_pivote, distancia_jugadores_fqa_full(arrays_jugadores(ARRAY[j.id])::REAL[], p.pivote::REAL[]) AS distancia
		FROM pivotes_generados p, jugador_norm j
		ORDER BY j.id, p.numero_pivote) d
	GROUP BY id;
END
$BODY$ LANGUAGE "plpgsql";

ALTER FUNCTION cargar_jugador_fqa_full_generados()
  OWNER TO proyecto_gad;

COMMENT ON FUNCTION cargar_jugador_fqa_full() IS 'Calcula la firma fqa para cada elemento de la tabla jugador_norm, teniendo en cuenta los pivotes generados (ANDRES).';

-- SELECT cargar_jugador_fqa_full_generados();

-- SELECT * FROM jugador_fqa_full_generados LIMIT 10;
