-- crea el usuario con la clave: "gad"
CREATE ROLE proyecto_gad LOGIN
  ENCRYPTED PASSWORD 'md58c246ecb5b41ca68d8283a2eddf39bbb'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

--crea la base de datos
CREATE DATABASE proyecto_gad
  WITH OWNER = proyecto_gad
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_AR.UTF-8'
       LC_CTYPE = 'es_AR.UTF-8'
       CONNECTION LIMIT = -1;

--crea  la tabla de jugadores
CREATE TABLE jugador (id SERIAL, nombre VARCHAR, pais VARCHAR, club VARCHAR, posicion VARCHAR, edad INTEGER, aceleracion INTEGER,
agresividad INTEGER,agilidad INTEGER,anticipacion INTEGER,balance INTEGER,valentia INTEGER,compostura INTEGER,concentracion INTEGER,
corners INTEGER,creatividad INTEGER,centro INTEGER,decision INTEGER,determinacion INTEGER,gambeta INTEGER,remate INTEGER,
primer_toque INTEGER,instinto INTEGER,cabezazo INTEGER,influencia INTEGER,salto INTEGER,tiro_lejano INTEGER,pase_largo INTEGER,
marca INTEGER,forma_fisica_natural INTEGER,juego_sin_pelota INTEGER,velocidad INTEGER,pases INTEGER,penales INTEGER,
posicionamiento INTEGER,tiros_libres INTEGER, resistencia INTEGER,fuerza INTEGER,entrada INTEGER,trabajo_en_equipo INTEGER,
tecnica INTEGER,sacrificio INTEGER,porcentaje_atajadas FLOAT,unique_id INTEGER,pierna_derecha INTEGER,pierna_izquierda INTEGER,
arquero INTEGER,libero INTEGER,lateral_derecho INTEGER,defensor_central INTEGER,lateral_izquierdo INTEGER,
carrilero_derecho INTEGER,carrilero_izquierdo INTEGER,mediocampista_defensivo INTEGER,mediocampista_derecho INTEGER,
mediocampista_central INTEGER,mediocampista_izquierdo INTEGER,mediapunta_derecho INTEGER,mediapunta_central INTEGER,
mediapunta_izquierdo INTEGER,delantero INTEGER,FR INTEGER,TS_Rating FLOAT, FS_Rating FLOAT, DC_Rating FLOAT,
habilidad_actual FLOAT,altura INTEGER,peso REAL,
CONSTRAINT pk_jugador PRIMARY KEY(id));

ALTER TABLE jugador OWNER TO proyecto_gad;

--cargar el csv
COPY jugador FROM '/home/lautaro/Documentos/UTN-FRCU/5to/GAD/tp_final/clean_players.csv' DELIMITER ',' CSV;

-- Tabla normalizada para trabajar con el índice
CREATE TABLE jugador_norm (id SERIAL, 
edad INTEGER, -- Poner en la fd una ponderación baja
aceleracion INTEGER,
agresividad INTEGER,
agilidad INTEGER,
anticipacion INTEGER,
balance INTEGER,
valentia INTEGER,
compostura INTEGER,
concentracion INTEGER,
corners INTEGER,
creatividad INTEGER,
centro INTEGER, -- Que tan bien hecha los centros
decision INTEGER,
determinacion INTEGER,
gambeta INTEGER,
remate INTEGER,
primer_toque INTEGER,
instinto INTEGER,
cabezazo INTEGER,
influencia INTEGER,
salto INTEGER,
tiro_lejano INTEGER,
pase_largo INTEGER,
marca INTEGER,
forma_fisica_natural INTEGER,
juego_sin_pelota INTEGER,
velocidad INTEGER,
pases INTEGER,
penales INTEGER,
posicionamiento INTEGER,
tiros_libres INTEGER,
resistencia INTEGER,
fuerza INTEGER,
entrada INTEGER,
trabajo_en_equipo INTEGER,
tecnica INTEGER,
sacrificio INTEGER,
porcentaje_atajadas FLOAT,
pierna_derecha INTEGER,
pierna_izquierda INTEGER,
arquero INTEGER,
libero INTEGER,
lateral_derecho INTEGER,
defensor_central INTEGER,
lateral_izquierdo INTEGER,
carrilero_derecho INTEGER,
carrilero_izquierdo INTEGER,
mediocampista_defensivo INTEGER,
mediocampista_derecho INTEGER,
mediocampista_central INTEGER,
mediocampista_izquierdo INTEGER,
mediapunta_derecho INTEGER,
mediapunta_central INTEGER,
mediapunta_izquierdo INTEGER,
delantero INTEGER,
jugador INTEGER,
CONSTRAINT pk_jugador_norm PRIMARY KEY(id),
CONSTRAINT fk_jugador FOREIGN KEY(jugador) REFERENCES jugador(id));

ALTER TABLE jugador_norm OWNER TO proyecto_gad;

-- Agrego una columna a la tabla jugador_norm para indicar los pivotes y el nivel de cada uno
ALTER TABLE jugador_norm ADD COLUMN numero_pivote INT DEFAULT 0;

