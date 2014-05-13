CREATE OR REPLACE FUNCTION distancia_jugadores_fqa_full(primer_jugador real[], segundo_jugador real[]) RETURNS real AS
$$
-- Calcula la distancia entre dos jugadores.
-- Pensado para el indice "fqa full" (que tiene en cuenta 55 atributos).
DECLARE
-- cantidad de atributos a tener en cuenta en el calculo de la distancia
-- son 57 atributos de los cuales se descartan "id" y "jugador":
CANTIDAD_ATRIBUTOS CONSTANT integer := 55;
-- valor por default de la ponderacion:
PONDERACION_DEFAULT CONSTANT integer := 1;
-- declaro un array que tiene las ponderaciones para cada atributo,
-- deben ir en el orden correspondiente al que estan las 55 columnas de la tabla jugador_norm
ponderacion integer[] NOT NULL DEFAULT array_fill(PONDERACION_DEFAULT, ARRAY[CANTIDAD_ATRIBUTOS]);
sumatoria real := 0;
BEGIN
	-- seteo las ponderaciones diferentes de 1,
	-- (el array está rellenado por default con ponderaciones del valor PONDERACION_DEFAULT)
	--ponderacion[] := ; -- ponderacion para el campo ..
	--ponderacion[] := ; -- ponderacion para el campo ..
	-- realizo el calculo de la distancia
	FOR i IN 1..CANTIDAD_ATRIBUTOS LOOP
		sumatoria=ponderacion[i]*(primer_jugador[i]-segundo_jugador[i])^2+sumatoria;
	END LOOP;
	RETURN |/sumatoria; -- |/ hace la raiz cuadrada

END
$$ LANGUAGE "plpgSQL";

ALTER FUNCTION distancia_jugadores_fqa_full(real[], real[])
  OWNER TO proyecto_gad;

-- probar la funcion:
select distancia_jugadores_fqa_full('{31,1,75,55,65,55,80,50,55,15,50,45,55,65,40,40,55,40,55,50,55,35,15,65,75,40,60,50,45,65,20,65,60,70,60,50,55,22.85,100,40,5,5,60,50,5,70,5,100,50,85,5,5,5,5,5}',
'{33,60,75,55,50,65,30,55,65,45,65,45,60,45,30,65,30,20,45,15,70,65,10,55,65,50,45,45,40,55,45,75,65,45,40,55,55,20.83,100,45,5,5,5,5,5,5,5,90,60,100,5,5,55,5,5}')