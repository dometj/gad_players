# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jugador", force: true do |t|
    t.string  "nombre",                  limit: nil
    t.string  "pais",                    limit: nil
    t.string  "club",                    limit: nil
    t.string  "posicion",                limit: nil
    t.integer "edad"
    t.integer "aceleracion"
    t.integer "agresividad"
    t.integer "agilidad"
    t.integer "anticipacion"
    t.integer "balance"
    t.integer "valentia"
    t.integer "compostura"
    t.integer "concentracion"
    t.integer "corners"
    t.integer "creatividad"
    t.integer "centro"
    t.integer "decision"
    t.integer "determinacion"
    t.integer "gambeta"
    t.integer "remate"
    t.integer "primer_toque"
    t.integer "instinto"
    t.integer "cabezazo"
    t.integer "influencia"
    t.integer "salto"
    t.integer "tiro_lejano"
    t.integer "pase_largo"
    t.integer "marca"
    t.integer "forma_fisica_natural"
    t.integer "juego_sin_pelota"
    t.integer "velocidad"
    t.integer "pases"
    t.integer "penales"
    t.integer "posicionamiento"
    t.integer "tiros_libres"
    t.integer "resistencia"
    t.integer "fuerza"
    t.integer "entrada"
    t.integer "trabajo_en_equipo"
    t.integer "tecnica"
    t.integer "sacrificio"
    t.float   "porcentaje_atajadas"
    t.integer "unique_id"
    t.integer "pierna_derecha"
    t.integer "pierna_izquierda"
    t.integer "arquero"
    t.integer "libero"
    t.integer "lateral_derecho"
    t.integer "defensor_central"
    t.integer "lateral_izquierdo"
    t.integer "carrilero_derecho"
    t.integer "carrilero_izquierdo"
    t.integer "mediocampista_defensivo"
    t.integer "mediocampista_derecho"
    t.integer "mediocampista_central"
    t.integer "mediocampista_izquierdo"
    t.integer "mediapunta_derecho"
    t.integer "mediapunta_central"
    t.integer "mediapunta_izquierdo"
    t.integer "delantero"
    t.integer "fr"
    t.float   "ts_rating"
    t.float   "fs_rating"
    t.float   "dc_rating"
    t.float   "habilidad_actual"
    t.integer "altura"
    t.float   "peso"
  end

  create_table "jugador_norm", force: true do |t|
    t.integer "edad"
    t.integer "aceleracion"
    t.integer "agresividad"
    t.integer "agilidad"
    t.integer "anticipacion"
    t.integer "balance"
    t.integer "valentia"
    t.integer "compostura"
    t.integer "concentracion"
    t.integer "corners"
    t.integer "creatividad"
    t.integer "centro"
    t.integer "decision"
    t.integer "determinacion"
    t.integer "gambeta"
    t.integer "remate"
    t.integer "primer_toque"
    t.integer "instinto"
    t.integer "cabezazo"
    t.integer "influencia"
    t.integer "salto"
    t.integer "tiro_lejano"
    t.integer "pase_largo"
    t.integer "marca"
    t.integer "forma_fisica_natural"
    t.integer "juego_sin_pelota"
    t.integer "velocidad"
    t.integer "pases"
    t.integer "penales"
    t.integer "posicionamiento"
    t.integer "tiros_libres"
    t.integer "resistencia"
    t.integer "fuerza"
    t.integer "entrada"
    t.integer "trabajo_en_equipo"
    t.integer "tecnica"
    t.integer "sacrificio"
    t.float   "porcentaje_atajadas"
    t.integer "pierna_derecha"
    t.integer "pierna_izquierda"
    t.integer "arquero"
    t.integer "libero"
    t.integer "lateral_derecho"
    t.integer "defensor_central"
    t.integer "lateral_izquierdo"
    t.integer "carrilero_derecho"
    t.integer "carrilero_izquierdo"
    t.integer "mediocampista_defensivo"
    t.integer "mediocampista_derecho"
    t.integer "mediocampista_central"
    t.integer "mediocampista_izquierdo"
    t.integer "mediapunta_derecho"
    t.integer "mediapunta_central"
    t.integer "mediapunta_izquierdo"
    t.integer "delantero"
    t.integer "jugador"
  end

end
