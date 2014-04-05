-- Este SP se ejecuta por el trigger tg_insertar_jugador_normalizado. Inserta un nuevo jugador en la tabla jugador_norm
CREATE OR REPLACE FUNCTION normalizar_jugador() RETURNS TRIGGER AS $BODY$
BEGIN
	INSERT INTO jugador_norm(edad, aceleracion, agresividad, agilidad, anticipacion, balance, valentia, compostura, concentracion, corners, creatividad,
	centro, decision, determinacion, gambeta, remate, primer_toque, instinto, cabezazo, influencia, salto, tiro_lejano, pase_largo, marca,
	forma_fisica_natural, juego_sin_pelota, velocidad, pases, penales, posicionamiento, tiros_libres, resistencia, fuerza, entrada, trabajo_en_equipo,
	tecnica, sacrificio, porcentaje_atajadas, pierna_derecha, pierna_izquierda, arquero, libero, lateral_derecho, defensor_central, lateral_izquierdo,
	carrilero_derecho, carrilero_izquierdo, mediocampista_defensivo, mediocampista_derecho, mediocampista_central, mediocampista_izquierdo,
	mediapunta_derecho, mediapunta_central, mediapunta_izquierdo, delantero, jugador) 
	VALUES(
	(NEW.edad - 12) * 100 /  (60 - 12),
	(NEW.aceleracion)*100 / 20,
	(NEW.agresividad)*100 / 20,
	(NEW.agilidad)*100 / 20,
	(NEW.anticipacion)*100 / 20,
	(NEW.balance)*100 / 20,
	(NEW.valentia)*100 / 20, 
	(NEW.compostura)*100 / 20,
	(NEW.concentracion)*100 / 20,
	(NEW.corners)*100 / 20,
	(NEW.creatividad)*100 / 20,
	(NEW.centro)*100 / 20,
	(NEW.decision)*100 / 20,
	(NEW.determinacion)*100 / 20,
	(NEW.gambeta)*100 / 20,
	(NEW.remate)*100 / 20,
	(NEW.primer_toque)*100 / 20,
	(NEW.instinto)*100 / 20,
	(NEW.cabezazo)*100 / 20,
	(NEW.influencia)*100 / 20,
	(NEW.salto)*100 / 20, 
	(NEW.tiro_lejano)*100 / 20,
	(NEW.pase_largo)*100 / 20,
	(NEW.marca)*100 / 20,
	(NEW.forma_fisica_natural)*100 / 20,
	(NEW.juego_sin_pelota)*100 / 20,
	(NEW.velocidad)*100 / 20,
	(NEW.pases)*100 / 20,
	(NEW.penales)*100 / 20,
	(NEW.posicionamiento)*100 / 20,
	(NEW.tiros_libres)*100 / 20,
	(NEW.resistencia)*100 / 20,
	(NEW.fuerza)*100 / 20,
	(NEW.entrada)*100 / 20,
	(NEW.trabajo_en_equipo)*100 / 20,
	(NEW.tecnica)*100 / 20,
	(NEW.sacrificio)*100 / 20,
	NEW.porcentaje_atajadas,
	(NEW.pierna_derecha)*100 / 20,
	(NEW.pierna_izquierda)*100 / 20,
	(NEW.arquero)*100 / 20,
	(NEW.libero)*100 / 20,
	(NEW.lateral_derecho)*100 / 20,
	(NEW.defensor_central)*100 / 20,
	(NEW.lateral_izquierdo)*100 / 20,
	(NEW.carrilero_derecho)*100 / 20,
	(NEW.carrilero_izquierdo)*100 / 20,
	(NEW.mediocampista_defensivo)*100 / 20,
	(NEW.mediocampista_derecho)*100 / 20,
	(NEW.mediocampista_central)*100 / 20,
	(NEW.mediocampista_izquierdo)*100 / 20,
	(NEW.mediapunta_derecho)*100 / 20,
	(NEW.mediapunta_central)*100 / 20,
	(NEW.mediapunta_izquierdo)*100 / 20,
	(NEW.delantero)*100 / 20,
	NEW.id);

	RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

-- Este trigger se ejecuta cada vez que se inserta un jugador en la tabla jugador para agregar el jugador a la tabla jugador_norm 
CREATE TRIGGER tg_insertar_jugador_normalizado AFTER INSERT
ON jugador FOR EACH ROW EXECUTE PROCEDURE normalizar_jugador();

ALTER FUNCTION normalizar_jugador() OWNER TO proyecto_gad;
