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

-- creo un índice sobre cada elemento de las firmas para optimizar las búsquedas en el FQA
CREATE INDEX idx_fqa_generados_1_30
	ON jugador_fqa_full_generados USING btree ((firma[1]), (firma[2]), (firma[3]), (firma[4]), (firma[5]), (firma[6]), (firma[7]), (firma[8]), (firma[9]), (firma[10]),
						(firma[11]), (firma[12]), (firma[13]), (firma[14]), (firma[15]), (firma[16]), (firma[17]), (firma[18]), (firma[19]), (firma[20]),
						(firma[21]), (firma[22]), (firma[23]), (firma[24]), (firma[25]), (firma[26]), (firma[27]), (firma[28]), (firma[29]), (firma[30]));
						
CREATE INDEX idx_fqa_generados_31_55
	ON jugador_fqa_full_generados USING btree ((firma[31]), (firma[32]), (firma[33]), (firma[34]), (firma[35]), (firma[36]), (firma[37]), (firma[38]), (firma[39]), (firma[40]),
						(firma[41]), (firma[42]), (firma[43]), (firma[44]), (firma[45]), (firma[46]), (firma[47]), (firma[48]), (firma[49]), (firma[50]),
						(firma[51]), (firma[52]), (firma[53]), (firma[54]), (firma[55]));
