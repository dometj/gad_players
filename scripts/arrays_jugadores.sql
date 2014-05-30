-- Devuelver un conjunto de jugadores como arrays
CREATE OR REPLACE FUNCTION arrays_jugadores(ids INT[]) RETURNS SETOF REAL[] AS $BODY$
BEGIN
	RETURN QUERY SELECT ARRAY[j1.edad, j1.aceleracion, j1.agresividad, j1.agilidad, j1.anticipacion, j1.balance, j1.valentia, j1.compostura,
	j1.concentracion, j1.corners, j1.creatividad, j1.centro, j1.decision, j1.determinacion, j1.gambeta, j1.remate, j1.primer_toque, j1.instinto,
	j1.cabezazo, j1.influencia, j1.salto, j1.tiro_lejano, j1.pase_largo, j1.marca, j1.forma_fisica_natural, j1.juego_sin_pelota, j1.velocidad, j1.pases,
	j1.penales, j1.posicionamiento, j1.tiros_libres, j1.resistencia, j1.fuerza, j1.entrada, j1.trabajo_en_equipo, j1.tecnica, j1.sacrificio,
	j1.porcentaje_atajadas, j1.pierna_derecha, j1.pierna_izquierda, j1.arquero, j1.libero, j1.lateral_derecho, j1.defensor_central, j1.lateral_izquierdo,
	j1.carrilero_derecho, j1.carrilero_izquierdo, j1.mediocampista_defensivo, j1.mediocampista_derecho, j1.mediocampista_central,
	j1.mediocampista_izquierdo, j1.mediapunta_derecho, j1.mediapunta_central, j1.mediapunta_izquierdo, j1.delantero]::REAL[]
	FROM jugador_norm j1 WHERE j1.id = ANY(ids);
END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION arrays_jugadores(ids INT[]) OWNER TO proyecto_gad;