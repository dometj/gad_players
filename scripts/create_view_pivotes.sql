-- Esta vista contiene los pivotes.
-- id_jugador: el identificador del jugador
-- atributos_jugador: un array con todos los atributos del jugador
CREATE OR REPLACE VIEW pivotes (id_jugador, atributos_jugador ) AS
SELECT id, arrays_jugadores(ARRAY[id]::INTEGER[]) FROM jugador_norm 
WHERE numero_pivote <> 0;