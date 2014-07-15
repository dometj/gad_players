-- Este SP se ejecuta por el trigger tg_modificar_jugador_normalizado. Modifica un jugador de la tabla jugador_norm
CREATE OR REPLACE FUNCTION modificar_jugador() RETURNS TRIGGER AS $BODY$
BEGIN
	UPDATE jugador_norm 
	SET
	edad = (NEW.edad - 12) * 100 /  (60 - 12),
	aceleracion = (NEW.aceleracion)*100 / 20,
	agresividad = (NEW.agresividad)*100 / 20,
	agilidad = (NEW.agilidad)*100 / 20,
	anticipacion = (NEW.anticipacion)*100 / 20,
	balance = (NEW.balance)*100 / 20,
	valentia = (NEW.valentia)*100 / 20, 
	compostura = (NEW.compostura)*100 / 20,
	concentracion = (NEW.concentracion)*100 / 20,
	corners = (NEW.corners)*100 / 20,
	creatividad = (NEW.creatividad)*100 / 20,
	centro = (NEW.centro)*100 / 20,
	decision = (NEW.decision)*100 / 20,
	determinacion = (NEW.determinacion)*100 / 20,
	gambeta = (NEW.gambeta)*100 / 20,
	remate = (NEW.remate)*100 / 20,
	primer_toque = (NEW.primer_toque)*100 / 20,
	instinto = (NEW.instinto)*100 / 20,
	cabezazo = (NEW.cabezazo)*100 / 20,
	influencia = (NEW.influencia)*100 / 20,
	salto = (NEW.salto)*100 / 20, 
	tiro_lejano = (NEW.tiro_lejano)*100 / 20,
	pase_largo = (NEW.pase_largo)*100 / 20,
	marca = (NEW.marca)*100 / 20,
	forma_fisica_natural = (NEW.forma_fisica_natural)*100 / 20,
	juego_sin_pelota = (NEW.juego_sin_pelota)*100 / 20,
	velocidad = (NEW.velocidad)*100 / 20,
	pases = (NEW.pases)*100 / 20,
	penales = (NEW.penales)*100 / 20,
	posicionamiento = (NEW.posicionamiento)*100 / 20,
	tiros_libres = (NEW.tiros_libres)*100 / 20,
	resistencia = (NEW.resistencia)*100 / 20,
	fuerza = (NEW.fuerza)*100 / 20,
	entrada = (NEW.entrada)*100 / 20,
	trabajo_en_equipo = (NEW.trabajo_en_equipo)*100 / 20,
	tecnica = (NEW.tecnica)*100 / 20,
	sacrificio = (NEW.sacrificio)*100 / 20,
	porcentaje_atajadas = NEW.porcentaje_atajadas,
	pierna_derecha = (NEW.pierna_derecha)*100 / 20,
	pierna_izquierda = (NEW.pierna_izquierda)*100 / 20,
	arquero = (NEW.arquero)*100 / 20,
	libero = (NEW.libero)*100 / 20,
	lateral_derecho = (NEW.lateral_derecho)*100 / 20,
	defensor_central = (NEW.defensor_central)*100 / 20,
	lateral_izquierdo = (NEW.lateral_izquierdo)*100 / 20,
	carrilero_derecho = (NEW.carrilero_derecho)*100 / 20,
	carrilero_izquierdo = (NEW.carrilero_izquierdo)*100 / 20,
	mediocampista_defensivo = (NEW.mediocampista_defensivo)*100 / 20,
	mediocampista_derecho = (NEW.mediocampista_derecho)*100 / 20,
	mediocampista_central = (NEW.mediocampista_central)*100 / 20,
	mediocampista_izquierdo = (NEW.mediocampista_izquierdo)*100 / 20,
	mediapunta_derecho = (NEW.mediapunta_derecho)*100 / 20,
	mediapunta_central = (NEW.mediapunta_central)*100 / 20,
	mediapunta_izquierdo = (NEW.mediapunta_izquierdo)*100 / 20,
	delantero = (NEW.delantero)*100 / 20
	WHERE jugador = NEW.id;

	RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

-- Este trigger se ejecuta cada vez que se modifica un jugador en la tabla jugador para modificar el jugador normalizado correspondiente en la tabla
-- jugador_norm 
CREATE TRIGGER tg_modificar_jugador_normalizado AFTER UPDATE
ON jugador FOR EACH ROW EXECUTE PROCEDURE modificar_jugador();

ALTER FUNCTION modificar_jugador() OWNER TO proyecto_gad;

COMMENT ON FUNCTION modificar_jugador() IS 'Modifica el correspondiente jugador de la tabla jugador_norm cuando el jugador de la tabla jugador es modificado.';
COMMENT ON TRIGGER tg_modificar_jugador_normalizado ON jugador IS 'Modifica el correspondiente jugador de la tabla jugador_norm cuando el jugador de la tabla jugador es modificado.';