-- Algoritmo que devuelve .
-- Parámetros: .
DROP FUNCTION busqueda_por_similitud_atributos(real[])

CREATE OR REPLACE FUNCTION busqueda_por_similitud_atributos(jugador REAL[]) RETURNS SETOF REAL AS $BODY$

BEGIN
	RETURN QUERY SELECT unnest(n_vecinos_mas_cercanos((normalizar(jugador)),1)) AS id;
	--RETURN query select unnest(ARRAY[[1223,1.3],[111123,2],[33044,3]]::REAL[]);
END;
$BODY$ LANGUAGE plpgsql;


ALTER FUNCTION busqueda_por_similitud_atributos(jugador REAL[]) OWNER TO proyecto_gad;

SELECT ARRAY[[[arrays_jugadores(ARRAY[1])],1],[[arrays_jugadores(ARRAY[113])],2],[[arrays_jugadores(ARRAY[1123])],3]]::real

select array[1,1,1,1]

SELECT busqueda_por_similitud_atributos(ARRAY[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0.01,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);

