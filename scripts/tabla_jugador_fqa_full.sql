CREATE TABLE jugador_fqa_full(
	id SERIAL NOT NULL,
	pivote1 REAL DEFAULT 0,
	pivote2 REAL DEFAULT 0,
	pivote3 REAL DEFAULT 0,
	pivote4 REAL DEFAULT 0,
	pivote5 REAL DEFAULT 0,
	pivote6 REAL DEFAULT 0,
	pivote7 REAL DEFAULT 0,
	pivote8 REAL DEFAULT 0,
	pivote9 REAL DEFAULT 0,
	pivote10 REAL DEFAULT 0,
	pivote11 REAL DEFAULT 0,
	pivote12 REAL DEFAULT 0,
	pivote13 REAL DEFAULT 0,
	pivote14 REAL DEFAULT 0,
	pivote15 REAL DEFAULT 0,
	pivote16 REAL DEFAULT 0,
	pivote17 REAL DEFAULT 0,
	pivote18 REAL DEFAULT 0,
	jugador INTEGER,
CONSTRAINT pk_jugador_fqa_full PRIMARY KEY (id));

ALTER TABLE jugador_fqa_full OWNER TO proyecto_gad;

COMMENT ON TABLE jugador_fqa_full IS 'Esta tabla contiene las firmas de todos los jugadores.'