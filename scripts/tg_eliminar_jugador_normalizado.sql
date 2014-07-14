-- Este SP se ejecuta por el trigger tg_eliminar_jugador_normalizado. Elimina un jugador de la tabla jugador_norm
CREATE OR REPLACE FUNCTION eliminar_jugador() RETURNS TRIGGER AS $BODY$
BEGIN
	DELETE FROM jugador_norm 
	WHERE jugador = OLD.id;

	RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

-- Este trigger se ejecuta cada vez que se elimina un jugador en la tabla jugador para eliminar el jugador normalizado correspondiente en la tabla
-- jugador_norm 
CREATE TRIGGER tg_eliminar_jugador_normalizado AFTER DELETE
ON jugador FOR EACH ROW EXECUTE PROCEDURE eliminar_jugador();

ALTER FUNCTION eliminar_jugador() OWNER TO proyecto_gad;

COMMENT ON FUNCTION eliminar_jugador() IS 'Elimina el correspondiente jugador en la tabla jugador_norm cuando se elimina un jugado de la tabla jugador.';
COMMENT ON TRIGGER tg_eliminar_jugador_normalizado ON jugador IS 'Elimina el correspondiente jugador en la tabla jugador_norm cuando se elimina un jugado de la tabla jugador.';
