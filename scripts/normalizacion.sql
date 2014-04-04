-- Este script permite pasar los datos utilizados en la función de distancia desde la tabla "jugador" a la tabla "jugador_norm" y los normaliza a una escala
-- de 0 a 100

BEGIN TRANSACTION;

-- Vacio la tabla
DELETE FROM jugador_norm;

-- Reinicio la secuencia del identificador
ALTER SEQUENCE jugador_norm_id_seq RESTART WITH 1;

-- Inserto todos los datos de la tabla juagador en jugador_norm
INSERT INTO jugador_norm (edad, aceleracion, agresividad, agilidad, anticipacion, balance, valentia, compostura, concentracion, corners, creatividad, centro, decision,
determinacion, gambeta, remate, primer_toque, instinto, cabezazo, influencia, salto, tiro_lejano, pase_largo, marca, forma_fisica_natural, juego_sin_pelota,
velocidad, pases, penales, posicionamiento, tiros_libres, resistencia, fuerza, entrada, trabajo_en_equipo, tecnica, sacrificio, porcentaje_atajadas,
pierna_derecha, pierna_izquierda, arquero, libero, lateral_derecho, defensor_central, lateral_izquierdo, carrilero_derecho, carrilero_izquierdo,
mediocampista_defensivo, mediocampista_derecho, mediocampista_central, mediocampista_izquierdo, mediapunta_derecho, mediapunta_central, mediapunta_izquierdo,
delantero, jugador) (SELECT edad, aceleracion, agresividad, agilidad, anticipacion, balance, valentia, compostura, concentracion, corners, creatividad, centro, decision,
determinacion, gambeta, remate, primer_toque, instinto, cabezazo, influencia, salto, tiro_lejano, pase_largo, marca, forma_fisica_natural, juego_sin_pelota,
velocidad, pases, penales, posicionamiento, tiros_libres, resistencia, fuerza, entrada, trabajo_en_equipo, tecnica, sacrificio, porcentaje_atajadas,
pierna_derecha, pierna_izquierda, arquero, libero, lateral_derecho, defensor_central, lateral_izquierdo, carrilero_derecho, carrilero_izquierdo,
mediocampista_defensivo, mediocampista_derecho, mediocampista_central, mediocampista_izquierdo, mediapunta_derecho, mediapunta_central, mediapunta_izquierdo,
delantero, id FROM jugador);

-- Normalizo todos los atributos a 100
UPDATE jugador_norm
SET 
	edad = (edad - 12) * 100 /  (60 - 12),
	aceleracion = (aceleracion)*100 / 20,
	agresividad = (agresividad)*100 / 20,
	agilidad = (agilidad)*100 / 20,
	anticipacion = (anticipacion)*100 / 20,
	balance = (balance)*100 / 20,
	valentia = (valentia)*100 / 20, 
	compostura = (compostura)*100 / 20,
	concentracion = (concentracion)*100 / 20,
	corners = (corners)*100 / 20,
	creatividad = (creatividad)*100 / 20,
	centro = (centro)*100 / 20,
	decision = (decision)*100 / 20,
	determinacion = (determinacion)*100 / 20,
	gambeta = (gambeta)*100 / 20,
	remate = (remate)*100 / 20,
	primer_toque = (primer_toque)*100 / 20,
	instinto = (instinto)*100 / 20,
	cabezazo = (cabezazo)*100 / 20,
	influencia = (influencia)*100 / 20,
	salto = (salto)*100 / 20, 
	tiro_lejano = (tiro_lejano)*100 / 20,
	pase_largo = (pase_largo)*100 / 20,
	marca = (marca)*100 / 20,
	forma_fisica_natural = (forma_fisica_natural)*100 / 20,
	juego_sin_pelota = (juego_sin_pelota)*100 / 20,
	velocidad = (velocidad)*100 / 20,
	pases = (pases)*100 / 20,
	penales = (penales)*100 / 20,
	posicionamiento = (posicionamiento)*100 / 20,
	tiros_libres = (tiros_libres)*100 / 20,
	resistencia = (resistencia)*100 / 20,
	fuerza = (fuerza)*100 / 20,
	entrada = (entrada)*100 / 20,
	trabajo_en_equipo = (trabajo_en_equipo)*100 / 20,
	tecnica = (tecnica)*100 / 20,
	sacrificio = (sacrificio)*100 / 20,
	pierna_derecha = (pierna_derecha)*100 / 20,
	pierna_izquierda = (pierna_izquierda)*100 / 20,
	arquero = (arquero)*100 / 20,
	libero = (libero)*100 / 20,
	lateral_derecho = (lateral_derecho)*100 / 20,
	defensor_central = (defensor_central)*100 / 20,
	lateral_izquierdo = (lateral_izquierdo)*100 / 20,
	carrilero_derecho = (carrilero_derecho)*100 / 20,
	carrilero_izquierdo = (carrilero_izquierdo)*100 / 20,
	mediocampista_defensivo = (mediocampista_defensivo)*100 / 20,
	mediocampista_derecho = (mediocampista_derecho)*100 / 20,
	mediocampista_central = (mediocampista_central)*100 / 20,
	mediocampista_izquierdo = (mediocampista_izquierdo)*100 / 20,
	mediapunta_derecho = (mediapunta_derecho)*100 / 20,
	mediapunta_central = (mediapunta_central)*100 / 20,
	mediapunta_izquierdo = (mediapunta_izquierdo)*100 / 20,
	delantero = (delantero)*100 / 20;

END TRANSACTION;