-- Algoritmo que devuelve .
-- Parámetros: .
--DROP FUNCTION busqueda_por_similitud_atributos(real[])

CREATE OR REPLACE FUNCTION busqueda_por_similitud_atributos(jugador REAL[]) RETURNS SETOF REAL AS $BODY$

BEGIN
	RETURN QUERY SELECT unnest(n_vecinos_mas_cercanos((normalizar(jugador)),1));
END;
$BODY$ LANGUAGE plpgsql;


ALTER FUNCTION busqueda_por_similitud_atributos(jugador REAL[]) OWNER TO proyecto_gad;

SELECT busqueda_por_similitud_atributos(ARRAY[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0.01,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);

