CREATE TABLE pivotes_generados(
	numero_pivote INT,
	pivote INT[55],
	CONSTRAINT pk_pivotes_generados PRIMARY KEY (numero_pivote)
);

ALTER TABLE pivotes_generados OWNER TO proyecto_gad;

CREATE OR REPLACE FUNCTION cargar_pivotes_generados() RETURNS VOID AS $BODY$
DECLARE
	pivote INT[];
BEGIN
	FOR i IN 1..55 LOOP
		pivote := array_fill(50, ARRAY[55]);
		pivote[i] := -10000;
		INSERT INTO pivotes_generados(numero_pivote, pivote) VALUES (i, pivote);
	END LOOP;
END;
$BODY$ LANGUAGE 'plpgsql'; 

ALTER FUNCTION cargar_pivotes_generados() OWNER TO proyecto_gad;

SELECT cargar_pivotes_generados();

-- Crea la tabla que contiene las firmas de los jugadores para los pivotes generados (ANDRES)
DROP TABLE jugador_fqa_full_generados;
CREATE TABLE jugador_fqa_full_generados(
	id SERIAL NOT NULL,
	firma INT[55],
	jugador INT,
CONSTRAINT pk_jugador_fqa_full_generados PRIMARY KEY (id)
CONSTRAINT fk_jugador_norm FOREIGN KEY (jugador) REFERENCES jugador_norm);

ALTER TABLE jugador_fqa_full_generados OWNER TO proyecto_gad;

COMMENT ON TABLE jugador_fqa_full_generados IS 'Esta tabla contiene las firmas de todos los jugadores respecto de los pivotes generados.'
